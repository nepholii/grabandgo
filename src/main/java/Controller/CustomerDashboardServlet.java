package Controller;

import DAO.FoodDAO;
import Model.Food;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/CustomerDashboardServlet")
public class CustomerDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FoodDAO foodDAO = new FoodDAO();
        Map<String, List<Food>> categorizedFoods = new LinkedHashMap<>(); // keep order
        
        // Define categories you want to show
        String[] categories = {"Main Course", "Dessert", "Appetizer", "Beverage", "Salad", "Soup"};
        
        try {
            for (String category : categories) {
                List<Food> items = foodDAO.getFoodByCategory(category);
                if (items != null && !items.isEmpty()) {
                    categorizedFoods.put(category, items);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Optional: you can set an error message here and forward to an error page
        }
        
        // Set the map as request attribute
        request.setAttribute("categorizedFoods", categorizedFoods);
        
        // Forward to your JSP
        request.getRequestDispatcher("customer-dashboard.jsp").forward(request, response);
    }
}
