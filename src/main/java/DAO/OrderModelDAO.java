package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Database.DatabaseConnection;
import Model.OrderModel;

public class OrderModelDAO {

    // Method to count total orders
    public static int getTotalOrdersCount() throws ClassNotFoundException {
        int count = 0;
        String query = "SELECT COUNT(*) FROM Orders";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println("SQL Error during getting total orders count: " + e.getMessage());
            e.printStackTrace();
        }
        return count;
    }

    // Method to count orders based on status
    public static int getOrderCountByStatus(String status) throws ClassNotFoundException {
        int count = 0;
        String query = "SELECT COUNT(*) FROM Orders WHERE order_status = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setString(1, status);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println("SQL Error during getting order count by status: " + e.getMessage());
            e.printStackTrace();
        }
        return count;
    }

    // Method to count orders that are "Preparing" (Processing)
    public static int getPreparingOrdersCount() throws ClassNotFoundException {
    	return getOrderCountByStatus("Processing");
    }
    

    // Method to count completed orders
    public static int getCompletedOrdersCount() throws ClassNotFoundException {
        return getOrderCountByStatus("Completed");
    }

    // Method to count pending orders
    public static int getPendingOrdersCount() throws ClassNotFoundException {
        return getOrderCountByStatus("Pending");
    }

    // Method to count ready orders
    public static int getReadyOrdersCount() throws ClassNotFoundException {
        return getOrderCountByStatus("Ready");
    }

 // Method to fetch all orders
    public static List<OrderModel> getAllOrders() throws SQLException, ClassNotFoundException {
        List<OrderModel> orders = new ArrayList<>();
        
        String query = "SELECT o.order_id, u.first_name, u.last_name, o.pickup_time AS order_date, " +
                "o.order_status, o.payment_status, o.order_price " +
                "FROM Orders o " +
                "JOIN Users u ON o.user_id = u.user_id " +
                "ORDER BY o.pickup_time DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                OrderModel order = new OrderModel();
                order.setOrderId(rs.getInt("order_id"));
                order.setCustomerName(rs.getString("first_name") + " " + rs.getString("last_name"));
                order.setOrderDate(rs.getDate("order_date"));
                order.setOrderStatus(rs.getString("order_status"));
                order.setPaymentStatus(rs.getString("payment_status"));  // Set payment status
                order.setOrderPrice(rs.getDouble("order_price"));
                orders.add(order);
            }
        }
        return orders;
    }

    // Method to update order status and price
	public static boolean updateOrder(int orderId, double orderPrice, String orderStatus, 
		            String paymentStatus, String orderDate) 
		throws SQLException, ClassNotFoundException {
		
		String query = "UPDATE Orders SET order_price = ?, order_status = ?, " +
		"payment_status = ?, pickup_time = ? WHERE order_id = ?";
		
		try (Connection conn = DatabaseConnection.getConnection();
		PreparedStatement stmt = conn.prepareStatement(query)) {
		
		stmt.setDouble(1, orderPrice);
		stmt.setString(2, orderStatus);
		stmt.setString(3, paymentStatus);
		stmt.setString(4, orderDate);
		stmt.setInt(5, orderId);
		
		int rowsUpdated = stmt.executeUpdate();
		return rowsUpdated > 0;
		}
    }

    // Method to delete an order by ID
    public static boolean deleteOrder(int orderId) throws SQLException, ClassNotFoundException {
        String query = "DELETE FROM Orders WHERE order_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setInt(1, orderId);
            
            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            System.err.println("SQL Error during deleting order: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
   
}
