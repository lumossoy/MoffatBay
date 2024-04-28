package myBean;

import java.math.BigDecimal;

public class Room {
    
	// Initialize variables
	private String roomType;
    private BigDecimal roomPrice;
    private int totalGuests;

    // Constructor
    public Room(String roomType, BigDecimal roomPrice, int totalGuests) {
        this.roomType = roomType;
        this.roomPrice = roomPrice;
        this.totalGuests = totalGuests;
    }

    // Getters and Setters
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
}
