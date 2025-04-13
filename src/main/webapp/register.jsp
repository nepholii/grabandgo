<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
  <style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: sans-serif;
    }

    body {
        background-color: #2e2e2e; /* Same dark background as login page */
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        background-color: white;
        border-radius: 30px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
        width: 768px;
        max-width: 100%;
        min-height: 480px;
        display: flex;
    }

    .welcome-panel {
        background: linear-gradient(to right, #FF8C00, #FFA500); /* Same gradient as login page */
        color: white;
        width: 50%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 0 40px;
        text-align: center;
        border-radius: 30px 0 0 30px;
    }

    .form-container {
        width: 50%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding: 0 40px;
    }

    form {
        width: 100%;
    }

    h1 {
        margin-bottom: 20px;
        color: #333;
    }

    .error-message {
        color: red;
        margin-bottom: 15px;
        text-align: center;
        width: 100%;
    }

    input, select {
        background-color: #eee; /* Light background for inputs */
        border: none;
        margin: 8px 0;
        padding: 12px 15px;
        width: 100%;
        border-radius: 8px;
        font-size: 14px;
    }

    button {
        background-color: #FF8C00; /* Orange color as in the login page */
        color: white;
        border: none;
        padding: 12px 45px;
        border-radius: 8px;
        font-weight: 600;
        letter-spacing: 0.5px;
        text-transform: uppercase;
        margin-top: 10px;
        cursor: pointer;
        width: 100%;
    }

    .ghost {
        background-color: transparent;
        border: 1px solid white;
        color: white;
        padding: 12px 45px;
        border-radius: 8px;
        font-weight: 600;
        text-decoration: none;
        display: inline-block;
        margin-top: 20px;
        width: 100%;
        text-align: center;
    }

    p {
        margin: 20px 0 30px;
        font-size: 14px;
        line-height: 1.5;
    }

    label {
        display: block;
        margin-top: 8px;
        color: #333;
        font-size: 14px;
        font-weight: 500;
    }

    @media (max-width: 768px) {
        .container {
            flex-direction: column;
        }

        .welcome-panel, .form-container {
            width: 100%;
            padding: 40px;
        }

        .welcome-panel {
            border-radius: 30px 30px 0 0;
        }
    }
</style>

</head>
<body>
    <div class="container">
        <div class="welcome-panel">
            <h1>Welcome Back!</h1>
            <p>Enter your personal details to use all of site features</p>
            <a href="login.jsp" class="ghost">Login</a>
        </div>

        <div class="form-container">
            <form action="RegisterServlet" method="post">
                <h1>Register</h1>
                
                <% if (request.getParameter("error") != null) { %>
                    <div class="error-message">
                        Registration Failed: <%= request.getParameter("error") %>
                    </div>
                <% } %>
                 <input type="text" name="username" required placeholder="Username">
                <input type="text" placeholder="Full Name" name="fullname" required>
                <input type="email" placeholder="Email" name="email" required>
                <input type="tel" placeholder="Phone Number" name="phone" pattern="[0-9]{10}" title="10 digit phone number" required>
                <input type="password" placeholder="Password" name="password" required>
                
               
                
                <button type="submit">Register</button>
            </form>
        </div>
    </div>
</body>
</html>