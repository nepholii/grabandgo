package Controller;

import DAO.CartDAO;
import DAO.OrderDAO;
import Model.Cart;
import Model.CartItem;
import Model.Order;
import Model.OrderItem;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "CheckoutServlet", value = "/checkout")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        Cart cart = (Cart) session.getAttribute("cart");
        
        try {
            // 1. Create and populate the order
            Order order = new Order();
            order.setOrderPrice(cart.getTotal());
            order.setPaymentStatus("Pending");
            order.setOrderStatus("Processing");
            order.setUserId(userId);
            order.setCartId(cart.getCartId());
            
            // 2. Convert cart items to order items
            List<OrderItem> orderItems = cart.getItems().values().stream()
                .map(cartItem -> new OrderItem(
                    cartItem.getFoodId(),
                    cartItem.getFoodName(),
                    cartItem.getPrice(),
                    cartItem.getQuantity()))
                .collect(Collectors.toList());
            order.setItems(orderItems);
            
            // 3. Save to database and get generated ID
            OrderDAO orderDAO = new OrderDAO();
            int orderId = orderDAO.createOrder(order);
            order.setOrderId(orderId); // THIS IS CRUCIAL
            orderDAO.addOrderItems(orderId, orderItems);
            
            // 4. Clear cart
            CartDAO cartDAO = new CartDAO();
            cartDAO.clearCart(cart.getCartId());
            session.removeAttribute("cart");
            
            // 5. Forward to confirmation
            request.setAttribute("order", order);
            request.getRequestDispatcher("/order-confirmation.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Order processing failed: " + e.getMessage());
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
        }
    }
}