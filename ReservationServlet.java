package myBean;

import java.io.*;
import java.util.Date;
import java.util.Random;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/reserve")
public class ReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ReservationServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		HttpSession session = request.getSession(false);
    	User currentUser = (User) session.getAttribute("user");
		
    	double cost;
        String checkInDate = request.getParameter("checkInDate");
        String checkOutDate = request.getParameter("checkOutDate");
        String amenity = request.getParameter("amenity");
        String attractions = request.getParameter("attractions");
        String guests = request.getParameter("totalGuests");
        
    	double price = 0f;
    	
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		System.out.println("arrival date: "+ checkInDate);
		System.out.println("depart date: "+ checkOutDate);
		
		LocalDate arrivalDate = LocalDate.parse(checkInDate, df);
		LocalDate departDate = LocalDate.parse(checkOutDate, df);
		
		long daysDiff = Date.from(departDate.atStartOfDay(ZoneId.systemDefault()).toInstant()).getTime() - 
				Date.from(arrivalDate.atStartOfDay(ZoneId.systemDefault()).toInstant()).getTime();
		long Difference_In_Days = Math.round(daysDiff / (1000 * 3600 * 24));
		
		System.out.println("Difference in days: "+ daysDiff);

		if (Integer.parseInt(guests) >= 3) {
			price = 157.50;
			price = price * Difference_In_Days;
		} else {
			price = 120.75;
			price = price * Difference_In_Days;
		}
		System.out.println("current price is: " + price);
        
        // System.out.println(price);
        
        int totalGuests = Integer.valueOf(guests);
        // double totalPrice = Double.valueOf(price);
        // System.out.println(totalPrice);
        int confirmationNum = numGen();
        
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd");
        
        try {
            DateTimeFormatter sqlTime = DateTimeFormatter.ofPattern("yyyy.MM.dd");
            LocalDate checkIn = LocalDate.parse(checkInDate, sqlTime);
            LocalDate checkOut = LocalDate.parse(checkOutDate, sqlTime);
            
            Reservation newReservation = new Reservation(checkIn, checkOut, totalGuests, price, confirmationNum);
            
            ReservationDAO reservationDAO = new ReservationDAO();
        	
            String result = reservationDAO.addReservation(currentUser, newReservation);
            String destPage = "reservation.jsp";
            
            System.out.println(checkIn);
            System.out.println(checkOut);
            System.out.println(guests);
            System.out.println(totalGuests);
            System.out.println("total price is: " + price);
            System.out.println(currentUser);
            System.out.println(newReservation.getConfirmationNum());
            System.out.println(currentUser.getUserID());
             
            if (currentUser != null) {
            	System.out.println("code read1");
                HttpSession session1 = request.getSession();
                session1.setAttribute("user", currentUser);
                request.setAttribute("checkInDate", checkInDate);
                request.setAttribute("checkOutDate", checkOutDate);
                request.setAttribute("totalGuests", totalGuests);
                request.setAttribute("totalPrice", price);
                request.setAttribute("confirmationNum", confirmationNum);
                System.out.println(request);
            }
                 
            if ("Successful reservation".equals(result)) {
            	System.out.println("code read");
                destPage = "reservation.jsp";
                request.setAttribute("confirmationNum", confirmationNum);
            } else {
                request.setAttribute("message", result);
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
        } catch (Exception e) {
        	System.out.println(checkInDate);
            System.out.println(checkOutDate);
            System.out.println(guests);
            System.out.println(totalGuests);
            System.out.println("total price is: " + price);
            System.out.println(currentUser);
            System.out.println(currentUser.getUserID());
            e.printStackTrace();
            response.getWriter().println("Database connection problem.");
        }
    }
    
    public int numGen() {
        Random r = new Random( System.currentTimeMillis());
        int confirm = (1 + r.nextInt(2)) * 10000 + r.nextInt(10000);
        return confirm;
    }
}
