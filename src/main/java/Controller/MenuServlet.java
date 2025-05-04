package Controller;

import DAO.FoodDAO;
import Database.DatabaseConnection;
import Model.Food;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        FoodDAO foodDAO = new FoodDAO();
        try {
            List<Food> foodItems = foodDAO.getAllAvailableFoodItems();
            request.setAttribute("foodItems", foodItems);
            request.getRequestDispatcher("/menu.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading menu. Please try again later.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}

