-- Seed Data for Users (Admin, Staff, Customers)
INSERT INTO users (first_name, last_name, username, phone, email, password, address, gender, role, status, image_path) VALUES
('Admin', NULL, 'admin', NULL, NULL, 'CTkTZ3fIM2RjqLPzLcwLUrFvkTHCIOsyqj1A4WSoO5s=', NULL, NULL, 'admin', NULL, NULL),

-- Staff Users
('Sanjog', 'Gurung', 'sanjog', '9825465787', 'sanjog.gurung@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Pokhara', 'Male', 'Staff', 'active', NULL),
('Nischay', 'Poudel', 'nischay', '9852645712', 'nischay.poudel@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Kathmandu', 'Male', 'Staff', 'active', NULL),
('Samuel', 'Acharya', 'samuel', '9874563215', 'samuel.acharya@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Butwal', 'Male', 'Staff', 'active', NULL),
('Prabesh', 'Marasini', 'prabesh', '9874563210', 'prabesh.marasini@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Syangja', 'Male', 'Staff', 'active', NULL),
('Rina', 'Acharya', 'rina', '9874562546', 'rina.acharya@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Lumbini', 'Female', 'Staff', 'active', NULL),
('Kiran', 'Rai', 'kiranrai', '9812345670', 'kiran.rai@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Dharan', 'Male', 'Staff', 'active', NULL),
('Sital', 'Shrestha', 'sital', '9841234567', 'sital.shrestha@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Lalitpur', 'Female', 'Staff', 'active', NULL),
('Harish', 'Thapa', 'harish', '9865432109', 'harish.thapa@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Chitwan', 'Male', 'Staff', 'active', NULL),
('Rekha', 'Basnet', 'rekhab', '9801234567', 'rekha.basnet@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Bhaktapur', 'Female', 'Staff', 'active', NULL),
('Deep', 'Karki', 'deepkarki', '9834567890', 'deep.karki@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Pokhara', 'Male', 'Staff', 'active', NULL),

-- Customer Users
('Anil', 'Bhandari', 'anilb', '9801111222', 'anil.bhandari@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Biratnagar', 'Male', 'Customer', 'active', NULL),
('Sushma', 'Joshi', 'sushmaj', '9812233445', 'sushma.joshi@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Dhangadhi', 'Female', 'Customer', 'active', NULL),
('Rohit', 'Khanal', 'rohitk', '9823456789', 'rohit.khanal@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Pokhara', 'Male', 'Customer', 'active', NULL),
('Pratiksha', 'Tamang', 'pratiksha', '9834567890', 'pratiksha.tamang@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Kathmandu', 'Female', 'Customer', 'active', NULL),
('Deepika', 'Sharma', 'deepikas', '9845678901', 'deepika.sharma@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Lalitpur', 'Female', 'Customer', 'active', NULL),
('Saurav', 'Maharjan', 'sauravm', '9856789012', 'saurav.maharjan@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Bhaktapur', 'Male', 'Customer', 'active', NULL),
('Nirajan', 'Ghimire', 'nirajang', '9867890123', 'nirajan.ghimire@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Sunsari', 'Male', 'Customer', 'active', NULL),
('Anuja', 'Karki', 'anujak', '9878901234', 'anuja.karki@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Ilam', 'Female', 'Customer', 'active', NULL),
('Prakash', 'Nepal', 'prakashn', '9889012345', 'prakash.nepal@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Palpa', 'Male', 'Customer', 'active', NULL),
('Ramesh', 'Dhakal', 'rameshd', '9890123456', 'ramesh.dhakal@gmail.com', 'fOPF3/pwsmtclgRFtc9z1XWu+gGvVMVm65LCFIMEqzE=', 'Gorkha', 'Male', 'Customer', 'active', NULL);

