package myBean;

import java.io.IOException;
import java.sql.SQLException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
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

        // Add a new reservation
        if ("createReservation".equals(action)) {
            User currentUser = (User) session.getAttribute("user");
            int userID = currentUser.getUserID();
            String checkInDate = request.getParameter("checkInDate");
            String checkOutDate = request.getParameter("checkOutDate");

            SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
            Date checkIn = null;
            Date checkOut = null;
            try {
                checkIn = formatter.parse(checkInDate);
                checkOut = formatter.parse(checkOutDate);
            } catch (java.text.ParseException e) {
                e.printStackTrace();
            }

            Reservation newReservation = new Reservation(userID, checkIn, checkOut, "");
            ReservationDAO reservationDAO = new ReservationDAO();
            
            // Pricing
            Pricing pricing = new Pricing();
            String[] roomTypes = request.getParameterValues("roomType");
            String[] totalGuests = request.getParameterValues("totalGuests");

            if (roomTypes != null) {
                for (int i = 0; i < roomTypes.length; i++) {
                    int guests = Integer.parseInt(totalGuests[i]);
                    BigDecimal roomPrice = getPriceBasedOnRoomTypeAndGuests(pricing, roomTypes[i], guests);
                    newReservation.addRoom(roomTypes[i], roomPrice, guests);
                }
            }

            try {
                String confirmationNumber = reservationDAO.addReservation(newReservation);
                request.setAttribute("confirmationNumber", confirmationNumber);
                request.setAttribute("totalPrice", newReservation.getTotalPrice().toPlainString());
                
                if (!confirmationNumber.contains("Unable to create reservation:")) {
                    
                	// Retrieve and set the full user name
                    String UserFullName = reservationDAO.searchUserName(userID);
                    newReservation.setUserName(UserFullName); 
                    session.setAttribute("Reservation", newReservation);
                }
            } catch (SQLException | ClassNotFoundException ex) {
                request.setAttribute("errorMessage", "Error creating reservation: " + ex.getMessage() + userID);
                request.getRequestDispatcher("reservation.jsp").forward(request, response);
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
                    String UserFullName = reservationDAO.searchUserName(existingReservation.getUserID());
                    existingReservation.setUserName(UserFullName);
                    session.setAttribute("Reservation", existingReservation);
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
}
