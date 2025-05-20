package Controller;

import DAO.FoodDAO;
import Model.Food;


import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

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
                // If food not found, redirect or show error
                response.sendRedirect("update-product.jsp?error=FoodNotFound");
            }
        } catch (NumberFormatException e) {
            // Handle invalid foodId param
            response.sendRedirect("update-product.jsp?error=InvalidId");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("update-product.jsp?error=ServerError");
        }
    }
}

