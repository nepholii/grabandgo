package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import Model.User;
import security.PasswordUtils;
import Database.DatabaseConnection;

public class UserDAO {
	
	
    public boolean registerUser(User user) throws ClassNotFoundException {
        String checkQuery = "SELECT COUNT(*) FROM users WHERE username = ?";
        String insertQuery = "INSERT INTO users (first_name, last_name, username, phone, email, password, address, gender, role, status, image_path) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
             PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {

            checkStmt.setString(1, user.getUsername());
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                System.out.println("⚠️ Registration Failed: Username already exists.");
                return false;
            }

          
            String hashedPassword = PasswordUtils.hashPassword(user.getPassword());

            // Insert user into database
            insertStmt.setString(1, user.getFirstName());
            insertStmt.setString(2, user.getLastName());
            insertStmt.setString(3, user.getUsername());
            insertStmt.setString(4, user.getPhone());
            insertStmt.setString(5, user.getEmail());
            insertStmt.setString(6, hashedPassword);
            insertStmt.setString(7, user.getAddress());
            insertStmt.setString(8, user.getGender());
            insertStmt.setString(9, user.getRole());
            insertStmt.setString(10, user.getStatus());
            insertStmt.setString(11, user.getImage());

            int rowsInserted = insertStmt.executeUpdate();
            System.out.println(" Registration Successful. Rows Inserted: " + rowsInserted);
            return rowsInserted > 0;

        } catch (SQLException e) {
            System.err.println(" SQL Error during registration: " + e.getMessage());
            e.printStackTrace();
        }

        return false;
    }

   
    public User validateUser(String username, String password) throws ClassNotFoundException {
        String query = "SELECT * FROM users WHERE username = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String storedHashedPassword = rs.getString("password");

                if (PasswordUtils.checkPassword(password, storedHashedPassword)) {
                   
                    User user = new User();
                    user.setId(rs.getInt("user_id"));
                    user.setFirstName(rs.getString("first_name"));
                    user.setLastName(rs.getString("last_name"));
                    user.setUsername(rs.getString("username"));
                    user.setPhone(rs.getString("phone"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(storedHashedPassword);
                    user.setAddress(rs.getString("address"));
                    user.setGender(rs.getString("gender"));
                    user.setRole(rs.getString("role"));
                    user.setStatus(rs.getString("status"));
                    user.setImage(rs.getString("image_path"));

                    return user;
                }
            }

            rs.close();
        } catch (SQLException e) {
            System.err.println("SQL Error during login: " + e.getMessage());
            e.printStackTrace();
        }

        return null;
    }
   
   

    public static int getUserCount() {
        int count = 0;
        try {
            Connection con = DatabaseConnection.getConnection();
            String sql = "SELECT COUNT(*) FROM users";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    public static int getUserCountByRole(String role) {
        int count = 0;
        try {
             // your DB connection method
        	Connection conn = DatabaseConnection.getConnection();
            String sql = "SELECT COUNT(*) FROM users WHERE role = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, role);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    public List<User> getUsersByRole(String role) throws ClassNotFoundException {
        List<User> users = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE role = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, role);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("user_id")); // MATCHES your DB
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setUsername(rs.getString("username"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setGender(rs.getString("gender"));
                user.setRole(rs.getString("role"));
                user.setStatus(rs.getString("status"));
                users.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }
    public User getUserById(int id) {
        User user = null;
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE user_id = ? AND role = 'Customer'";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("user_id"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setUsername(rs.getString("username"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setGender(rs.getString("gender"));
                user.setRole(rs.getString("role"));
                user.setStatus(rs.getString("status"));
            }

            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    public boolean updateUser(User user) throws ClassNotFoundException {
        String sql = "UPDATE users SET first_name=?, last_name=?, username=?, phone=?, email=?, status=?, address=?, gender=? WHERE user_id=?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getUsername());
            stmt.setString(4, user.getPhone());
            stmt.setString(5, user.getEmail());
            stmt.setString(6, user.getStatus());
            stmt.setString(7, user.getAddress());
            stmt.setString(8, user.getGender());
            stmt.setInt(9, user.getId()); // Make sure user.getId() returns user_id

            int rowsUpdated = stmt.executeUpdate();
            System.out.println("Rows updated: " + rowsUpdated);  // Debug info

            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    public boolean deleteUser(int userId) throws ClassNotFoundException {
        String findCartIdsSql = "SELECT cart_id FROM cart WHERE customer_id = ?";
        String deleteCartFoodSql = "DELETE FROM cart_food WHERE cart_id = ?";
        String deleteCartSql = "DELETE FROM cart WHERE customer_id = ?";
        String deleteUserSql = "DELETE FROM users WHERE user_id = ?";

        try (Connection conn = DatabaseConnection.getConnection()) {
            conn.setAutoCommit(false);

            try (
                PreparedStatement findCartStmt = conn.prepareStatement(findCartIdsSql);
                PreparedStatement deleteCartFoodStmt = conn.prepareStatement(deleteCartFoodSql);
                PreparedStatement deleteCartStmt = conn.prepareStatement(deleteCartSql);
                PreparedStatement deleteUserStmt = conn.prepareStatement(deleteUserSql)
            ) {
                // 1. Find all cart_ids of the user
                findCartStmt.setInt(1, userId);
                ResultSet rs = findCartStmt.executeQuery();

                // 2. For each cart_id, delete from cart_food
                while (rs.next()) {
                    int cartId = rs.getInt("cart_id");
                    deleteCartFoodStmt.setInt(1, cartId);
                    deleteCartFoodStmt.executeUpdate();
                }

                // 3. Delete from cart
                deleteCartStmt.setInt(1, userId);
                deleteCartStmt.executeUpdate();

                // 4. Delete user
                deleteUserStmt.setInt(1, userId);
                int rowsAffected = deleteUserStmt.executeUpdate();

                conn.commit();
                return rowsAffected > 0;

            } catch (SQLException e) {
                conn.rollback();
                e.printStackTrace();
                return false;
            } finally {
                conn.setAutoCommit(true);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    
    public static int getUserCountByLocation(String location) {
        int count = 0;
        try {
            Connection con = DatabaseConnection.getConnection();
            String query = "SELECT COUNT(*) FROM users WHERE address = ? AND role = 'Customer'";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, location);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public static int getUserCountByGender(String gender) {
        int count = 0;
        try {
            Connection con = DatabaseConnection.getConnection();
            String query = "SELECT COUNT(*) FROM users WHERE gender = ? AND role = 'Customer'";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, gender);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }



}
