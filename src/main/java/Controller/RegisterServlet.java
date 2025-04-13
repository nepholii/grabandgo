package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DAO.UserDAO;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

       
        if (username.length() < 5 || password.length() < 6) {
            response.sendRedirect("register.jsp?error=Username must be at least 5 characters and password at least 6 characters");
            return;
        }

        UserDAO dao = new UserDAO();
        try {
           
            boolean isRegistered = dao.registerUser(username, password, "CUSTOMER");

            if (isRegistered) {
                response.sendRedirect("login.jsp?message=Registration successful. Please login.");
            } else {
                response.sendRedirect("register.jsp?error=Registration failed. Username might already exist.");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=Internal server error. Please try again.");
        }
    }
}
