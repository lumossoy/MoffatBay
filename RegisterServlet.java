package myBean;

import java.io.*;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
Servlet Implementation class RegisterServlet
maybe change servlet to /register
also need to add password verfication to ensure password matches and meet requirements//hashing
ensure users cannot enter undesired elemets or characters into the fields
 */
@WebServlet("/signup")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public RegisterServlet() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.getWriter().append("Serverd at: ").append(request.getContextPath());
    	
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String telephoneNumber = request.getParameter("telephoneNumber");
        
        /*also need to add password verification to ensure password matches and meet requirements//hashing ensure 
         * users cannot enter undesired elements or characters into the fields
         *  */
        
        User newUser = new User(firstName, lastName, email, password, telephoneNumber);
         
        RegisterDAO registerDAO = new RegisterDAO();
        String result;
		try {
			result = registerDAO.addUser(newUser);
			response.getWriter().println(result);  
			String destPage = "registration.jsp";
            
            if (result == "New Account created! User registered.") {
                HttpSession session = request.getSession();
                session.setAttribute("user", newUser);
                destPage = "home.jsp";
            } else {
                String message = "Error";
                request.setAttribute("message", message);
            }
             
            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
               
    }
}