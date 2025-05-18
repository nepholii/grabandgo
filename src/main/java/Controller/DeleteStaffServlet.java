package Controller;

import DAO.StaffDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteStaffServlet")
public class DeleteStaffServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int staffId = Integer.parseInt(request.getParameter("staffId"));
            StaffDAO staffDAO = new StaffDAO();

            boolean deleted = staffDAO.deleteStaffById(staffId);

            if (deleted) {
                request.getSession().setAttribute("message", "Staff deleted successfully.");
            } else {
                request.getSession().setAttribute("message", "Staff not found or could not be deleted.");
            }

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("message", "Invalid Staff ID.");
        } catch (Exception e) {
            request.getSession().setAttribute("message", "An error occurred while deleting staff.");
            e.printStackTrace();
        }

        // Redirect back to delete-staff.jsp to show updated list
        response.sendRedirect("delete-staff.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("deleteStaff.jsp");
    }
}

