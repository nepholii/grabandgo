package Controller;

import DAO.UserDAO;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get parameters from form
            int userId = Integer.parseInt(request.getParameter("userId"));
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String username = request.getParameter("username");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String status = request.getParameter("status");

            // Fetch existing user from DB
            User user = userDAO.getUserById(userId);

            if (user == null || !"Customer".equals(user.getRole())) {
                // User not found or not a customer
                request.setAttribute("errorMessage", "User not found or not a customer.");
                request.getRequestDispatcher("editUser.jsp").forward(request, response);
                return;
            }

            // Update user object with new values
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setUsername(username);
            user.setPhone(phone);
            user.setEmail(email);
            user.setGender(gender);
            user.setAddress(address);
            user.setStatus(status);

            // Call DAO to update user in DB
            boolean success = userDAO.updateUser(user);

            if (success) {
                // Redirect or show success
                response.sendRedirect("updateUser.jsp?message=User updated successfully");
            } else {
                // Update failed
                request.setAttribute("errorMessage", "Failed to update user.");
                System.out.println("errorrrrrrrr");
                request.getRequestDispatcher("editUser.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("editUser.jsp").forward(request, response);
        }
    }
}
