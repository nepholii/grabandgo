-- Create User table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    username VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    address TEXT,
    gender VARCHAR(10),
    role VARCHAR(50),
    status VARCHAR(50),
    image_path VARCHAR(255) -- New column for user profile image
);

-- Create Staff table (foreign key referencing user_id)
CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    salary DECIMAL(10, 2) NOT NULL,
    shift VARCHAR(50),
    hire_date DATE,
    job_title VARCHAR(100),
    CONSTRAINT fk_staff_user FOREIGN KEY (staff_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Create Cart table
CREATE TABLE cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    added_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_cart_user FOREIGN KEY (customer_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Create Food table
CREATE TABLE food (
    food_id INT AUTO_INCREMENT PRIMARY KEY,
    food_name VARCHAR(100) NOT NULL,
    food_description TEXT,
    food_price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(100),
    quantity INT NOT NULL,
    preparation_time TIME,
    image_path VARCHAR(255) -- New column for food image
);

-- Create Order table (note: Order is a reserved keyword in MySQL, use backticks)
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_price DECIMAL(10, 2) NOT NULL,
    payment_status VARCHAR(50),
    order_status VARCHAR(50),
    pickup_time DATETIME,
    user_id INT,
    cart_id INT,
    CONSTRAINT fk_order_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL,
    CONSTRAINT fk_order_cart FOREIGN KEY (cart_id) REFERENCES cart(cart_id) ON DELETE SET NULL
);

-- Create Cart-Food join table
CREATE TABLE cart_food (
    cart_id INT NOT NULL,
    food_id INT NOT NULL,
    food_quantity INT NOT NULL,
    PRIMARY KEY (cart_id, food_id),
    CONSTRAINT fk_cartfood_cart FOREIGN KEY (cart_id) REFERENCES cart(cart_id) ON DELETE CASCADE,
    CONSTRAINT fk_cartfood_food FOREIGN KEY (food_id) REFERENCES food(food_id) ON DELETE CASCADE
);

-- Create Order-Food join table
CREATE TABLE order_food (
    order_id INT NOT NULL,
    food_id INT NOT NULL,
    ordered_quantity INT NOT NULL,
    PRIMARY KEY (order_id, food_id),
    CONSTRAINT fk_orderfood_order FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    CONSTRAINT fk_orderfood_food FOREIGN KEY (food_id) REFERENCES food(food_id) ON DELETE CASCADE
);
