/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this 
*/
package business;

import javax.persistence.*;
import java.util.Date;
import java.util.List;
@Entity
public class Staff extends Person {
    
    private double salary;
    
    @Temporal(TemporalType.DATE)   
    private Date workDate;
    
    @ManyToMany
    private List<Shift> listShift;
    public Staff() {
        super();
    }


    // Getters và setters

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public Date getWorkDate() {
        return workDate;
    }

    public void setWorkDate(Date workDate) {
        this.workDate = workDate;
    }

    public List<Shift> getListShift() {
        return listShift;
    }

    public void setListShift(List<Shift> listShift) {
        this.listShift = listShift;
    }
}