-- Seed Data for Staff table using subqueries to get user_id
INSERT INTO staff (staff_id, salary, shift, hire_date, job_title) VALUES
((SELECT user_id FROM users WHERE username = 'sanjog'), 35000.00, 'Morning', '2025-04-25', 'Executive Chef'),
((SELECT user_id FROM users WHERE username = 'nischay'), 35000.00, 'Night', '2025-04-24', 'Sous Chef'),
((SELECT user_id FROM users WHERE username = 'samuel'), 25000.00, 'Afternoon', '2025-02-24', 'Line Cook'),
((SELECT user_id FROM users WHERE username = 'prabesh'), 20000.00, 'Morning', '2025-01-16', 'Prep Cook'),
((SELECT user_id FROM users WHERE username = 'rina'), 20000.00, 'Afternoon', '2025-01-16', 'Pastry Chef'),
((SELECT user_id FROM users WHERE username = 'kiranrai'), 28000.00, 'Night', '2025-03-01', 'Kitchen Manager'),
((SELECT user_id FROM users WHERE username = 'sital'), 26000.00, 'Afternoon', '2025-02-15', 'Baker'),
((SELECT user_id FROM users WHERE username = 'harish'), 24000.00, 'Morning', '2025-02-10', 'Grill Cook'),
((SELECT user_id FROM users WHERE username = 'rekhab'), 23000.00, 'Night', '2025-01-30', 'Line Cook'),
((SELECT user_id FROM users WHERE username = 'deepkarki'), 22000.00, 'Morning', '2025-01-25', 'Fryer Cook');

-- Seed Data for Food table
INSERT INTO food (food_name, food_description, food_price, category, quantity, preparation_time, image_path) VALUES
('Spicy Wings', 'Hot and crispy wings with signature sauce.', 7.00, 'Appetizers', 100, '00:08:00', 'images/spicy-wings.jpg'),
('Loaded Nachos', 'Nachos loaded with cheese, beans, and jalapeños.', 6.50, 'Appetizers', 100, '00:07:00', 'images/loaded-nachos.jpg'),
('Classic Burger', 'Juicy grilled patty with lettuce and cheese.', 6.00, 'Main Courses', 100, '00:10:00', 'images/burger.jpg'),
('Crispy Fries', 'Golden, crunchy fries with sea salt.', 2.00, 'Main Courses', 100, '00:05:00', 'images/fries.jpg'),
('Combo Meal', 'Burger, fries, and drink — perfect combo.', 9.00, 'Main Courses', 100, '00:12:00', 'images/combo.jpg'),
('Cheesy Pizza', 'Hot cheesy pizza with extra toppings.', 8.00, 'Main Courses', 100, '00:15:00', 'images/cheese-pizza.jpg'),
('Hot Dog', 'Classic sausage in a bun with mustard.', 4.00, 'Main Courses', 100, '00:08:00', 'images/hot-dog.jpg'),
('Chicken Sandwich', 'Grilled chicken breast with fresh veggies.', 5.00, 'Main Courses', 100, '00:10:00', 'images/sandwich.jpg'),
('Chowmein', 'Best Nepali Chowmein', 6.00, 'Main Courses', 100, '00:10:00', 'images/chowmein.jpg'),
('DalBhat', 'DalBhat ko Power 24hrs', 8.00, 'Main Courses', 100, '00:20:00', 'images/dalbhat.jpg'),
('MOMO', 'Nepali Juicy Momo', 12.00, 'Main Courses', 100, '00:12:00', 'images/momo.jpg'),
('Plain NAN', 'Original nan from gurkha', 13.00, 'Main Courses', 100, '00:10:00', 'images/nan.jpg'),
('Newari Khaja Set', 'Jojolapa! Hava a khaja set', 16.00, 'Main Courses', 100, '00:20:00', 'images/newari-set.jpg'),
('Thakali Khaja Set', 'Mitho Mitho Mitho khaja set', 15.00, 'Main Courses', 100, '00:25:00', 'images/thakali-set.jpg'),
('Chilli Paneer', 'Spicy like you', 18.00, 'Main Courses', 100, '00:12:00', 'images/paneer.jpg'),
('Japnese Sushi', 'Origin from japan', 21.00, 'Main Courses', 100, '00:15:00', 'images/sushi.jpg'),
('Fried Rice', 'Fresh Fried Rice', 5.00, 'Main Courses', 100, '00:10:00', 'images/fried-rice.jpg'),
('Choco Blast', 'Blast of Chocolate', 10.00, 'Desserts', 100, '00:05:00', 'images/choco-blast.jpg'),
('Milkshake', 'Thick and creamy milkshake, various flavors.', 3.00, 'Desserts', 100, '00:03:00', 'images/milkshake.jpg'),
('Sugercan Juice', 'Gannay Ka Juice Only 20 rupeees', 20.00, 'Beverages', 100, '00:02:00', 'images/sugarcane-juice.jpg'),
('Healthy Salad', 'Fresh greens, tomatoes, and vinaigrette.', 5.00, 'Healthy Options', 100, '00:05:00', 'images/salad.jpg'),
('Chicken Nuggets', 'Crispy chicken bites served with sauce.', 4.00, 'Healthy Options', 100, '00:07:00', 'images/nuggets.jpg');

