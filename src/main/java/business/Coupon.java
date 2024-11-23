package business;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
@Entity
public class Coupon implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String couponID;
    private String couponName;
    private String couponType;
    private double couponValue;
    @Temporal(TemporalType.DATE)
    private Date startDate;
    @Temporal(TemporalType.DATE)
    private Date endDate;
    private String useCondition;
    private double minOrderValue;
    @OneToMany
    private List<Category> applicableFurniture;
    private int useLimit;
    private int currentUsage;


    public Coupon() {}

    // Updated constructor
    public Coupon(String couponName, String couponType, double couponValue, Date startDate, Date endDate,
                  String useCondition, double minOrderValue, List<Category> applicableFurniture,
                  int useLimit, int currentUsage) {
        this.couponName = couponName;
        this.couponType = couponType;
        this.couponValue = couponValue;
        this.startDate = startDate;
        this.endDate = endDate;
        this.useCondition = useCondition;
        this.minOrderValue = minOrderValue;
        this.applicableFurniture = applicableFurniture;
        this.useLimit = useLimit;
        this.currentUsage = currentUsage;
    }

    public String getCouponID() {
        return couponID;
    }

    public void setCouponID(String couponID) {
        this.couponID = couponID;
    }

    public String getCouponName() {
        return couponName;
    }

    public void setCouponName(String couponName) {
        this.couponName = couponName;
    }

    public String getCouponType() {
        return couponType;
    }

    public void setCouponType(String couponType) {
        this.couponType = couponType;
    }

    public double getCouponValue() {
        return couponValue;
    }

    public void setCouponValue(double couponValue) {
        this.couponValue = couponValue;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getUseCondition() {
        return useCondition;
    }

    public void setUseCondition(String useCondition) {
        this.useCondition = useCondition;
    }

    public double getMinOrderValue() {
        return minOrderValue;
    }

    public void setMinOrderValue(double minOrderValue) {
        this.minOrderValue = minOrderValue;
    }



    public int getUseLimit() {
        return useLimit;
    }

    public void setUseLimit(int useLimit) {
        this.useLimit = useLimit;
    }

    public int getCurrentUsage() {
        return currentUsage;
    }

    public void setCurrentUsage(int currentUsage) {
        this.currentUsage = currentUsage;
    }

    public List<Category> getApplicableFurniture() {
        return applicableFurniture;
    }

    public void setApplicableFurniture(List<Category> applicableFurniture) {
        this.applicableFurniture = applicableFurniture;
    }

    public List<String> getNameApplicableFurniture() {
        if (applicableFurniture == null) {
            return Collections.emptyList();
        }
        return applicableFurniture.stream()
                .map(Category::getCategoryName)
                .collect(Collectors.toList());
    }
    public boolean isValidForOrder(Order order) {
        Date currentDate = new Date();
        if (currentDate.before(this.getStartDate()) || currentDate.after(this.getEndDate())) {
            return false;
        }
        return this.getCurrentUsage() <= this.getUseLimit();
    }
    public double calculateDiscount(Order order) {
        if (!isValidForOrder(order)) {
            return 0;
        }

        double discount = 0;

        // 1. Coupon loại "all" (Áp dụng cho toàn bộ đơn hàng)
        switch (this.getUseCondition()) {
            case "all" -> {
                if (this.getCouponType().equals("money")) {
                    discount = this.getCouponValue();
                } else {
                    discount = order.getTotalAmount() * (this.getCouponValue() / 100);
                }
            }
            // 2. Coupon loại "min" (Áp dụng nếu đơn hàng đạt giá trị tối thiểu)
            case "min" -> {
                if (order.getTotalAmount() < this.getMinOrderValue()) {
                    return 0;
                } else {
                    if (this.getCouponType().equals("money")) {
                        discount = this.getCouponValue();
                    } else {
                        discount = order.getTotalAmount() * (this.getCouponValue() / 100);
                    }
                }
            }

            // 3. Coupon loại "product" (Áp dụng cho các sản phẩm trong danh mục)
            case "product" -> {
                for (Furniture item : order.getListOrderItem()) {
                    // Kiểm tra xem sản phẩm có thuộc danh mục áp dụng coupon không
                    if (this.getNameApplicableFurniture().contains(item.getCategory().getCategoryName())) {
                        System.out.println(this.getApplicableFurniture());
                        if (this.getCouponType().equals("money")) {
                            discount = this.getCouponValue();
                        } else {
                            discount += item.getFurniturePrice() * (this.getCouponValue() / 100);
                        }
                    }
                }
            }
        }
        this.currentUsage++;
        return discount;
    }
}
