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

@WebServlet("/CreateUserServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,       // 10MB
                 maxRequestSize = 1024 * 1024 * 50)    // 50MB
public class CreateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // ✅ Collect form fields
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

        // ✅ Validate fields
        if (username == null || password == null || username.length() < 5 || password.length() < 6) {
            request.setAttribute("message", "Username must be at least 5 characters and password at least 6 characters.");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("create-user.jsp").forward(request, response);
            return;
        }

        // ✅ Handle image upload
        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

     // Save uploaded image to 'images' directory in project root
        String uploadDir = getServletContext().getRealPath("") + File.separator + "images";
        File uploadFolder = new File(uploadDir);
        if (!uploadFolder.exists()) uploadFolder.mkdir();

        String imagePath = "images" + File.separator + fileName;
        String fullPath = uploadDir + File.separator + fileName;
        filePart.write(fullPath); // Saves file to disk


        // ✅ Create user object
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
        user.setImage(imagePath); // Save image path relative to app root

        // ✅ Register user
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