-- Seed Data for Cart (10 customers, each with one cart)
INSERT INTO cart (customer_id, added_time) VALUES
((SELECT user_id FROM users WHERE username = 'anilb'), '2025-05-20 10:00:00'),
((SELECT user_id FROM users WHERE username = 'sushmaj'), '2025-05-20 11:00:00'),
((SELECT user_id FROM users WHERE username = 'rohitk'), '2025-05-20 12:00:00'),
((SELECT user_id FROM users WHERE username = 'pratiksha'), '2025-05-20 13:00:00'),
((SELECT user_id FROM users WHERE username = 'deepikas'), '2025-05-20 14:00:00'),
((SELECT user_id FROM users WHERE username = 'sauravm'), '2025-05-20 15:00:00'),
((SELECT user_id FROM users WHERE username = 'nirajang'), '2025-05-20 16:00:00'),
((SELECT user_id FROM users WHERE username = 'anujak'), '2025-05-20 17:00:00'),
((SELECT user_id FROM users WHERE username = 'prakashn'), '2025-05-20 18:00:00'),
((SELECT user_id FROM users WHERE username = 'rameshd'), '2025-05-20 19:00:00');

-- Seed Data for cart_food (each cart with 2 food items)
INSERT INTO cart_food (cart_id, food_id, food_quantity) VALUES
(1, 3, 2),  (1, 4, 1),
(2, 1, 3),  (2, 20, 1),
(3, 11, 4), (3, 8, 2),
(4, 6, 2),  (4, 19, 1),
(5, 17, 1), (5, 5, 1),
(6, 5, 1),  (6, 9, 3),
(7, 19, 2), (7, 2, 1),
(8, 16, 1), (8, 10, 2),
(9, 13, 2), (9, 12, 1),
(10, 15, 1),(10, 7, 3);

-- Seed Data for Orders (10 orders, one per cart)
INSERT INTO orders (order_price, payment_status, order_status, pickup_time, user_id, cart_id) VALUES
(19.00, 'Paid', 'Ready', '2025-05-21 12:30:00', (SELECT user_id FROM users WHERE username = 'anilb'), 1),
(23.50, 'Paid', 'Completed', '2025-05-21 13:00:00', (SELECT user_id FROM users WHERE username = 'sushmaj'), 2),
(48.00, 'Pending', 'Processing', '2025-05-21 14:30:00', (SELECT user_id FROM users WHERE username = 'rohitk'), 3),
(16.00, 'Paid', 'Completed', '2025-05-21 15:00:00', (SELECT user_id FROM users WHERE username = 'pratiksha'), 4),
(10.00, 'Paid', 'Ready', '2025-05-21 15:30:00', (SELECT user_id FROM users WHERE username = 'deepikas'), 5),
(12.00, 'Pending', 'Processing', '2025-05-21 16:00:00', (SELECT user_id FROM users WHERE username = 'sauravm'), 6),
(22.00, 'Paid', 'Completed', '2025-05-21 16:30:00', (SELECT user_id FROM users WHERE username = 'nirajang'), 7),
(18.00, 'Paid', 'Ready', '2025-05-21 17:00:00', (SELECT user_id FROM users WHERE username = 'anujak'), 8),
(29.00, 'Pending', 'Processing', '2025-05-21 17:30:00', (SELECT user_id FROM users WHERE username = 'prakashn'), 9),
(20.00, 'Paid', 'Completed', '2025-05-21 18:00:00', (SELECT user_id FROM users WHERE username = 'rameshd'), 10);


-- Seed Data for order_food (each order with 2 food items)
INSERT INTO order_food (order_id, food_id, ordered_quantity) VALUES
(1, 3, 2),  (1, 4, 1),
(2, 1, 3),  (2, 20, 1),
(3, 11, 4), (3, 8, 2),
(4, 6, 2),  (4, 19, 1),
(5, 17, 1), (5, 5, 1),
(6, 5, 1),  (6, 9, 3),
(7, 19, 2), (7, 2, 1),
(8, 16, 1), (8, 10, 2),
(9, 13, 2), (9, 12, 1),
(10, 15, 1),(10, 7, 3);

