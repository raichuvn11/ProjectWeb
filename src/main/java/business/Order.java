/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package business;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ASUS
 */
@Entity
@Table(name = "Orders") // Renaming the table in the database
public class Order implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Furniture> listFurniture;
    
    @OneToOne
    @JoinColumn(name = "CUSTOMERID")
    private Customer customer;
    
    @Temporal(TemporalType.DATE)
    private Date orderDate;

    @Enumerated(EnumType.STRING)
    private OrderStatus status;

    public Order() {
    }

    public Order(List<Furniture> listFurniture, Customer customer, Date orderDate, OrderStatus status) {
        this.listFurniture = listFurniture;
        this.customer = customer;
        this.orderDate = orderDate;
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<Furniture> getListOrderItem() {
        return listFurniture;
    }

    public void setListOrderItem(List<Furniture> listOrderItem) {
        this.listFurniture = listOrderItem;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    public double getTotalAmount() {
        double totalAmount = 0;
        /*
        for (Furniture item : listFurniture) {
            totalAmount += item.getQuantity() * item.getFurniture().getFurniturePrice();
        }
         */

        return totalAmount;
    }
}
