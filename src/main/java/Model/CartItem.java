package Model;

public class CartItem {
    private int foodId;
    private String foodName;
    private String foodDescription;
    private double price;
    private int quantity;
    private String imagePath;

    // Constructors
    public CartItem() {}

    public CartItem(int foodId, String foodName, double price, int quantity) {
        this.foodId = foodId;
        this.foodName = foodName;
        this.price = price;
        this.quantity = quantity;
    }

    public CartItem(int foodId, String foodName, String foodDescription, 
                   double price, int quantity, String imagePath) {
        this(foodId, foodName, price, quantity);
        this.foodDescription = foodDescription;
        this.imagePath = imagePath;
    }

    // Getters
    public int getFoodId() { 
        return foodId; 
    }

    public String getFoodName() { 
        return foodName; 
    }

    public String getFoodDescription() { 
        return foodDescription; 
    }

    public double getPrice() { 
        return price; 
    }

    public int getQuantity() { 
        return quantity; 
    }

    public String getImagePath() { 
        return imagePath; 
    }

    // Setters
    public void setFoodId(int foodId) { 
        this.foodId = foodId; 
    }

    public void setFoodName(String foodName) { 
        this.foodName = foodName; 
    }

    public void setFoodDescription(String foodDescription) { 
        this.foodDescription = foodDescription; 
    }

    public void setPrice(double price) { 
        this.price = price; 
    }

    public void setQuantity(int quantity) { 
        this.quantity = quantity; 
    }

    public void setImagePath(String imagePath) { 
        this.imagePath = imagePath; 
    }

    // Business Logic Methods
    public double getSubtotal() {
        return price * quantity;
    }

    public void increaseQuantity(int amount) {
        quantity += amount;
    }

    public void decreaseQuantity(int amount) {
        quantity = Math.max(0, quantity - amount);
    }

    // Object Overrides
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CartItem cartItem = (CartItem) o;
        return foodId == cartItem.foodId;
    }

    @Override
    public int hashCode() {
        return foodId;
    }

    @Override
    public String toString() {
        return String.format(
            "CartItem{foodId=%d, foodName='%s', price=%.2f, quantity=%d, subtotal=%.2f}",
            foodId, foodName, price, quantity, getSubtotal()
        );
    }
}
