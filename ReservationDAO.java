package myBean;

import java.sql.*;
import java.time.ZoneId;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Random;
import java.util.List;

public class ReservationDAO {
	//properties for the database connection
	java.sql.Connection connection = null;
	java.sql.Statement statement = null;
	java.sql.ResultSet resultSet = null;
	
	//no-arg constructor
	public ReservationDAO() {

	}

	
	//the add User method will check for existing e-mail then add the new user
	public String addReservation(User existingUser, Reservation newReservation) throws SQLException, ClassNotFoundException {
	    String jdbcURL = "jdbc:mysql://localhost:3306/MoffatBayTest";
	    String dbUser = "root";
	    String dbPassword = "theAlphaBlack23@";

	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	    String result = "Successful reservation";

	    try {
	    	//add new reservation
	        String addRes = "INSERT INTO reservations (checkInDate, checkOutDate, totalGuests, totalPrice, confirmationNum) VALUES (?,?,?,?,?)";
	        Date checkIn = java.sql.Date.valueOf(newReservation.getcheckInDate());
	        Date checkOut = java.sql.Date.valueOf(newReservation.getcheckOutDate());
	        
	    	PreparedStatement statement = connection.prepareStatement(addRes);
	        statement.setDate(1, checkIn);
	        statement.setDate(2, checkOut);
	        statement.setInt(3, newReservation.getTotalGuests());
	        statement.setDouble(4, newReservation.getTotalPrice());
	        statement.setInt(5, newReservation.getConfirmationNum());
	        statement.executeUpdate();
	        
	       
	        // Add new reservation to existing user
	        String sql = "INSERT INTO user_reservations (userID, reservationID)"
	        		+ "VALUES ((SELECT userID FROM users WHERE email = ?), (SELECT LAST_INSERT_ID()))";
	        PreparedStatement checkStatement = connection.prepareStatement(sql);
	        checkStatement.setInt(1, existingUser.getUserID());
	        checkStatement.executeUpdate();

	    } catch (Exception e) {
	        result = "Unable to add reservation!";
	        e.printStackTrace();
	    } finally {
	        connection.close();
	    }
	    return result;
	} 
}
