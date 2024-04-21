package myBean;

import java.io.IOException;
import java.sql.SQLException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ReservationServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	String action = request.getParameter("action");
    	if ("createReservation".equals(action)) { 
    	    User currentUser = (User) session.getAttribute("user");
            int userID = currentUser.getUserID();
            String checkInDate = request.getParameter("checkInDate");
            String checkOutDate = request.getParameter("checkOutDate");
            String roomType = request.getParameter("roomType");
            int totalGuests = Integer.parseInt(request.getParameter("totalGuests"));

            SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
            Date checkIn = null;
            Date checkOut = null;
            try {
                checkIn = formatter.parse(checkInDate);
                checkOut = formatter.parse(checkOutDate);
            } catch (java.text.ParseException e) {
                e.printStackTrace();
            }

            // Calculate Total Cost
            Pricing pricing = new Pricing();
            BigDecimal roomPrice = getPriceBasedOnRoomTypeAndGuests(pricing, roomType, totalGuests);
            BigDecimal totalCost = calculateTotalCost(checkIn, checkOut, roomPrice);
            
            // Build necessary Objects
            Reservation newReservation = new Reservation(userID, checkIn, checkOut, roomType, roomPrice, totalGuests, totalCost, "");
            ReservationDAO reservationDAO = new ReservationDAO();

            try {
                String confirmationNumber = reservationDAO.addReservation(newReservation);
                request.setAttribute("confirmationNumber", confirmationNumber);
                request.setAttribute("totalCost", totalCost.toPlainString());
            
                if (!confirmationNumber.contains("Unable to create reservation:")) {
                    session.setAttribute("Reservation", newReservation);
                    request.getRequestDispatcher("reservation.jsp").forward(request, response);
                }
            }
            catch (SQLException | ClassNotFoundException ex) {
                request.setAttribute("errorMessage", "Error creating reservation: " + ex.getMessage() + userID);
            }
            request.getRequestDispatcher("reservationSummary.jsp").forward(request, response);
        }
    	
    	// Search for existing Reservation
    	if ("searchReservation".equals(action)) {
            String ConfirmationNum = request.getParameter("searchReservation");
            ReservationDAO reservationDAO = new ReservationDAO();
            try {
                Reservation existingReservation = reservationDAO.searchReservation(ConfirmationNum);
                if (existingReservation == null) {
                    request.setAttribute("errorMessage", "No reservation found with that confirmation number.");
                    request.getRequestDispatcher("reservation.jsp").forward(request, response);
                } else {
                    session.setAttribute("Reservation", existingReservation);
                    request.setAttribute("errorMessage", "Reservation found");
                    request.getRequestDispatcher("reservationSummary.jsp").forward(request, response);
                }
            } catch (SQLException | ClassNotFoundException ex) {
                request.setAttribute("errorMessage", "Error while searching for reservation: " + ex.getMessage());
                request.getRequestDispatcher("reservation.jsp").forward(request, response);
            }
        }
    }

    private BigDecimal getPriceBasedOnRoomTypeAndGuests(Pricing pricing, String roomType, int totalGuests) {
        switch (roomType) {
            case "double full beds":
                return (totalGuests >= 3) ? pricing.getRoomDoubleFullHiCap() : pricing.getRoomDoubleFull();
            case "queen":
                return (totalGuests >= 3) ? pricing.getRoomQueenHiCap() : pricing.getRoomQueen();
            case "double queen":
                return (totalGuests >= 3) ? pricing.getRoomDoubleQueenHiCap() : pricing.getRoomDoubleQueen();
            case "king":
                return (totalGuests >= 3) ? pricing.getRoomKingHiCap() : pricing.getRoomKing();
            default:
                return new BigDecimal("0.00");
        }
    }

    private BigDecimal calculateTotalCost(Date checkIn, Date checkOut, BigDecimal roomPrice) {
        long diff = checkOut.getTime() - checkIn.getTime();
        long days = diff / (1000 * 60 * 60 * 24);
        BigDecimal daysBigDecimal = BigDecimal.valueOf(days);
        BigDecimal totalCost = roomPrice.multiply(daysBigDecimal);      
        return totalCost;
    }
}
