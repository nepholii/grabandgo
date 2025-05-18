package Controller;

import DAO.StaffDAO;
import Model.Staff;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewStaff") 
public class ViewStaffServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Retrieve all staff from DAO
            StaffDAO staffDAO = new StaffDAO();
            List<Staff> staffList = staffDAO.getAllStaff();

            // Store staff list in request scope
            request.setAttribute("staffList", staffList);

            // Forward to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewStaff.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            // Log error and show a user-friendly error message
            request.setAttribute("errorMessage", "Unable to load staff data. Please try again later.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
