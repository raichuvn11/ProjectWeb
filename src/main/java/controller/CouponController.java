package controller;

import DatabaseModel.CategoryDAO;
import business.Coupon;
import DatabaseModel.CouponDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.text.ParseException;
import java.util.List;

import business.Category;

@WebServlet(name = "CouponController", urlPatterns = "/CouponController")
public class CouponController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CouponDAO couponDAO = new CouponDAO();
    private CategoryDAO categoryDAO = new CategoryDAO();
    String couponIdParam;
    String action;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        couponIdParam = request.getParameter("id");

        action = request.getParameter("action");

        List<Category> categories = categoryDAO.getAllCategories();
        request.getSession().setAttribute("categoryList", categories);
        request.setAttribute("categoryList", categories);

        List<Coupon> couponList = couponDAO.getAllCoupons();
        request.setAttribute("couponList", couponList);

        if (couponIdParam != null) {
            if (action.equals("delete")) {

                CouponDAO couponDAO = new CouponDAO();
                couponDAO.delete(couponIdParam);

                response.sendRedirect("CouponController");
                return;
            }
            Coupon coupon = couponDAO.getCouponById(couponIdParam);
            if (coupon != null) {
                if (coupon.getUseCondition().equals("product")) {
                    List<Category> selectedCategories = CouponDAO.getCategoriesByCoupon(couponIdParam);
                    request.setAttribute("selectedCategories", selectedCategories);
                }
                request.setAttribute("coupon", coupon);
            }

            // Chuyển hướng tới trang editCoupon.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("/editCoupon.jsp");
            dispatcher.forward(request, response);
            return;
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/coupon.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        action = request.getParameter("action");
        if (action.equals("add") || action.equals("edit")) {
            List<String> errors = new ArrayList<>();
            double minOrderValue = 0;
            List<Category> selectedCategories = new ArrayList<>();
            String couponName = request.getParameter("couponName");
            String couponType = request.getParameter("couponType");
            String couponValueStr = request.getParameter("couponValue");
            String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");
            String useLimitStr = request.getParameter("useLimit");
            String useCondition = request.getParameter("useCondition");
            if (action.equals("add")) {
                if (CouponDAO.existedCoupon(couponName)) errors.add("Mã khuyến mãi đã tồn tại.");
            }
            try {
                double couponValue = Double.parseDouble(couponValueStr);
                if ("percent".equalsIgnoreCase(couponType)) {
                    if (couponValue <= 0 || couponValue > 100) {
                        errors.add("Giá trị phần trăm phải lớn hơn 0 và không vượt quá 100.");
                    }
                } else if ("money".equalsIgnoreCase(couponType)) {
                    if (couponValue <= 0) {
                        errors.add("Giá trị phải lớn hơn 0");
                    }
                }
            } catch (NumberFormatException e) {
                errors.add("Giá trị coupon phải là một số hợp lệ.");
            }

            try {
                double useLimit = Integer.parseInt(useLimitStr);
                    if (useLimit <= 0 ) {
                        errors.add("Số lần áp dụng phải lớn hơn 0");
                    }
            } catch (NumberFormatException e) {
                errors.add("Số lần áp dụng không hợp lệ");
            }

            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Date startDate = null;
            Date endDate = null;

            try {
                if (startDateStr != null && !startDateStr.isEmpty()) {
                    startDate = sdf.parse(startDateStr);
                }
                if (endDateStr != null && !endDateStr.isEmpty()) {
                    endDate = sdf.parse(endDateStr);
                }

                if (startDate != null && endDate != null && !startDate.before(endDate)) {
                    errors.add("Ngày bắt đầu phải nhỏ hơn ngày kết thúc.");
                }
            } catch (ParseException e) {
                e.printStackTrace();
                errors.add("Định dạng ngày không hợp lệ.");
            }

            if ("all".equals(useCondition)) {
                selectedCategories = new ArrayList<>();
                minOrderValue = 0;
            } else if ("min".equals(useCondition)) {
                String minOrderValueStr = request.getParameter("minOrderValue");

                try {
                    minOrderValue = Double.parseDouble(minOrderValueStr);
                    if (minOrderValue <= 0 ) {
                        errors.add("Số tiền tối thiểu phải lớn hơn 0");
                    }
                }
                catch (NumberFormatException e) {
                    errors.add("Số tiền tối thiểu không hợp lệ");
                }
            } else if ("product".equals(useCondition)) {
                String[] categoryIds = request.getParameterValues("categoryIds");
                if (categoryIds != null) {
                    CategoryDAO categoryDAO = new CategoryDAO();
                    for (String categoryId : categoryIds) {
                        Category category = categoryDAO.getCategoryById(Long.parseLong(categoryId));
                        if (category != null) {
                            selectedCategories.add(category);
                        }
                    }
                }
            }
            if (!errors.isEmpty()) {

                request.getSession().setAttribute("errors", errors);
                request.getSession().setAttribute("couponName", couponName);
                request.getSession().setAttribute("couponType", couponType);
                request.getSession().setAttribute("couponValue", couponValueStr);
                request.getSession().setAttribute("startDate", startDateStr);
                request.getSession().setAttribute("endDate", endDateStr);
                request.getSession().setAttribute("useLimit", useLimitStr);
                request.getSession().setAttribute("useCondition", useCondition);

                if ("all".equals(useCondition)) {
                    selectedCategories = new ArrayList<>();
                    minOrderValue = 0;
                } else if ("min".equals(useCondition)) {
                    String minOrderValueStr = request.getParameter("minOrderValue");
                    request.getSession().setAttribute("minOrderValue", minOrderValueStr);

                } else if ("product".equals(useCondition)) {
                    String[] categoryIds = request.getParameterValues("categoryIds");
                    if (categoryIds != null) {
                        CategoryDAO categoryDAO = new CategoryDAO();
                        for (String categoryId : categoryIds) {
                            Category category = categoryDAO.getCategoryById(Long.parseLong(categoryId));
                            if (category != null) {
                                selectedCategories.add(category);
                            }
                        }
                    }
                    request.getSession().setAttribute("selectedCategories", selectedCategories);
                }

                // Điều hướng lại trang tùy theo hành động
                if (couponIdParam != null) {
                    response.sendRedirect("CouponController?id=" + couponIdParam + "&action=edit");
                } else {
                    response.sendRedirect("CouponController");
                }
                return;
            }
            double couponValue = Double.parseDouble(couponValueStr);



            int useLimit = Integer.parseInt(useLimitStr);
            Coupon coupon = new Coupon(couponName, couponType, couponValue, startDate, endDate, useCondition,
                    minOrderValue, selectedCategories, useLimit, useLimit);

            if (action.equals("add")) {
                couponDAO.insert(coupon);
                request.getSession().setAttribute("successMessageAdd", "Thêm mã giảm giá thành công.");
            } else if (action.equals("edit")) {
                Coupon couponToEdit = couponDAO.getCouponById(couponIdParam);
                if (couponToEdit != null) {
                    couponToEdit.setCouponName(couponName);
                    couponToEdit.setCouponType(couponType);
                    couponToEdit.setCouponValue(couponValue);
                    couponToEdit.setStartDate(startDate);
                    couponToEdit.setEndDate(endDate);
                    couponToEdit.setUseCondition(useCondition);
                    couponToEdit.setMinOrderValue(minOrderValue);
                    couponToEdit.setApplicableFurniture(selectedCategories);
                    couponToEdit.setUseLimit(useLimit);
                    couponDAO.update(couponToEdit);

                    // Lấy danh sách danh mục và các thông tin sửa đổi để hiển thị lại trên trang
                    List<Category> categoryList = categoryDAO.getAllCategories();
                    request.setAttribute("categoryList", categoryList);
                    request.setAttribute("coupon", couponToEdit);

                    if ("product".equals(couponToEdit.getUseCondition())) {
                        List<Category> updatedSelectedCategories = CouponDAO.getCategoriesByCoupon(couponIdParam);
                        request.setAttribute("selectedCategories", updatedSelectedCategories);
                    }

                    request.setAttribute("successMessage", "Cập nhật thông tin thành công.");

                    RequestDispatcher dispatcher = request.getRequestDispatcher("/editCoupon.jsp");
                    dispatcher.forward(request, response);
                    return;
                }
            }
        }
        response.sendRedirect("CouponController");
    }
}
