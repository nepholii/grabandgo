package Controller;

import DAO.CartDAO;
import Model.Cart;
import Model.CartItem;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "CartServlet", urlPatterns = {"/cart", "/add-to-cart", "/update-cart"})
public class CartServlet extends HttpServlet {
    private CartDAO cartDAO;

    @Override
    public void init() {
        cartDAO = new CartDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);
            Integer customerId = (Integer) session.getAttribute("userId");
            
            if (customerId == null) {
                response.sendRedirect("LoginServlet");
                return;
            }

            Cart cart = cartDAO.getCart(customerId);
            if (cart == null) {
                int cartId = cartDAO.createCart(customerId);
                cart = new Cart();
                cart.setCartId(cartId);
                cart.setCustomerId(customerId);
            }
            
            session.setAttribute("cart", cart);
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
            
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Database error", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);
        Integer customerId = (Integer) session.getAttribute("userId");
        
        if (customerId == null) {
            response.sendRedirect("LoginServlet");
            return;
        }


        try {
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = cartDAO.getCart(customerId);
                if (cart == null) {
                    response.sendRedirect("cart");
                    return;
                }
            }

            int foodId = Integer.parseInt(request.getParameter("foodId"));
            
            switch (action) {
                case "add":
                    String foodName = request.getParameter("foodName");
                    double price = Double.parseDouble(request.getParameter("price"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    
                    CartItem item = new CartItem(foodId, foodName, price, quantity);
                    cartDAO.addOrUpdateItem(cart.getCartId(), item);
                    cart.addItem(item);
                    break;
                    
                case "update":
                    int newQuantity = Integer.parseInt(request.getParameter("quantity"));
                    cartDAO.updateItem(cart.getCartId(), foodId, newQuantity);
                    cart.updateItemQuantity(foodId, newQuantity);
                    break;
                    
                case "remove":
                    cartDAO.removeItem(cart.getCartId(), foodId);
                    cart.removeItem(foodId);
                    break;
            }

            session.setAttribute("cart", cart);
            response.sendRedirect("cart");
            
        } catch (SQLException | NumberFormatException | ClassNotFoundException e) {
            throw new ServletException("Cart operation failed", e);
        }
    }
}
