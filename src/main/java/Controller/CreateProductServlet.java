package Controller;

import DAO.FoodDAO;
import Model.Food;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/CreateProductServlet")
@MultipartConfig
public class CreateProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String foodName = request.getParameter("food_name");
        String foodDescription = request.getParameter("food_description");
        double foodPrice = Double.parseDouble(request.getParameter("food_price"));
        String category = request.getParameter("category");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int prepMinutes = Integer.parseInt(request.getParameter("preparation_time"));
        int hours = prepMinutes / 60;
        int minutes = prepMinutes % 60;
        String preparationTime = String.format("%02d:%02d:00", hours, minutes);

        Part imagePart = request.getPart("image");
        String fileName = imagePart.getSubmittedFileName();
        String imagePath = "images/" + fileName;

        String fullPath = getServletContext().getRealPath("/") + imagePath;
        File imageFile = new File(fullPath);
        imageFile.getParentFile().mkdirs();
        imagePart.write(fullPath);

        Food food = new Food();
        food.setFoodName(foodName);
        food.setFoodDescription(foodDescription);
        food.setFoodPrice(foodPrice);
        food.setCategory(category);
        food.setQuantity(quantity);
        food.setPreparationTime(preparationTime);
        food.setImagePath(imagePath);

        try {
            FoodDAO foodDAO = new FoodDAO();
            boolean success = foodDAO.insertFood(food);

            if (success) {
                response.sendRedirect("create-product.jsp?status=success");
            } else {
                response.sendRedirect("create-product.jsp?status=error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("create-product.jsp?status=error");
        }
    }
}
