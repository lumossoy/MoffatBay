package myBean;

import java.util.Date;
import java.util.List;
import java.math.BigDecimal;

public class Reservation {
    // Attributes
    private int userID;
    private Date checkInDate;
    private Date checkOutDate;
    private String roomType;
    private BigDecimal roomPrice;
    private int totalGuests;
    private BigDecimal totalCost;
    private String confirmationNumber;

    // No-arg constructor
    public Reservation() {
        super();
    }

    // Args constructor
    public Reservation(int userID, Date checkInDate, Date checkOutDate, String roomType,
    		           BigDecimal roomPrice, int totalGuests, BigDecimal totalCost, String confirmationNumber) {
        this.userID = userID;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.roomType = roomType;
        this.roomPrice = roomPrice;
        this.totalGuests = totalGuests;
        this.totalCost = totalCost;
        this.confirmationNumber = confirmationNumber;
    }

    // Getters and setters
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Date getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(Date checkInDate) {
        this.checkInDate = checkInDate;
    }

    public Date getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public BigDecimal getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(BigDecimal roomPrice) {
        this.roomPrice = roomPrice;
    }

    public int getTotalGuests() {
        return totalGuests;
    }

    public void setTotalGuests(int totalGuests) {
        this.totalGuests = totalGuests;
    }

    public BigDecimal getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(BigDecimal totalCost) {
        this.totalCost = totalCost;
    }

    public String getConfirmationNumber() {
        return confirmationNumber;
    }

    public void setConfirmationNumber(String confirmationNumber) {
        this.confirmationNumber = confirmationNumber;
    }
}
