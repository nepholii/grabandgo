package DAO;

import Model.Cart;
import Model.CartItem;
import Database.DatabaseConnection;
import java.sql.*;

public class CartDAO {
    public int createCart(int customerId) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO Cart (customer_id) VALUES (?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, customerId);
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            return rs.next() ? rs.getInt(1) : -1;
        }
    }

    public void addOrUpdateItem(int cartId, CartItem item) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO Cart_Food (cart_id, food_id, food_quantity) VALUES (?, ?, ?) " +
                     "ON DUPLICATE KEY UPDATE food_quantity = food_quantity + VALUES(food_quantity)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            stmt.setInt(2, item.getFoodId());
            stmt.setInt(3, item.getQuantity());
            stmt.executeUpdate();
        }
    }

    public Cart getCart(int customerId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT c.cart_id, cf.food_id, f.food_name, f.food_price, cf.food_quantity " +
                     "FROM Cart c JOIN Cart_Food cf ON c.cart_id = cf.cart_id " +
                     "JOIN Food f ON cf.food_id = f.food_id WHERE c.customer_id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, customerId);
            ResultSet rs = stmt.executeQuery();
            
            Cart cart = new Cart();
            cart.setCustomerId(customerId);
            
            while (rs.next()) {
                if (cart.getCartId() == 0) {
                    cart.setCartId(rs.getInt("cart_id"));
                }
                CartItem item = new CartItem(
                    rs.getInt("food_id"),
                    rs.getString("food_name"),
                    rs.getDouble("food_price"),
                    rs.getInt("food_quantity")
                );
                cart.addItem(item);
            }
            return cart.getCartId() == 0 ? null : cart;
        }
    }

    public void updateItem(int cartId, int foodId, int quantity) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE Cart_Food SET food_quantity = ? WHERE cart_id = ? AND food_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, quantity);
            stmt.setInt(2, cartId);
            stmt.setInt(3, foodId);
            stmt.executeUpdate();
        }
    }

    public void removeItem(int cartId, int foodId) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM Cart_Food WHERE cart_id = ? AND food_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            stmt.setInt(2, foodId);
            stmt.executeUpdate();
        }
    }
    
    public void clearCart(int cartId) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM Cart_Food WHERE cart_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            stmt.executeUpdate();
        }
    }
}
