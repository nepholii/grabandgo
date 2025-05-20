package Controller;

import DAO.FoodDAO;
import Model.Food;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;


@WebServlet("/view-product")
public class ViewProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FoodDAO foodDAO = new FoodDAO();
        try {
            List<Food> foodList = foodDAO.getAllAvailableFoodItems();
            
            request.setAttribute("foodList", foodList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("view-product.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
