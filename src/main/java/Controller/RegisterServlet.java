package Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DAO.UserDAO;
import Model.User;

@WebServlet("/RegisterServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10,      // 10MB
maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class RegisterServlet extends HttpServlet {
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
        String role = "Customer"; // default
        String status = "Active"; // default

        // ✅ Basic input validation
        if (username == null || password == null || username.length() < 5 || password.length() < 6) {
            response.sendRedirect("register.jsp?error=Username must be at least 5 characters and password at least 6 characters");
            return;
        }

        // ✅ Handle profile image
        Part filePart = request.getPart("image");  // "image" is the name attribute in your input file field

        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        String uploadPath = getServletContext().getRealPath("/uploaded_images");
        System.out.println("Upload folder path: " + uploadPath);

        File uploadDir = new File(uploadPath);
        
        if (!uploadDir.exists()) uploadDir.mkdir();  // Create folder if doesn't exist

        filePart.write(uploadPath + File.separator + fileName);
        
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
        user.setImage(fileName);

        // ✅ Register using DAO
        try {
            UserDAO dao = new UserDAO();
            boolean isRegistered = dao.registerUser(user);

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
