package DAO;

import Model.Food;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Database.DatabaseConnection;


public class FoodDAO {
	public List<Food> getAllAvailableFoodItems() throws SQLException, ClassNotFoundException {
        List<Food> foodItems = new ArrayList<>();
        String sql = "SELECT * FROM food WHERE quantity > 0 ORDER BY food_id, food_name";

        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Food food = new Food();
                food.setFoodId(rs.getInt("food_id"));
                food.setFoodName(rs.getString("food_name"));
                food.setFoodDescription(rs.getString("food_description"));
                food.setFoodPrice(rs.getDouble("food_price"));
                food.setCategory(rs.getString("category"));
                food.setQuantity(rs.getInt("quantity"));
                food.setPreparationTime(rs.getString("preparation_time"));
                food.setImagePath(rs.getString("image_path"));
                
                foodItems.add(food);
            }
        }
        return foodItems;
    }
	public List<Food> searchFoodItems(String keyword) throws SQLException, ClassNotFoundException {
        List<Food> foodItems = new ArrayList<>();
        String sql = "SELECT * FROM Food WHERE (food_name LIKE ? OR food_description LIKE ? OR category LIKE ?) AND quantity > 0";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            String likeKeyword = "%" + keyword + "%";
            stmt.setString(1, likeKeyword);
            stmt.setString(2, likeKeyword);
            stmt.setString(3, likeKeyword);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Food food = new Food();
                food.setFoodId(rs.getInt("food_id"));
                food.setFoodName(rs.getString("food_name"));
                food.setFoodDescription(rs.getString("food_description"));
                food.setFoodPrice(rs.getDouble("food_price"));
                food.setCategory(rs.getString("category"));
                food.setQuantity(rs.getInt("quantity"));
                food.setPreparationTime(rs.getString("preparation_time"));
                food.setImagePath(rs.getString("image_path"));

                foodItems.add(food);
            }
        }
        return foodItems;
    }
	
	public Food getFoodById(int foodId) throws Exception {
	    Connection conn = DatabaseConnection.getConnection();
	    String sql = "SELECT * FROM food WHERE food_id = ?";
	    PreparedStatement stmt = conn.prepareStatement(sql);
	    stmt.setInt(1, foodId);
	    ResultSet rs = stmt.executeQuery();

	    if (rs.next()) {
	        Food food = new Food();
	        food.setFoodId(rs.getInt("food_id"));
	        food.setFoodName(rs.getString("food_name"));
	        food.setFoodDescription(rs.getString("food_description"));
	        food.setFoodPrice(rs.getDouble("food_price"));
	        food.setQuantity(rs.getInt("quantity"));
	        food.setImagePath(rs.getString("image_path"));
	        return food;
	    } else {
	        throw new Exception("No food found with ID: " + foodId);
	    }
	}
	public boolean insertFood(Food food) throws SQLException, ClassNotFoundException {
	    String sql = "INSERT INTO food (food_name, food_description, food_price, category, quantity, preparation_time, image_path) VALUES (?, ?, ?, ?, ?, ?, ?)";

	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setString(1, food.getFoodName());
	        stmt.setString(2, food.getFoodDescription());
	        stmt.setDouble(3, food.getFoodPrice());
	        stmt.setString(4, food.getCategory());
	        stmt.setInt(5, food.getQuantity());
	        stmt.setTime(6, java.sql.Time.valueOf(food.getPreparationTime())); // format: HH:mm:ss
	        stmt.setString(7, food.getImagePath());

	        return stmt.executeUpdate() > 0;
	    }
	}
	public boolean deleteFoodById(int foodId) throws SQLException, ClassNotFoundException {
	    String sql = "DELETE FROM food WHERE food_id = ?";
	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setInt(1, foodId);
	        return stmt.executeUpdate() > 0;
	    }
	}
	public boolean updateFood(Food food) {
	    boolean updated = false;

	    String sql = "UPDATE food SET food_name = ?, food_description = ?, food_price = ?, category = ?, quantity = ?, preparation_time = ?, image_path = ? WHERE food_id = ?";

	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setString(1, food.getFoodName());
	        stmt.setString(2, food.getFoodDescription());
	        stmt.setDouble(3, food.getFoodPrice());
	        stmt.setString(4, food.getCategory());
	        stmt.setInt(5, food.getQuantity());

	        // ✅ Handle TIME format correctly
	        String prepTime = food.getPreparationTime();
	        if (prepTime == null || prepTime.trim().isEmpty()) {
	            stmt.setNull(6, java.sql.Types.TIME);
	        } else {
	            // Ensure it has HH:mm:ss format
	            if (prepTime.matches("^\\d{2}:\\d{2}$")) {
	                prepTime += ":00"; // convert "HH:mm" to "HH:mm:ss"
	            }
	            stmt.setTime(6, java.sql.Time.valueOf(prepTime));
	        }

	        stmt.setString(7, food.getImagePath());
	        stmt.setInt(8, food.getFoodId());

	        int rowsAffected = stmt.executeUpdate();
	        updated = rowsAffected > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return updated;
	}
	
	

	public List<Food> getFoodByCategory(String category) throws SQLException, ClassNotFoundException {
	    List<Food> foodItems = new ArrayList<>();
	    String sql = "SELECT * FROM food WHERE category = ? AND quantity > 0";

	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setString(1, category);
	        ResultSet rs = stmt.executeQuery();

	        while (rs.next()) {
	            Food food = new Food();
	            food.setFoodId(rs.getInt("food_id"));
	            food.setFoodName(rs.getString("food_name"));
	            food.setFoodDescription(rs.getString("food_description"));
	            food.setFoodPrice(rs.getDouble("food_price"));
	            food.setCategory(rs.getString("category"));
	            food.setQuantity(rs.getInt("quantity"));
	            food.setPreparationTime(rs.getString("preparation_time"));
	            food.setImagePath(rs.getString("image_path"));

	            foodItems.add(food);
	        }
	    }
	    return foodItems;
	}

	

	public int getFoodCount() throws SQLException, ClassNotFoundException {
	    String sql = "SELECT COUNT(*) AS total FROM food";
	    try (Connection conn = DatabaseConnection.getConnection();
	         Statement stmt = conn.createStatement();
	         ResultSet rs = stmt.executeQuery(sql)) {

	        if (rs.next()) {
	            return rs.getInt("total");
	        }
	    }
	    return 0;
	}
	 public static int getCountByCategory(String category) {
	        int count = 0;
	        try (Connection conn = DatabaseConnection.getConnection();
	             PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM food WHERE category = ?")) {
	            stmt.setString(1, category);
	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	                count = rs.getInt(1);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return count;
	    }

	



}

