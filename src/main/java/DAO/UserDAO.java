package DAO;

import java.sql.*;
import Model.User;
import security.PasswordUtils;
import Database.DatabaseConnection;

public class UserDAO {

   
    public boolean registerUser(String username, String password, String role) throws ClassNotFoundException {
        String checkQuery = "SELECT COUNT(*) FROM users WHERE username = ?";
        String insertQuery = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
             PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {

         
            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                System.out.println("Registration Failed: Username already exists.");
                return false;
            }

       
            String hashedPassword = PasswordUtils.hashPassword(password);

      
            insertStmt.setString(1, username);
            insertStmt.setString(2, hashedPassword);
            insertStmt.setString(3, role);

            int rowsInserted = insertStmt.executeUpdate();
            System.out.println("Registration Successful. Rows Inserted: " + rowsInserted);
            return rowsInserted > 0;

        } catch (SQLException e) {
            System.err.println("❌ SQL Error: " + e.getMessage());
            e.printStackTrace();
        }

        return false;
    }

    // ✅ Validate User (Login)
    public User validateUser(String username, String password) throws ClassNotFoundException {
        String query = "SELECT id, username, password, role FROM users WHERE username = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String storedHashedPassword = rs.getString("password");
                String role = rs.getString("role");

                if (PasswordUtils.checkPassword(password, storedHashedPassword)) {
                    return new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        storedHashedPassword,
                        role
                    );
                }
            }

            rs.close();
        } catch (SQLException e) {
            System.err.println("Error while validating user: " + e.getMessage());
            e.printStackTrace();
        }

        return null;
    }
}
