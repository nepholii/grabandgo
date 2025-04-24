package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.UserDAO;
import Model.User;
import security.PasswordUtils;

/**
 * Servlet implementation class UpdateCustomerServlet
 */
@WebServlet("/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
	        
	        HttpSession session = request.getSession(false);
	        Integer userId = (Integer) session.getAttribute("userId");
	        
	      
	        if (userId == null) {
	            response.sendRedirect("login.jsp?error=Session expired. Please login again.");
	            return;
	        }

	        String firstName = request.getParameter("first_name");
	        String lastName = request.getParameter("last_name");
	        String username = request.getParameter("username");
	        String phone = request.getParameter("phone");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        String address = request.getParameter("address");
	        String gender = request.getParameter("gender");

	        try {
	            UserDAO userDAO = new UserDAO();
	            User currentUser = userDAO.getUserById(userId);
	            
	           
	            User updatedUser = new User();
	            updatedUser.setId(userId);
	            updatedUser.setFirstName(firstName);
	            updatedUser.setLastName(lastName);
	            updatedUser.setUsername(username);
	            updatedUser.setPhone(phone);
	            updatedUser.setEmail(email);
	            updatedUser.setAddress(address);
	            updatedUser.setGender(gender);
	            updatedUser.setRole(currentUser.getRole());
	            updatedUser.setStatus(currentUser.getStatus());
	            
	          
	            if (password != null && !password.trim().isEmpty()) {
	                updatedUser.setPassword(PasswordUtils.hashPassword(password));
	            } else {
	                updatedUser.setPassword(currentUser.getPassword());
	            }

	          
	            boolean isUpdated = userDAO.updateUser(updatedUser);
	            
	            if (isUpdated) {
	                
	                session.setAttribute("username", username);
	                response.sendRedirect("customer-dashboard.jsp?success=Profile updated successfully");
	            } else {
	                response.sendRedirect("edit-profile.jsp?error=Failed to update profile");
	            }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("edit-profile.jsp?error=Server error: " + e.getMessage());
	        }
	    }

}
