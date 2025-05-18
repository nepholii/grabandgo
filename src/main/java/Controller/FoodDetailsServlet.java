package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.FoodDAO;
import Model.Food;

/**
 * Servlet implementation class FoodDetailsServlet
 */
@WebServlet("/FoodDetailsServlet")
public class FoodDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int foodId = Integer.parseInt(request.getParameter("foodId"));
        try {
            FoodDAO foodDAO = new FoodDAO();
            Food food = foodDAO.getFoodById(foodId);

            request.setAttribute("food", food);
            RequestDispatcher dispatcher = request.getRequestDispatcher("food-details.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unable to load food details.");
            request.getRequestDispatcher("menu.jsp").forward(request, response);
        }
    }
}
