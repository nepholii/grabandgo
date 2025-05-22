package Controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.OrderDAO;
import Model.Order;

@WebServlet("/OrderHistoryServlet")
public class OrderHistoryServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);
        Integer userId = (session != null) ? (Integer) session.getAttribute("userId") : null;
        
        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=Please login first");
            return;
        }

        try {
            OrderDAO orderDAO = new OrderDAO();
            List<Order> allOrders = orderDAO.getOrdersByUser(userId);
            
            List<Order> ongoingOrders = allOrders.stream()
                .filter(order -> !"Completed".equalsIgnoreCase(order.getOrderStatus()))
                .collect(Collectors.toList());
            
            List<Order> completedOrders = allOrders.stream()
                .filter(order -> "Completed".equalsIgnoreCase(order.getOrderStatus()))
                .collect(Collectors.toList());
            
            request.setAttribute("ongoingOrders", ongoingOrders);
            request.setAttribute("completedOrders", completedOrders);
            
            request.getRequestDispatcher("/orderhistory.jsp").forward(request, response);
            
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("error", "Error retrieving order history: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
