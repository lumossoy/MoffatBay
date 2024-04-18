package myBean;

import java.util.Date;
import java.util.List;

public class Reservation {
    // Attributes
    private String username;
    private String email;
    private Date checkInDate;
    private Date checkOutDate;
    private String roomType;
    private double roomPrice;
    private int totalGuests;
    private List<String> amenities;
    private List<String> attractions;
    private double totalCost;
    private String confirmationNumber;

    // No-arg constructor
    public Reservation() {
        super();
    }

    // Args constructor
    public Reservation(String username, String email, Date checkInDate, Date checkOutDate, String roomType,
                       double roomPrice, int totalGuests, List<String> amenities, List<String> attractions,
                       double totalCost, String confirmationNumber) {
        this.username = username;
        this.email = email;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.roomType = roomType;
        this.roomPrice = roomPrice;
        this.totalGuests = totalGuests;
        this.amenities = amenities;
        this.attractions = attractions;
        this.totalCost = totalCost;
        this.confirmationNumber = confirmationNumber;
    }

    // Getters and setters
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public double getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(double roomPrice) {
        this.roomPrice = roomPrice;
    }

    public int getTotalGuests() {
        return totalGuests;
    }

    public void setTotalGuests(int totalGuests) {
        this.totalGuests = totalGuests;
    }

    public List<String> getAmenities() {
        return amenities;
    }

    public void setAmenities(List<String> amenities) {
        this.amenities = amenities;
    }

    public List<String> getAttractions() {
        return attractions;
    }

    public void setAttractions(List<String> attractions) {
        this.attractions = attractions;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    public String getConfirmationNumber() {
        return confirmationNumber;
    }

    public void setConfirmationNumber(String confirmationNumber) {
        this.confirmationNumber = confirmationNumber;
    }
}
