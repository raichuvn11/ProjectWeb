package business;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
public class Employee implements Serializable
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int empId;
    private String empName;
    private String email;
    private String phone;
    private Date birthDate;
    private Date workDate;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="address_id", referencedColumnName = "id")
    private Address address;
    private Double salary;
    @Lob
    private byte[] avatar;

    public Employee()
    {
        empName="";
        email="";
        phone="";
        birthDate=new Date();
        workDate=new Date();
        address=new Address();
        salary=0.0;
        avatar=null;
    }
    public int getEmpId()
    {
        return empId;
    }
    public void setEmpId(int empId){
        this.empId=empId;
    }
    public String getEmpName(){
        return empName;
    }
    public void setEmpName(String empName){
        this.empName=empName;
    }
    public String getEmail(){
        return email;
    }
    public void setEmail(String email){
        this.email=email;
    }
    public String getPhone(){
        return phone;
    }
    public void setPhone(String phone){
        this.phone=phone;
    }
    public Date getBirthDate(){
        return birthDate;
    }
    public void setBirthDate(Date birthDate){
        this.birthDate=birthDate;
    }
    public Date getWorkDate(){
        return workDate;
    }
    public void setWorkDate(Date workDate){
        this.workDate=workDate;
    }
    public Address getAddress(){
        return address;
    }
    public void setAddress(Address address){
        this.address=address;
    }
    public Double getSalary(){
        return salary;
    }
    public void setSalary(Double salary){
        this.salary=salary;
    }
    public byte[] getAvatar(){
        return avatar;
    }
    public void setAvatar(byte[] avatar){
        this.avatar=avatar;
    }

}