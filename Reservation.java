package myBean;

import java.util.ArrayList;
import java.util.Date;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;

public class Reservation {
    // Attributes
    private int userID;
    private String userName;
    private Date checkInDate;
    private Date checkOutDate;
    private String roomType;
    private BigDecimal roomPrice;
    private int totalGuests;
    private BigDecimal totalPrice;
    private String confirmationNumber;
    public ArrayList<Room> roomBookings = new ArrayList<>();


    // No-arg constructor
    public Reservation() {
        super();
    }

    // Args constructor
    public Reservation(int userID, Date checkInDate, Date checkOutDate, String confirmationNumber) {
        this.userID = userID;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.confirmationNumber = confirmationNumber;
        this.roomBookings = new ArrayList<>();
    }
    
    // function to add rooms
    public void addRoom(String roomType, BigDecimal roomPrice, int totalGuests) {
        Room newRoom = new Room(roomType, roomPrice, totalGuests);
        this.roomBookings.add(newRoom);
        calculateTotalPrice(); 
    }
    
    // function to calculate totalPrice
    public void calculateTotalPrice() {
        BigDecimal total = BigDecimal.ZERO;
        long diff = checkOutDate.getTime() - checkInDate.getTime();
        long days = diff / (1000 * 60 * 60 * 24);
        if (days <= 0) {
            days = 1;  
        }
        BigDecimal daysBigDecimal = BigDecimal.valueOf(days);

        for (Room room : roomBookings) {
            BigDecimal totalCostForRoom = room.getRoomPrice().multiply(daysBigDecimal);
            total = total.add(totalCostForRoom);
        }

        this.totalPrice = total;
    }
    
    // function to clean date for display
    public String cleanDate(Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
        return formatter.format(date);
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
        calculateTotalPrice(); 
    }

    public Date getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
        calculateTotalPrice();
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

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalCost) {
        this.totalPrice = totalCost;
    }

    public String getConfirmationNumber() {
        return confirmationNumber;
    }

    public void setConfirmationNumber(String confirmationNumber) {
        this.confirmationNumber = confirmationNumber;
    }
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    public ArrayList<Room> getRoomBookings() {
    	return roomBookings;
    }
}

