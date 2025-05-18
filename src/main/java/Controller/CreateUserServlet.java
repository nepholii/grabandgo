package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DAO.UserDAO;
import Model.User;

@WebServlet("/CreateUserServlet")
public class CreateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // ✅ Collect form data
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String role = "Customer"; // default role
        String status = "Active"; // default status

        // ✅ Basic input validation
        if (username.length() < 5 || password.length() < 6) {
            request.setAttribute("message", "Username must be at least 5 characters and password at least 6 characters.");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("create-user.jsp").forward(request, response);
            return;
        }

        // ✅ Create User object
        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setUsername(username);
        user.setPhone(phone);
        user.setEmail(email);
        user.setPassword(password);
        user.setAddress(address);
        user.setGender(gender);
        user.setRole(role);
        user.setStatus(status);

        // ✅ Register using DAO
        try {
            UserDAO dao = new UserDAO();
            boolean isRegistered = dao.registerUser(user);

            if (isRegistered) {
                request.setAttribute("message", "User created successfully!");
                request.setAttribute("messageType", "success");
            } else {
                request.setAttribute("message", "Username already exists.");
                request.setAttribute("messageType", "error");
            }

            request.getRequestDispatcher("create-user.jsp").forward(request, response);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("message", "Server error. Please try again.");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("create-user.jsp").forward(request, response);
        }
    }
}
