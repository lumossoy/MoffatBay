package myBean;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Random;
import java.util.List;

public class ReservationDAO {
    // Database properties
	java.sql.Connection connection = null;
	java.sql.Statement preparedStatement = null;
    java.sql.ResultSet resultSet = null;
    
    // No-arg constructor
    public ReservationDAO() {
        
    }

    // Method to add a reservation to the database
    public String addReservation(Reservation newReservation) throws SQLException, ClassNotFoundException {
        String jdbcURL = "jdbc:mysql://localhost:3306/MoffatBayTest";
        String dbUser = "root";
        String dbPassword = "theAlphaBlack23@";
        String confirmationNum = "";
        int reservationID = -1;
        String resultMessage = "";

        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            connection.setAutoCommit(false);  // Disable auto-commit to manually control the transaction

            // Generate unique confirmation number
            confirmationNum = confirmationGenerator(); 
            newReservation.setConfirmationNumber(confirmationNum);

            // Insert into Reservation Table
            String sql = "INSERT INTO reservations (CheckInDate, CheckOutDate, TotalGuests, ConfirmationNum) VALUES (?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                preparedStatement.setDate(1, new java.sql.Date(newReservation.getCheckInDate().getTime()));
                preparedStatement.setDate(2, new java.sql.Date(newReservation.getCheckOutDate().getTime()));
                preparedStatement.setInt(3, newReservation.getTotalGuests());
                preparedStatement.setString(4, confirmationNum);
                preparedStatement.executeUpdate();

                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        reservationID = generatedKeys.getInt(1);
                    }
                }
            }

            /*if (reservationID != -1) {
                // Insert into User_Reservations Table
                sql = "INSERT INTO user_reservations (userID, ReservationID) VALUES (?, ?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setInt(1, newReservation.getUserID());
                    preparedStatement.setInt(2, reservationID);
                    preparedStatement.executeUpdate();
                }
            }*/

            connection.commit();
            resultMessage = "Reservation successfully created with Confirmation Number: " + confirmationNum;
        } catch (SQLException e) {
            if (connection != null) {
                connection.rollback(); // Rollback the transaction on error
            }
            e.printStackTrace();
            resultMessage = "Unable to create reservation: " + e.getMessage() + newReservation.getUserID();
        } finally {
            if (connection != null) {
                connection.setAutoCommit(true);  // Restore auto-commit before closing
                connection.close();  // Ensure the connection is closed
            }
        }

        return resultMessage;
    }

 
   // generate unique confirmation code
    private String confirmationGenerator() throws SQLException, ClassNotFoundException {
        String jdbcURL = "jdbc:mysql://localhost:3306/MoffatBayTest";
        String dbUser = "root";
        String dbPassword = "theAlphaBlack23@";
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder confirmationCode;
        Random random = new Random();
        String sql = "SELECT count(*) FROM reservations WHERE confirmationNum = ?";

        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            while (true) {
                confirmationCode = new StringBuilder();
                for (int i = 0; i < 12; i++) {
                    confirmationCode.append(characters.charAt(random.nextInt(characters.length())));
                }

                preparedStatement.setString(1, confirmationCode.toString());
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    resultSet.next();
                    if (resultSet.getInt(1) == 0) {
                        break; 
                    }
                }
            }

            return confirmationCode.toString();
        } catch (SQLException e) {
            // Handle possible SQL exceptions here
            throw new RuntimeException("SQL error occurred in confirmation generator", e);
        }
    }
}
