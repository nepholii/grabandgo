package Controller;

import DAO.OrderModelDAO;
import Model.OrderModel;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/manage-orders")
public class OrderServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	        // Fetch all orders from the database
	        List<OrderModel> orders = OrderModelDAO.getAllOrders();
	        
	        
	        // Set the orders list in the request
	        request.setAttribute("orders", orders);
	        

	        
	        // Forward to manage-orders.jsp
	        request.getRequestDispatcher("/manage-orders.jsp").forward(request, response);
	    } catch (SQLException e) {
	        e.printStackTrace();
	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching orders.");
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Class not found.");
	    }
	}


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        
        try {
            if ("update".equals(action)) {
                // Get all updated values
                String orderStatus = request.getParameter("orderStatus");
                String paymentStatus = request.getParameter("paymentStatus");
                double orderPrice = Double.parseDouble(request.getParameter("orderPrice"));
                String orderDate = request.getParameter("orderDate");
                
                // Update the order
                boolean isUpdated = OrderModelDAO.updateOrder(
                    orderId, 
                    orderPrice, 
                    orderStatus, 
                    paymentStatus, 
                    orderDate
                );
                
                if (isUpdated) {
                    response.sendRedirect("manage-orders");
                } else {
                    request.setAttribute("error", "Failed to update order");
                    doGet(request, response);
                }
            
            } else if ("delete".equals(action)) {
                boolean isDeleted = OrderModelDAO.deleteOrder(orderId);
                
                if (isDeleted) {
                    response.sendRedirect("manage-orders");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error deleting the order.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing the request.");
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
