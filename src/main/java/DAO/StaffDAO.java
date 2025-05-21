package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Model.Staff;
import Database.DatabaseConnection;

public class StaffDAO {

    // Fetch all staff records
    public List<Staff> getAllStaff() throws ClassNotFoundException {
        List<Staff> staffList = new ArrayList<>();

        String sql = "SELECT u.user_id, u.first_name, u.last_name, u.username, u.phone, u.email, " +
                     "u.gender, u.address, u.role, u.status, s.salary, s.shift, s.hire_date, s.job_title " +
                     "FROM users u JOIN staff s ON u.user_id = s.staff_id " +
                     "WHERE u.role = 'Staff'";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Staff staff = new Staff();
                staff.setStaffId(rs.getInt("user_id"));
                staff.setFirstName(rs.getString("first_name"));
                staff.setLastName(rs.getString("last_name"));
                staff.setUsername(rs.getString("username"));
                staff.setPhone(rs.getString("phone"));
                staff.setEmail(rs.getString("email"));
                staff.setGender(rs.getString("gender"));
                staff.setAddress(rs.getString("address"));
                staff.setRole(rs.getString("role"));
                staff.setStatus(rs.getString("status"));
                staff.setSalary(rs.getDouble("salary"));
                staff.setShift(rs.getString("shift"));
                staff.setHireDate(rs.getDate("hire_date"));
                staff.setJobTitle(rs.getString("job_title"));

                staffList.add(staff);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching staff data: " + e.getMessage());
            e.printStackTrace();
        }

        return staffList;
    }

    // Get staff by ID
    public Staff getStaffById(int id) throws ClassNotFoundException {
        Staff staff = null;
        String sql = "SELECT u.user_id, u.first_name, u.last_name, u.username, u.phone, u.email, " +
                     "u.gender, u.address, u.role, u.status, s.salary, s.shift, s.hire_date, s.job_title " +
                     "FROM users u JOIN staff s ON u.user_id = s.staff_id WHERE u.user_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                staff = new Staff();
                staff.setStaffId(rs.getInt("user_id"));
                staff.setFirstName(rs.getString("first_name"));
                staff.setLastName(rs.getString("last_name"));
                staff.setUsername(rs.getString("username"));
                staff.setPhone(rs.getString("phone"));
                staff.setEmail(rs.getString("email"));
                staff.setGender(rs.getString("gender"));
                staff.setAddress(rs.getString("address"));
                staff.setRole(rs.getString("role"));
                staff.setStatus(rs.getString("status"));
                staff.setSalary(rs.getDouble("salary"));
                staff.setShift(rs.getString("shift"));
                staff.setHireDate(rs.getDate("hire_date"));
                staff.setJobTitle(rs.getString("job_title"));
            }

        } catch (SQLException e) {
            System.err.println("Error retrieving staff by ID: " + e.getMessage());
            e.printStackTrace();
        }

        return staff;
    }

    // Count total staff
    public static int getStaffCount() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM users WHERE role = 'Staff'";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error counting staff: " + e.getMessage());
            e.printStackTrace();
        }

        return count;
    }
 // Update existing staff
    public boolean updateStaff(Staff staff) throws ClassNotFoundException {
        String updateUsersSql = "UPDATE users SET first_name = ?, last_name = ?, username = ?, phone = ?, email = ?, " +
                                "gender = ?, address = ?, role = ?, status = ? WHERE user_id = ?";

        String updateStaffSql = "UPDATE staff SET salary = ?, shift = ?, hire_date = ?, job_title = ? WHERE staff_id = ?";

        try (Connection conn = DatabaseConnection.getConnection()) {
            conn.setAutoCommit(false); // Start transaction

            // Update 'users' table
            try (PreparedStatement psUser = conn.prepareStatement(updateUsersSql)) {
                psUser.setString(1, staff.getFirstName());
                psUser.setString(2, staff.getLastName());
                psUser.setString(3, staff.getUsername());
                psUser.setString(4, staff.getPhone());
                psUser.setString(5, staff.getEmail());
                psUser.setString(6, staff.getGender());
                psUser.setString(7, staff.getAddress());
                psUser.setString(8, staff.getRole());
                psUser.setString(9, staff.getStatus());
                psUser.setInt(10, staff.getStaffId());
                psUser.executeUpdate();
            }

            // Update 'staff' table
            try (PreparedStatement psStaff = conn.prepareStatement(updateStaffSql)) {
                psStaff.setDouble(1, staff.getSalary());
                psStaff.setString(2, staff.getShift());
                psStaff.setDate(3, new java.sql.Date(staff.getHireDate().getTime()));
                psStaff.setString(4, staff.getJobTitle());
                psStaff.setInt(5, staff.getStaffId());
                psStaff.executeUpdate();
            }

            conn.commit(); // Commit both updates
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean deleteStaffById(int staffId) throws ClassNotFoundException, Exception {
        boolean rowDeleted = false;
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM staff WHERE staff_id = ?")) {
            stmt.setInt(1, staffId);
            rowDeleted = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }
    public static int getStaffCountBySalaryRange(double min, double max) {
        int count = 0;
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT COUNT(*) FROM staff WHERE salary BETWEEN ? AND ?")) {
            ps.setDouble(1, min);
            ps.setDouble(2, max);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) count = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public static int getStaffCountBySalaryAbove(double min) {
        int count = 0;
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT COUNT(*) FROM staff WHERE salary > ?")) {
            ps.setDouble(1, min);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) count = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public static int getStaffCountByShift(String shift) {
        int count = 0;
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT COUNT(*) FROM staff WHERE shift = ?")) {
            ps.setString(1, shift);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) count = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }


}

