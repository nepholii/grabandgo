<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', sans-serif;
}

body {
     background: linear-gradient(to right, #1a1a1a, #333);
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px;
}

.container {
    display: flex;
    max-width: 900px;
    width: 100%;
    background-color: white;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

.welcome-panel {
    background: linear-gradient(to right, #ff6a00, #ee0979);
    color: white;
    flex: 1;
    padding: 40px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
}

.welcome-img {
    max-width: 180px;
    margin-bottom: 20px;
}

.welcome-panel h1 {
    margin-bottom: 10px;
    font-size: 26px;
}

.welcome-panel p {
    margin-bottom: 20px;
    font-size: 14px;
}

.ghost {
    background-color: white;
    color: #ff6a00;
    padding: 10px 20px;
    border-radius: 20px;
    text-decoration: none;
    font-weight: bold;
    transition: background-color 0.3s ease;
}

.ghost:hover {
    background-color: #fff3e0;
}

.form-container {
    flex: 1;
    padding: 40px;
    background-color: #fff;
}

form {
    display: flex;
    flex-direction: column;
}

form h1 {
    margin-bottom: 20px;
    color: #333;
    text-align: center;
}
.password-wrapper {
    position: relative;
}

.password-wrapper input {
    width: 100%;
    padding-right: 40px;
}

.toggle-password {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    user-select: none;
    font-size: 16px;
    color: #666;
}

input, select, textarea {
    margin-bottom: 12px;
    padding: 10px 12px;
    border: 1px solid #ccc;
    border-radius: 8px;
    font-size: 14px;
    background-color: #f9f9f9;
}

textarea {
    resize: vertical;
}
  .file-input input[type="file"] {
            display: none;
        }

        .file-label {
            display: inline-block;
            padding: 10px 20px;
            background: rgba(255, 255, 255, 0.1);
            color: black;
            border-radius: 8px;
            cursor: pointer;
            margin: 10px 0;
            transition: background 0.3s ease;
            text-align: center;
        }

        .file-label:hover {
            background: rgba(0, 255, 255, 0.15);
        }


button {
    padding: 12px;
    border: none;
    border-radius: 8px;
    background: linear-gradient(to right, #ff6a00, #ee0979);
    color: white;
    font-weight: bold;
    cursor: pointer;
    transition: opacity 0.3s;
}

button:hover {
    opacity: 0.9;
}

.error-message {
    color: red;
    margin-bottom: 10px;
    text-align: center;
}
@media screen and (max-width: 1024px) {
    .container {
        flex-direction: column;
        width: 100%;
        height: auto;
    }

    .welcome-panel,
    .form-container {
        width: 100%;
        padding: 30px 20px;
        border-radius: 0;
    }

    .welcome-img {
        max-width: 120px;
    }

    .welcome-panel h1,
    .form-container form h1 {
        font-size: 22px;
    }

    input, select, textarea, button {
        font-size: 16px;
    }

    .file-label {
        font-size: 14px;
        padding: 8px 14px;
    }
}


    </style>
  
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
                
                <input name="address" placeholder="Address" required></input>

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
