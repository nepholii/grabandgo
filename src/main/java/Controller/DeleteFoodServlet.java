package Controller;

import DAO.FoodDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteFoodServlet")
public class DeleteFoodServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String foodIdParam = request.getParameter("foodId");
        if (foodIdParam == null || foodIdParam.isEmpty()) {
            request.getSession().setAttribute("message", "Invalid food ID.");
            response.sendRedirect("delete-product.jsp");
            return;
        }

        try {
            int foodId = Integer.parseInt(foodIdParam);
            FoodDAO foodDAO = new FoodDAO();

            boolean deleted = foodDAO.deleteFoodById(foodId);
            if (deleted) {
                request.getSession().setAttribute("message", "Food item deleted successfully.");
            } else {
                request.getSession().setAttribute("message", "Failed to delete food item. Item might not exist.");
            }
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("message", "Invalid food ID format.");
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "An error occurred: " + e.getMessage());
        }

        response.sendRedirect("delete-product.jsp");
    }
}
