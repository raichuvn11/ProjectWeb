package business;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@MappedSuperclass
public abstract class Person implements Serializable {

    @Id
    private String personID;

    private String name;
    
    @Temporal(TemporalType.DATE)
    private Date birthDate;

    @OneToOne
    @JoinColumn(name = "ADDRESSID") // Tên cột khóa ngoại trùng với tên khóa chính của Address
    private Address address;
    private String email;
    private String password;
    private String phone;
    @Lob
    private byte[] avatar;

    public Person() {
    }

    public Person(String personID, String name, Date birthDate, Address address, String email, String password, String phone, byte[] avatar) {
        this.personID = personID;
        this.name = name;
        this.birthDate = birthDate;
        this.address = address;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.avatar = avatar;
    }

    public String getPersonID() {
        return personID;
    }

    public void setPersonID(String personID) {
        this.personID = personID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public byte[] getAvatar() {
        return avatar;
    }

    public void setAvatar(byte[] avatar) {
        this.avatar = avatar;
    }
    
}
