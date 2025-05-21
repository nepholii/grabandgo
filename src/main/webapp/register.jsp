<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
  	<link rel="stylesheet" type="text/css" href="css/register.css">
  
</head>
<body>
    <div class="container">
        <div class="welcome-panel">
            <img src="images/Logo2.png" alt="Welcome" class="welcome-img">
           <h1>Hello, User!</h1>
			<p>Register with your personal details to use all of site features</p>
			<p style="margin-top: 10px; font-size: 14px;">Already have an account?</p>
			<a href="login.jsp" class="ghost">Login</a>
        </div>

        <div class="form-container">
            <form action="RegisterServlet" method="post" enctype="multipart/form-data">
                <h1>Register</h1>

                <% if (request.getParameter("error") != null) { %>
                    <div class="error-message">
                        Registration Failed: <%= request.getParameter("error") %>
                    </div>
                <% } %>

                <input type="text" name="first_name" required placeholder="First Name">
                <input type="text" name="last_name" required placeholder="Last Name">
                <input type="text" name="username" required placeholder="Username">
                <input type="email" name="email" required placeholder="Email">
                <input type="tel" name="phone" pattern="[0-9]{10}" title="10 digit phone number" required placeholder="Phone Number">
                
                <div class="password-wrapper">
			    <input type="password" name="password" id="password" placeholder="Password" required>
			    <span class="toggle-password" onclick="togglePassword()">👀</span>
                </div>
                
                <select name="address" required>
				    <option value="" disabled selected>Select Address</option>
				    <option value="Kathmandu">Kathmandu</option>
				    <option value="Lalitpur">Lalitpur</option>
				    <option value="Bhaktapur">Bhaktapur</option>
				    <option value="Pokhara">Pokhara</option>
				    <option value="Biratnagar">Biratnagar</option>
				    <option value="Others">Others</option>
				</select>

                <select name="gender" required>
                    <option value="" disabled selected>Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
                 <div class="file-input">
				    <label class="file-label" for="image">Upload Profile Image <span id="tick" style="display:none;">✅</span></label>
				    <input type="file" name="image" id="image" accept="image/*" required onchange="showTick()">
				</div>

                <button type="submit">Register</button>
            </form>
        </div>
    </div>
    
     <script>
    function togglePassword() {
        const passwordField = document.getElementById("password");
        const type = passwordField.type === "password" ? "text" : "password";
        passwordField.type = type;
    }
    
    function showTick() {
        const input = document.getElementById("image");
        const tick = document.getElementById("tick");
        if (input.files.length > 0) {
            tick.style.display = "inline";
        } else {
            tick.style.display = "none";
        }
    }
</script>
</body>
</html>
