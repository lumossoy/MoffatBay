 // Green Team: Juan Taylor, Christopher Kaiser, Emely Pajarito, Estiven Hernandez
 // Purpose: Servlet to handle user registration requests from register.jsp
package myBean;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/signup")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String plainPassword = request.getParameter("password");
        String encryptedPassword = User.encryptPassword(plainPassword);
        String telephoneNumber = request.getParameter("telephone");
        
        System.out.println("Servlet  info:" + firstName);
        System.out.println("Servlet  info:" + lastName);
        System.out.println("Servlet  info:" + email);
        System.out.println("Servlet  info:" + plainPassword);
        System.out.println("Servlet  info:" + telephoneNumber);
        
        

        User newUser = new User(firstName, lastName, email, encryptedPassword, telephoneNumber);

        RegisterDAO registerDAO = new RegisterDAO();
        try {
            String result = registerDAO.addUser(newUser);
            String destPage = "registration.jsp";

            if ("New Account created! User registered.".equals(result)) {
                HttpSession session = request.getSession();
                session.setAttribute("user", newUser);
                destPage = "landingPage.jsp";
            } else {
                request.setAttribute("message", result);
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database connection problem.");
        }
    }
}
