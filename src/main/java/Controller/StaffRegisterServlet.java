package Controller;

import Database.DatabaseConnection;
import security.PasswordUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/StaffRegisterServlet")
public class StaffRegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String rawPassword = request.getParameter("password"); // Raw password
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String role = "Staff"; // Auto-assign Staff role
        String status = "active";

        String salary = request.getParameter("salary");
        String shift = request.getParameter("shift");
        String hireDate = request.getParameter("hire_date");
        String jobTitle = request.getParameter("job_title");

        // Hash the password
        String hashedPassword = PasswordUtils.hashPassword(rawPassword);

        Connection con = null;
        try {
            con = DatabaseConnection.getConnection();
            con.setAutoCommit(false);

            String userSql = "INSERT INTO users (first_name, last_name, username, phone, email, password, address, gender, role, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement userPst = con.prepareStatement(userSql, Statement.RETURN_GENERATED_KEYS);
            userPst.setString(1, firstName);
            userPst.setString(2, lastName);
            userPst.setString(3, username);
            userPst.setString(4, phone);
            userPst.setString(5, email);
            userPst.setString(6, hashedPassword); // Store hashed password
            userPst.setString(7, address);
            userPst.setString(8, gender);
            userPst.setString(9, role);
            userPst.setString(10, status);
            userPst.executeUpdate();

            ResultSet keys = userPst.getGeneratedKeys();
            int userId = -1;
            if (keys.next()) {
                userId = keys.getInt(1);
            } else {
                throw new SQLException("Failed to retrieve user ID.");
            }

            String staffSql = "INSERT INTO staff (staff_id, salary, shift, hire_date, job_title) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement staffPst = con.prepareStatement(staffSql);
            staffPst.setInt(1, userId);
            staffPst.setString(2, salary);
            staffPst.setString(3, shift);
            staffPst.setString(4, hireDate);
            staffPst.setString(5, jobTitle);
            staffPst.executeUpdate();

            con.commit();
            response.sendRedirect("create-staff.jsp?status=success");

        } catch (Exception e) {
            e.printStackTrace();
            try {
                if (con != null) con.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            response.sendRedirect("create-staff.jsp?status=error");

        } finally {
            try {
                if (con != null) con.close();
            } catch (SQLException ignored) {}
        }
    }
}
