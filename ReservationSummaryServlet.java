package myBean;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ReservationSummaryServlet")
public class ReservationSummaryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ReservationSummaryServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);  
        Reservation existingReservation = (Reservation) session.getAttribute("existingReservation");
        
        // Initialize database details
        String jdbcURL = "jdbc:mysql://localhost:3306/MoffatBayTest";
        String dbUser = "root";
        String dbPassword = "theAlphaBlack23@";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
                // Query to find user associated with the reservation
                String sql = "SELECT FirstName, LastName FROM users WHERE UserID = ?";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setInt(1, existingReservation.getUserID()); 
                    ResultSet resultSet = statement.executeQuery();
                    if (resultSet.next()) {
                        String firstName = resultSet.getString("FirstName");
                        String lastName = resultSet.getString("LastName");
                        String fullName = firstName + " " + lastName;
                        session.setAttribute("reservationName", fullName);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
        request.getRequestDispatcher("reservationSummary.jsp").forward(request, response);
    }
}
