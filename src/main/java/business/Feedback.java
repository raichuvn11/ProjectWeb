/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package business;
import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToOne;

/**
 *
 * @author ADMIN
 */
@Entity
public class Feedback implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String feedbackID;
    @OneToOne
    @JoinColumn(name = "CUSTOMERID")
    private Customer customer;
    
    private String description;
    private int rate;
    @Lob
    private byte[] feedbackImage; // Thay đổi kiểu dữ liệu thành byte[]
    @OneToOne
    @JoinColumn(name = "ORDERID")
    private Order order;

    public String getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(String feedbackID) {
        this.feedbackID = feedbackID;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
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
}