package services.impl;

import DAO.CategoryDAO;
import DAO.FurnitureDAO;
import DTO.request.FurnitureRequest;
import DTO.response.FurnitureResponse;
import ENumeration.EFurnitureStatus;
import Mapper.FurnitureMapper;
import Entity.Category;
import Entity.Furniture;
import Entity.Image;
import services.IFurnitureServices;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class FurnitureServiceImpl implements IFurnitureServices {
    private final FurnitureDAO furnitureDAO;
    private final FurnitureMapper furnitureMapper;
    private final CategoryDAO categoryDAO;
    public FurnitureServiceImpl() {
        this.furnitureDAO = new FurnitureDAO();
        this.furnitureMapper = new FurnitureMapper();
        this.categoryDAO = new CategoryDAO();
    }
    @Override
    public void addFurniture(FurnitureRequest furnitureRequest){
        if (furnitureRequest == null) {
            throw new IllegalArgumentException("FurnitureRequest cannot be null.");
        }
        // Lấy Category từ database
        Category category = categoryDAO.getCategoryByID(furnitureRequest.getCategoryId());
        if (category == null) {
            throw new IllegalArgumentException("Category with ID " + furnitureRequest.getCategoryId() + " does not exist.");
        }
        // Ánh xạ từ Request sang Entity

        // Kiểm tra sản phẩm đã tồn tại hay chưa
        Furniture existingFurniture = furnitureDAO.getFurnitureIfExists(
                category.getCategoryName(),
                furnitureRequest.getFurnitureColor(),
                furnitureRequest.getFurniturePrice()
        );
        Furniture furniture = furnitureMapper.toEntity(furnitureRequest, category);
        if (existingFurniture != null) {
            // Nếu tồn tại, chỉ cập nhật số lượng hoặc xử lý logic thêm tùy yêu cầu
            furniture.setFurnitureImages(existingFurniture.getFurnitureImages());
        }

        // Lưu sản phẩm vào cơ sở dữ liệu
        List<Furniture> furnitures = new ArrayList<>();
        furnitures.add(furniture);
        // Thêm các bản sao nếu cần
        for (int i = 1; i < furnitureRequest.getQuantity(); i++) {
            Furniture clonedFurniture = furnitureMapper.cloneFurniture(furniture);
            furnitures.add(clonedFurniture);
        }
        // Thêm tất cả các bản sao vào batch (nếu có)
        if (!furnitures.isEmpty()) {
            furnitureDAO.addFurniture(furnitures);
        }
    }
    @Override
    public FurnitureResponse updateFurniture(FurnitureRequest furnitureRequest) {
        Category category = categoryDAO.getCategoryByID(furnitureRequest.getCategoryId());
        // Chuyển đổi FurnitureRequest thành Furniture bằng phương thức toEntity
        Furniture furniture = furnitureMapper.toEntity(furnitureRequest, category);
        // Lưu ảnh đã xóa (nếu có)
        List<Image> existingImages = furnitureDAO.getImagesByFurnitureId(furniture.getId());
        // Loại bỏ ảnh bị xóa
        List<Long> removedImageIds = furnitureRequest.getRemovedImageIds();
        if (removedImageIds != null && !removedImageIds.isEmpty()) {
            existingImages.removeIf(image -> removedImageIds.contains(image.getId()));
        }
        // Cập nhật danh sách ảnh cũ + mới
        existingImages.addAll(furniture.getFurnitureImages());
        furniture.setFurnitureImages(existingImages);
        // Cập nhật sản phẩm trong cơ sở dữ liệu
        int updatedCount = furnitureDAO.updateFurnitureByCategory(furniture);
        if (updatedCount == 0) {
            throw new IllegalStateException("No furniture updated for category ID: " + furnitureRequest.getCategoryId());
        }

        furnitureDAO.deleteImagesByCategory(furnitureRequest.getCategoryId());

        List<Furniture> furnitureList = furnitureDAO.getFurnitureByCategoryID(furnitureRequest.getCategoryId());
        List<Image> newImages = new ArrayList<>();
        for (Furniture f : furnitureList) {
            for (Image img : furniture.getFurnitureImages()) {
                Image newImg = new Image();
                newImg.setData(img.getData());
                newImg.setFurniture(f); // Gắn ảnh mới vào Furniture tương ứng
                newImages.add(newImg);
            }
        }
        // 7. Lưu ảnh mới (batch insert)
        if (!newImages.isEmpty()) {
            furnitureDAO.saveImagesInBatch(newImages);
        }
        // 8. Chuyển đổi kết quả Furniture thành DTO để trả về
        return furnitureMapper.toDTO(furniture, 1L); // Chuyển Entity thành Response DTO
    }
    @Override
    public List<FurnitureResponse> getFurnitureList() {
        Map<Furniture, Long> furnitureMap = furnitureDAO.getFurnitureList();
        List<FurnitureResponse> furnitureResponseList = new ArrayList<>();
        for (Map.Entry<Furniture, Long> entry : furnitureMap.entrySet()) {
            Furniture furniture = entry.getKey();
            Long quantity = entry.getValue();
            FurnitureResponse dto = furnitureMapper.toDTO(furniture, quantity);
            furnitureResponseList.add(dto);
        }
        furnitureResponseList.sort(Comparator.comparing(FurnitureResponse::getId));//
        return furnitureResponseList;
    }
    @Override
    public FurnitureResponse getFurnitureByID(Long id){
        Furniture furniture = furnitureDAO.getFurnitureByID(id);
        if (furniture != null) {
            return furnitureMapper.toDTO(furniture, 1L);
        }
        return null;
    }
    @Override
    public void stopSellingFurniture(List<FurnitureResponse> furnitureResponseList) {
        List<Long> furnitureIds = furnitureResponseList.stream()
                .map(FurnitureResponse::getId)
                .collect(Collectors.toList());

        List<Furniture> furnitureList = furnitureDAO.getFurnitureByIDs(furnitureIds);
        for (Furniture furniture : furnitureList) {
            if (furniture.getFurnitureStatus() == EFurnitureStatus.ON_SALE) {
                furniture.setFurnitureStatus(EFurnitureStatus.STOP_SELLING);
            }
        }
        furnitureDAO.updateFurnitureList(furnitureList); // Batch update
    }
    @Override
    public void stopSellingFurnitureByCategory(Long categoryId){
        List<FurnitureResponse> furnitureResponseList = getFurnitureByCategoryID(categoryId);
        // Kiểm tra và dừng bán sản phẩm
        if (furnitureResponseList != null && !furnitureResponseList.isEmpty()) {
            stopSellingFurniture(furnitureResponseList);
        }
    }
    @Override
    public void restoreFurnitureByCategory(Long categoryId){
        List<FurnitureResponse> furnitureResponseList = getFurnitureByCategoryID(categoryId);
        // Kiểm tra và dừng bán sản phẩm
        if (furnitureResponseList != null && !furnitureResponseList.isEmpty()) {
            restoreFurniture(furnitureResponseList);
        }
    }
    @Override
    public void restoreFurniture(List<FurnitureResponse> furnitureResponseList) {
        List<Long> furnitureIds = furnitureResponseList.stream()
                .map(FurnitureResponse::getId)
                .collect(Collectors.toList());
        List<Furniture> furnitureList = furnitureDAO.getFurnitureByIDs(furnitureIds);
        for (Furniture furniture : furnitureList) {
            if (furniture.getFurnitureStatus() == EFurnitureStatus.STOP_SELLING) {
                furniture.setFurnitureStatus(EFurnitureStatus.ON_SALE);
            }
        }
        furnitureDAO.updateFurnitureList(furnitureList);
    }
    @Override
    public List<FurnitureResponse> getFurnitureByCategoryID(Long categoryID){
        List<Furniture> furnitureList = furnitureDAO.getFurnitureByCategoryID(categoryID);
        return furnitureList.stream()
                    .map(furniture -> furnitureMapper.toDTO(furniture, 1L))  // Pass both parameters
                    .collect(Collectors.toList());
    }
    @Override
    public List<FurnitureResponse> getFurnitureByFilters(Long categoryId, String priceRange) {
        // Bước 1: Lấy danh sách Furniture từ DAO dựa trên tiêu chí lọc
        List<Furniture> furnitureList = furnitureDAO.getFurnitureByFilters(categoryId, priceRange);
        // Bước 2: Sử dụng hàm mapper để chuyển đổi danh sách Entity thành danh sách DTO
        return furnitureList.stream()
                .map(furniture -> furnitureMapper.toDTO(
                        furniture,
                        furnitureDAO.countFurnitureByCategoryId(furniture.getCategory().getId())
                ))
                .collect(Collectors.toList());
    }
}