package business;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
public class Shift implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long shiftID;
    private String shiftName;
    @Temporal(TemporalType.DATE)   
    private Date shiftDate;
    private String startTime;
    private String endTime;

    @ManyToMany(mappedBy = "listShift")
    private List<Staff> staffList;

    public Long getShiftID() {
        return shiftID;
    }

    public void setShiftID(Long shiftID) {
        this.shiftID = shiftID;
    }

    public String getShiftName() {
        return shiftName;
    }

    public void setShiftName(String shiftName) {
        this.shiftName = shiftName;
    }

    public Date getShiftDate() {
        return shiftDate;
    }

    public void setShiftDate(Date shiftDate) {
        this.shiftDate = shiftDate;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }   
}
