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
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

     
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String role = "Customer"; 
        String status = "Active"; 

 
        if (username == null || password == null || username.length() < 5 || password.length() < 6) {
            response.sendRedirect("register.jsp?error=Username must be at least 5 characters and password at least 6 characters");
            return;
        }

       
        Part filePart = request.getPart("image");
        String fileName;

        if (filePart != null && filePart.getSize() > 0) {
            fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();


      
            String projectPath = getServletContext().getRealPath("/images");
            File uploadFolder = new File(projectPath);
            if (!uploadFolder.exists()) uploadFolder.mkdir();


            String fullPath = projectPath + File.separator + fileName;
            filePart.write(fullPath); 

            System.out.println("Uploaded image saved to: " + fullPath);
        } else {
           
            fileName = "profile.png";
            System.out.println("No image uploaded. Using default image.");
        }
       
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

      
        try {
            UserDAO dao = new UserDAO();
            boolean isRegistered = dao.registerUser(user);

            if (isRegistered) {
                response.sendRedirect("login.jsp?message=Registration successful. Please login.");
            } else {
                response.sendRedirect("register.jsp?error=Registration failed. Username or email might already exist.");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=Internal server error. Please try again.");
        }
    }
}
