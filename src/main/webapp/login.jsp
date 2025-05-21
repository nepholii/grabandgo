<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/Login.css">
     
</head>
<body>
    <div class="container">
        <div class="form-container">
           <form action="LoginServlet" method="post">
    <h1>Login</h1>

    <c:if test="${not empty param.error}">
        <div class="error-message">${param.error}</div>
    </c:if>

    <label for="username">Username</label>
    <input type="text" name="username" id="username" placeholder="Enter your username" required>

    <label for="password">Password</label>
    <div class="password-wrapper">
        <input type="password" name="password" id="password" placeholder="Enter your password" required>
        <span class="toggle-password" onclick="togglePassword()">👀</span>
    </div>

    <button type="submit">Login</button>
</form>
        </div>

        
        <div class="welcome-panel">
            <img src="images/Logo2.png" alt="Welcome" width="100">
            
           
            <h1>Welcome Back!</h1>
            <p>Enter your credentials to access your account</p>
            <p style="margin-top: 10px; font-size: 14px;">Don't have an account?</p>
            <a href="register.jsp" class="ghost">Register</a>
        </div>
    </div>
    
    <script>
    function togglePassword() {
        const passwordField = document.getElementById("password");
        const type = passwordField.type === "password" ? "text" : "password";
        passwordField.type = type;
    }
</script>
</body>
</html>
