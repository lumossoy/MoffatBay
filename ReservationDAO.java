package myBean;

import java.sql.*;
import java.util.Random;
import java.math.BigDecimal;

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
            connection.setAutoCommit(false); 

            // Generate unique confirmation number
            confirmationNum = confirmationGenerator(); 
            newReservation.setConfirmationNumber(confirmationNum);
            
            // Insert into Reservation Table
            String sql = "INSERT INTO reservations (UserID, CheckInDate, CheckOutDate, TotalPrice, ConfirmationNum) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                preparedStatement.setInt(1, newReservation.getUserID());
                preparedStatement.setDate(2, new java.sql.Date(newReservation.getCheckInDate().getTime()));
                preparedStatement.setDate(3, new java.sql.Date(newReservation.getCheckOutDate().getTime()));
                preparedStatement.setBigDecimal(4, newReservation.getTotalPrice());
                preparedStatement.setString(5, confirmationNum);
                preparedStatement.executeUpdate();

                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        reservationID = generatedKeys.getInt(1);
                    }
                }
            }

            if (reservationID != -1) {
                // Insert into Rooms Table
                sql = "INSERT INTO rooms (ReservationID, RoomType, RoomPrice, TotalGuests) VALUES (?, ?, ?, ?)";
                for (Room room : newReservation.roomBookings) {
                    try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                        preparedStatement.setInt(1, reservationID);
                        preparedStatement.setString(2, room.getRoomType());
                        preparedStatement.setBigDecimal(3, room.getRoomPrice());
                        preparedStatement.setInt(4, room.getTotalGuests());
                        preparedStatement.executeUpdate();
                    }
                }
            }

            connection.commit();
            resultMessage = confirmationNum;
        } catch (SQLException e) {
            if (connection != null) {
                connection.rollback(); 
            }
            e.printStackTrace();
            resultMessage = "Unable to create reservation: " + e.getMessage() + newReservation.getUserID();
        } finally {
            if (connection != null) {
                connection.setAutoCommit(true);  
                connection.close();  
            }
        }
        return resultMessage;
    }


    // Method to search for a reservation
    public Reservation searchReservation(String confirmationNum) throws SQLException, ClassNotFoundException {
        String jdbcURL = "jdbc:mysql://localhost:3306/MoffatBayTest";
        String dbUser = "root";
        String dbPassword = "theAlphaBlack23@";
        int reservationID = -1;
        int userID = -1;
        Date checkInDate = null;
        Date checkOutDate = null;
        BigDecimal totalPrice = null;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            // Fetch reservation details
            String sqlReservation = "SELECT ReservationID, UserID, CheckInDate, CheckOutDate, TotalPrice FROM reservations WHERE ConfirmationNum = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sqlReservation)) {
                preparedStatement.setString(1, confirmationNum);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        reservationID = resultSet.getInt("ReservationID");
                        userID = resultSet.getInt("UserID");
                        checkInDate = resultSet.getDate("CheckInDate");
                        checkOutDate = resultSet.getDate("CheckOutDate");
                        totalPrice = resultSet.getBigDecimal("TotalPrice");
                    }
                }
            }

            // Trigger reservation not found
            if (reservationID == -1) {
                return null; 
            }

            // Create the Reservation object
            Reservation reservation = new Reservation(userID, checkInDate, checkOutDate, confirmationNum);
            reservation.setTotalPrice(totalPrice);

            // Fetch room details
            String sqlRoom = "SELECT RoomType, RoomPrice, TotalGuests FROM rooms WHERE ReservationID = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sqlRoom)) {
                preparedStatement.setInt(1, reservationID);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        String roomType = resultSet.getString("RoomType");
                        BigDecimal roomPrice = resultSet.getBigDecimal("RoomPrice");
                        int totalGuests = resultSet.getInt("TotalGuests");
                        reservation.addRoom(roomType, roomPrice, totalGuests);
                    }
                }
            }

            return reservation;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Unable to retrieve reservation: " + e.getMessage());
        }
    }

    
    // Method to return the full user name
    public String searchUserName(int userID) throws SQLException, ClassNotFoundException {
        String jdbcURL = "jdbc:mysql://localhost:3306/MoffatBayTest";
        String dbUser = "root";
        String dbPassword = "theAlphaBlack23@";
        String fullName = null;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            String sql = "SELECT FirstName, LastName FROM users WHERE UserID = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, userID);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        String firstName = resultSet.getString("FirstName");
                        String lastName = resultSet.getString("LastName");
                        fullName = firstName + " " + lastName;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Unable to retrieve user name: " + e.getMessage());
        }
        return fullName;
    }

    
    
   // function to simulate a unique confirmation code
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
