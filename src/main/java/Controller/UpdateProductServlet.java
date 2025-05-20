package Controller;

import DAO.FoodDAO;
import Model.Food;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles the GET request to pre-fill the form
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int foodId = Integer.parseInt(request.getParameter("foodId"));
            FoodDAO foodDAO = new FoodDAO();
            Food food = foodDAO.getFoodById(foodId);

            if (food != null) {
                request.setAttribute("food", food);
                request.getRequestDispatcher("edit-product.jsp").forward(request, response);
            } else {
                response.sendRedirect("update-product.jsp?error=FoodNotFound");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("update-product.jsp?error=InvalidId");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("update-product.jsp?error=ServerError");
        }
    }

    // Handles the POST request to update the food item
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int foodId = Integer.parseInt(request.getParameter("foodId"));
            String foodName = request.getParameter("foodName");
            String foodDescription = request.getParameter("foodDescription");
            double foodPrice = Double.parseDouble(request.getParameter("foodPrice"));
            String category = request.getParameter("category");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String preparationTime = request.getParameter("preparationTime");
            String imagePath = request.getParameter("imagePath");

            // Create updated Food object
            Food updatedFood = new Food();
            updatedFood.setFoodId(foodId);
            updatedFood.setFoodName(foodName);
            updatedFood.setFoodDescription(foodDescription);
            updatedFood.setFoodPrice(foodPrice);
            updatedFood.setCategory(category);
            updatedFood.setQuantity(quantity);
            updatedFood.setPreparationTime(preparationTime);
            updatedFood.setImagePath(imagePath);

            // Call DAO to update in DB
            FoodDAO foodDAO = new FoodDAO();
            boolean success = foodDAO.updateFood(updatedFood);

            if (success) {
                // Redirect or show success message
                response.sendRedirect("update-product.jsp?success=ProductUpdated");
            } else {
                // Redirect with failure message
                response.sendRedirect("edit-product.jsp?foodId=" + foodId + "&error=UpdateFailed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("edit-product.jsp?error=ServerError");
        }
    }
}
