package business;
import business.Furniture;
import javax.persistence.*;

import java.io.Serializable;
import java.util.Base64;

@Entity
public class Review implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private  Long id;
    @OneToOne
    @JoinColumn(name = "CUSTOMERID")
    private Customer customer;

    private String description;
    private int rate;
    @Lob
    private byte[] feedbackImage; // Thay đổi kiểu dữ liệu thành byte[]

    @OneToOne
    @JoinColumn(name = "CATEGORYID")
    private  Category category;

    @OneToOne
    @JoinColumn(name = "ORDERID")
    private  Order  order;



    @Transient // Không lưu thuộc tính này vào cơ sở dữ liệu
    private String base64Data;


    public Long getID() {
        return id;
    }

    public void setID(Long id ){
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder (Order order) {
        this.order = order;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public byte[] getFeedbackImage() {
        return feedbackImage;
    }

    public void setFeedbackImage(byte[] feedbackImage) {
        this.feedbackImage = feedbackImage;
    }

    // Constructor, getters và setters
    public String getBase64Data() {
        if (this.feedbackImage != null) {
            String base64String = Base64.getEncoder().encodeToString(this.feedbackImage);
            System.out.println("Base64 Data: " + base64String); // In ra giá trị Base64
            return base64String;        }
        return null;  // Trả về null nếu không có dữ liệu
    }
    public void setBase64Data(String base64Data) {
        this.base64Data = base64Data;
    }


}
