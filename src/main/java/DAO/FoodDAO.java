package DAO;

import Model.Food;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Database.DatabaseConnection;


public class FoodDAO {
	public List<Food> getAllAvailableFoodItems() throws SQLException, ClassNotFoundException {
        List<Food> foodItems = new ArrayList<>();
        String sql = "SELECT * FROM Food WHERE quantity > 0 ORDER BY category, food_name";

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
}

