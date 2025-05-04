package Model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    private int cartId;
    private int customerId;
    
    private Map<Integer, CartItem> items = new HashMap<>();
    
    public void addItem(CartItem newItem) {
        if (items.containsKey(newItem.getFoodId())) {
        	// Update quantity if item already exists
            CartItem existing = items.get(newItem.getFoodId());
            existing.increaseQuantity(newItem.getQuantity());
        } else {
        	// Add new item
            items.put(newItem.getFoodId(), newItem);
        }
    }
    
    
    public void updateItemQuantity(int foodId, int quantity) {
        if (items.containsKey(foodId)) {
            items.get(foodId).setQuantity(quantity);
        }
    }
    
    public void removeItem(int foodId) {
        items.remove(foodId);
    }
    
    public double getTotal() {
        return items.values().stream()
                   .mapToDouble(item -> item.getPrice() * item.getQuantity())
                   .sum();
    }
    
    // Constructors, getters, and setters
    public int getCartId() { return cartId; }
    public void setCartId(int cartId) { this.cartId = cartId; }
    
    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }
    
    public Map<Integer, CartItem> getItems() { return items; }
}