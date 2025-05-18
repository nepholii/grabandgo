package Controller;

import DAO.StaffDAO;
import Model.Staff;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/UpdateStaffServlet")
public class UpdateStaffServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int staffId = Integer.parseInt(request.getParameter("staffId"));
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String username = request.getParameter("username");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            double salary = Double.parseDouble(request.getParameter("salary"));
            String shift = request.getParameter("shift");
            String jobTitle = request.getParameter("jobTitle");
            String address = request.getParameter("address");

            // Parse datetime-local input to LocalDateTime
            String hireDateStr = request.getParameter("hireDate");
            LocalDateTime localDateTime = LocalDateTime.parse(hireDateStr, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
            Date hireDate = Date.valueOf(localDateTime.toLocalDate()); // Only the date part

            // Create and populate Staff object
            Staff staff = new Staff();
            staff.setStaffId(staffId);
            staff.setFirstName(firstName);
            staff.setLastName(lastName);
            staff.setUsername(username);
            staff.setPhone(phone);
            staff.setEmail(email);
            staff.setGender(gender);
            staff.setSalary(salary);
            staff.setShift(shift);
            staff.setHireDate(hireDate); 
            staff.setJobTitle(jobTitle);
            staff.setAddress(address); // missing
            staff.setRole("Staff");    // missing
            staff.setStatus("Active");  // missing


            // Update in DB
            StaffDAO staffDAO = new StaffDAO();
            staffDAO.updateStaff(staff);

            // Redirect after update
            response.sendRedirect("updateStaff.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error updating staff. Please try again.");
            request.getRequestDispatcher("editStaff.jsp").forward(request, response);
        }
    }
}

