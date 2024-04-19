package myBean;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Random;
import java.util.List;

public class ReservationDAO {
    // Database properties
    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    // No-arg constructor
    public ReservationDAO() {
        
    }

    // Method to add a reservation to the database
    public String addReservation(Reservation newReservation) throws SQLException, ClassNotFoundException {
        String jdbcURL = "jdbc:mysql://localhost:3306/MoffatBayTest";
        String dbUser = "root";
        String dbPassword = "theAlphaBlack23@";
        String confirmationNumber = "";
        int reservationID = -1;
        String resultMessage = "";

        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            connection.setAutoCommit(false);  // Start transaction control

            try {
                // Generate unique confirmation number
                confirmationNumber = confirmationGenerator();
                newReservation.setConfirmationNumber(confirmationNumber);

                // Insert into Reservation Table
                String sql = "INSERT INTO reservations (CheckInDate, CheckOutDate, TotalGuests, ConfirmationNum) VALUES (?, ?, ?, ?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                    preparedStatement.setDate(1, new java.sql.Date(newReservation.getCheckInDate().getTime()));
                    preparedStatement.setDate(2, new java.sql.Date(newReservation.getCheckOutDate().getTime()));
                    preparedStatement.setInt(3, newReservation.getTotalGuests());
                    preparedStatement.setString(4, confirmationNumber);
                    preparedStatement.executeUpdate();

                    try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            reservationID = generatedKeys.getInt(1);  // Successfully retrieved generated key
                        }
                    }
                }

                if (reservationID != -1) {
                    // Insert into User_Reservations Table
                    sql = "INSERT INTO user_reservations (userID, ReservationID) VALUES (?, ?)";
                    try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                        preparedStatement.setInt(1, newReservation.getUserID());
                        preparedStatement.setInt(2, reservationID);
                        preparedStatement.executeUpdate();
                    }
                }

                connection.commit();
                resultMessage = "Reservation successfully created with Confirmation Number: " + confirmationNumber;
            } catch (SQLException e) {
                connection.rollback(); 
                e.printStackTrace();
                resultMessage = "Unable to create reservation: " + e.getMessage();
            }
        } 
        return resultMessage;
    }

    
    /* Method to pull reservation from the database
    public Reservation pullReservation(String confirmationNumber) throws SQLException, ClassNotFoundException {
        Reservation reservation = null;
        String jdbcURL = "jdbc:mysql://localhost:3306/hotelDB";
        String dbUser = "root";
        String dbPassword = "password";

        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        try {
            String sql = "SELECT * FROM reservations WHERE confirmationNumber = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, confirmationNumber);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                reservation = new Reservation(
                    resultSet.getInt("userID"),
                    resultSet.getDate("checkInDate"),
                    resultSet.getDate("checkOutDate"),
                    resultSet.getString("roomType"),
                    resultSet.getBigDecimal("roomPrice"),
                    resultSet.getInt("totalGuests"),
                    resultSet.getBigDecimal("totalCost"),
                    resultSet.getString("confirmationNumber")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (connection != null) connection.close();
            if (preparedStatement != null) preparedStatement.close();
        }
        return reservation;
    }*/

    // generate unique confirmation code
    private String confirmationGenerator() throws SQLException {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#";
        StringBuilder result;
        Random random = new Random();

        do {
            result = new StringBuilder();
            for (int i = 0; i < 12; i++) {
                result.append(characters.charAt(random.nextInt(characters.length())));
            }
            // Check if this number already exists in the database
            String sql = "SELECT count(*) FROM reservations WHERE confirmationNumber = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, result.toString());
            resultSet = preparedStatement.executeQuery();
            resultSet.next();
        } while (resultSet.getInt(1) > 0);

        return result.toString();
    }
}
