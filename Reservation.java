package myBean;

import java.time.LocalDate;
import java.util.*; 

public class Reservation {
	//attributes
	private int reservationID;
	private LocalDate checkInDate;
	private LocalDate checkOutDate;
	private int totalGuests;
	private double totalPrice;
	private int confirmationNum;
	
	//no-arg constructor
	public Reservation() {
		super();
	}
		
	//args constructor
	public Reservation(LocalDate checkInDate, LocalDate checkOutDate, int totalGuests, double totalPrice, int confirmationNum) {
//		this.reservationID = reservationID;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.totalGuests = totalGuests;
		this.totalPrice = totalPrice;
		this.confirmationNum = confirmationNum;
	}
	
	//getters and setters
	public int getReservationID() {
		return reservationID;
		
	}
	
	public void setReservationID(int reservationID) {
		this.reservationID = reservationID;

	}
	
	public LocalDate getcheckInDate() {
		return checkInDate;
		
	}
	
	public void setcheckInDate(LocalDate checkInDate) {
		this.checkInDate = checkInDate;

	}
	
	public LocalDate getcheckOutDate() {
		return checkOutDate;
		
	}
	
	public void setcheckOutDate(LocalDate checkOutDate) {
		this.checkOutDate = checkOutDate;

	}
	
	public int getTotalGuests() {
		return totalGuests;
		
	}
	
	public void setTotalGuests(int totalGuests) {
		this.totalGuests = totalGuests;

	}
	
	public double getTotalPrice() {
		return totalPrice;
		
	}
	
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;

	}
	
	public int getConfirmationNum() {
		return confirmationNum;
		
	}
	
	public void setConfirmationNum(int confirmationNum) {
		this.confirmationNum = confirmationNum;

	}

}
