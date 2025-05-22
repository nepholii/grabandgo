package DAO;

import Model.Order;
import Model.OrderItem;
import Database.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
	
    public int createOrder(Order order) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO Orders (order_price, payment_status, order_status, user_id, cart_id) " +
                     "VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setDouble(1, order.getOrderPrice());
            stmt.setString(2, order.getPaymentStatus());
            stmt.setString(3, order.getOrderStatus());
            stmt.setInt(4, order.getUserId());
            stmt.setInt(5, order.getCartId());
            
            int affectedRows = stmt.executeUpdate();
            
            if (affectedRows == 0) {
                throw new SQLException("Creating order failed, no rows affected.");
            }
            
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1); // Return the generated order_id
                }
                else {
                    throw new SQLException("Creating order failed, no ID obtained.");
                }
            }
        }
    }

    public void addOrderItems(int orderId, List<OrderItem> items) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO Order_Food (order_id, food_id, ordered_quantity) VALUES (?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            for (OrderItem item : items) {
                stmt.setInt(1, orderId);
                stmt.setInt(2, item.getFoodId());
                stmt.setInt(3, item.getQuantity());
                stmt.addBatch();
            }
            
            stmt.executeBatch();
        }
    }

    public List<Order> getOrdersByUser(int userId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM Orders WHERE user_id = ? ORDER BY order_id DESC";
        List<Order> orders = new ArrayList<>();
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setOrderId(rs.getInt("order_id"));
                    order.setOrderPrice(rs.getDouble("order_price"));
                    order.setPaymentStatus(rs.getString("payment_status"));
                    order.setOrderStatus(rs.getString("order_status"));
                    order.setPickupTime(rs.getTimestamp("pickup_time"));
                    order.setUserId(rs.getInt("user_id"));
                    order.setCartId(rs.getInt("cart_id"));
                    
                    // Get order items
                    order.setItems(getOrderItems(order.getOrderId()));
                    
                    orders.add(order);
                }
            }
        }
        return orders;
    }

    private List<OrderItem> getOrderItems(int orderId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT of.food_id, f.food_name, f.food_price, of.ordered_quantity " +
                     "FROM Order_Food of JOIN Food f ON of.food_id = f.food_id " +
                     "WHERE of.order_id = ?";
        List<OrderItem> items = new ArrayList<>();
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, orderId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    OrderItem item = new OrderItem();
                    item.setFoodId(rs.getInt("food_id"));
                    item.setFoodName(rs.getString("food_name"));
                    item.setPrice(rs.getDouble("food_price"));
                    item.setQuantity(rs.getInt("ordered_quantity"));
                    
                    items.add(item);
                }
            }
        }
        return items;
    }
}
