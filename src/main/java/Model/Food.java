package Model;

public class Food {
    private int foodId;
    private String foodName;
    private String foodDescription;
    private double foodPrice;
    private String category;
    private int quantity;
    private String preparationTime;
    private String imagePath;

    public Food() {}

    public Food(int foodId, String foodName, String foodDescription, double foodPrice, 
                String category, int quantity, String preparationTime, String imagePath) {
        this.foodId = foodId;
        this.foodName = foodName;
        this.foodDescription = foodDescription;
        this.foodPrice = foodPrice;
        this.category = category;
        this.quantity = quantity;
        this.preparationTime = preparationTime;
        this.imagePath = imagePath;
    }

	public int getFoodId() {
		return foodId;
	}

	public void setFoodId(int foodId) {
		this.foodId = foodId;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public String getFoodDescription() {
		return foodDescription;
	}

	public void setFoodDescription(String foodDescription) {
		this.foodDescription = foodDescription;
	}

	public double getFoodPrice() {
		return foodPrice;
	}

	public void setFoodPrice(double foodPrice) {
		this.foodPrice = foodPrice;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getPreparationTime() {
		return preparationTime;
	}

	public void setPreparationTime(String preparationTime) {
		this.preparationTime = preparationTime;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	 public int getPreparationHour() {
		    try {
		        String[] parts = preparationTime.split(":");
		        return Integer.parseInt(parts[0]);
		    } catch (Exception e) {
		        return 0;
		    }
		}

		public int getPreparationMinute() {
		    try {
		        String[] parts = preparationTime.split(":");
		        return Integer.parseInt(parts[1]);
		    } catch (Exception e) {
		        return 0;
		    }
		}

		public int getPreparationSecond() {
		    try {
		        String[] parts = preparationTime.split(":");
		        return Integer.parseInt(parts[2]);
		    } catch (Exception e) {
		        return 0;
		    }
		}
    
}