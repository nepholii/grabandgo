package Controller;

import DAO.UserDAO;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@WebServlet("/EditProfileServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1MB
    maxFileSize = 1024 * 1024 * 5,   // 5MB
    maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class EditProfileServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "images";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");
        
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            UserDAO userDAO = new UserDAO();
            boolean updateSuccess = true;
            
            // 1. Handle profile image upload if present
            String newImagePath = handleImageUpload(request, currentUser.getImage());
            if (newImagePath != null && !newImagePath.equals(currentUser.getImage())) {
                updateSuccess = userDAO.updateUserImage(currentUser.getId(), newImagePath);
                if (updateSuccess) {
                    currentUser.setImage(newImagePath);
                    session.setAttribute("image", newImagePath);
                }
            }
            
            // 2. Update basic info
            User updatedInfo = extractUserInfoFromRequest(request, currentUser);
            if (updateSuccess) {
                updateSuccess = userDAO.updateUserBasicInfo(updatedInfo);
                if (updateSuccess) {
                    // Update session with new info
                    updateSessionUser(session, currentUser, updatedInfo);
                }
            }
            
            // 3. Update password if provided
            String newPassword = request.getParameter("password");
            if (updateSuccess && newPassword != null && !newPassword.trim().isEmpty()) {
                updateSuccess = userDAO.updateUserPassword(currentUser.getId(), newPassword);
            }
            
            // Redirect with appropriate message
            if (updateSuccess) {
                session.setAttribute("successMessage", "Profile updated successfully!");
                response.sendRedirect("edit-profile.jsp");
            } else {
                request.setAttribute("errorMessage", "Failed to update profile");
                request.getRequestDispatcher("edit-profile.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("edit-profile.jsp").forward(request, response);
        }
    }
    
    private String handleImageUpload(HttpServletRequest request, String currentImage) 
            throws IOException, ServletException {
        Part filePart = request.getPart("profileImage");
        if (filePart == null || filePart.getSize() == 0) {
            return currentImage;
        }
        
        // Delete old image if it's not the default
        if (currentImage != null && !currentImage.isEmpty() && !currentImage.equals("profile.png")) {
            Path oldFilePath = Paths.get(getServletContext().getRealPath("") + File.separator + 
                                      UPLOAD_DIR + File.separator + currentImage);
            Files.deleteIfExists(oldFilePath);
        }
        
        // Save new image
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        
        String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
        Path filePath = Paths.get(uploadPath + File.separator + fileName);
        Files.copy(filePart.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
        
        return fileName;
    }
    
    private User extractUserInfoFromRequest(HttpServletRequest request, User currentUser) {
        User user = new User();
        user.setId(currentUser.getId());
        user.setFirstName(request.getParameter("firstName"));
        user.setLastName(request.getParameter("lastName"));
        user.setUsername(request.getParameter("username"));
        user.setEmail(request.getParameter("email"));
        user.setPhone(request.getParameter("phone"));
        user.setAddress(request.getParameter("address"));
        user.setGender(request.getParameter("gender"));
        return user;
    }
    
    private void updateSessionUser(HttpSession session, User currentUser, User updatedInfo) {
        currentUser.setFirstName(updatedInfo.getFirstName());
        currentUser.setLastName(updatedInfo.getLastName());
        currentUser.setUsername(updatedInfo.getUsername());
        currentUser.setEmail(updatedInfo.getEmail());
        currentUser.setPhone(updatedInfo.getPhone());
        currentUser.setAddress(updatedInfo.getAddress());
        currentUser.setGender(updatedInfo.getGender());
        session.setAttribute("user", currentUser);
    }
}