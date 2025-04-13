<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
       <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: sans-serif;
        }

        body {
            background-color: #2e2e2e;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: white;
            border-radius: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
            width: 768px;
            max-width: 100%;
            min-height: 480px;
            display: flex;
        }

        .form-container {
            width: 50%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 0 40px;
        }

        .welcome-panel {
            background: linear-gradient(to right, #FF8C00, #FFA500);
            color: white;
            width: 50%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 0 40px;
            text-align: center;
            border-radius: 0 30px 30px 0;
        }

        form {
            width: 100%;
        }

        h1 {
            margin-bottom: 20px;
            color: #333;
        }

        span {
            margin-bottom: 20px;
            color: #666;
            font-size: 14px;
            display: block;
        }

        input {
            background-color: #eee;
            border: none;
            margin: 8px 0;
            padding: 12px 15px;
            width: 100%;
            border-radius: 8px;
            font-size: 14px;
        }

        button {
            background-color: #FF8C00;
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

        .error-message {
            color: red;
            margin-bottom: 15px;
            text-align: center;
        }

        @media (max-width: 768px) {
            .login-container {
                flex-direction: column;
            }
            
            .welcome-panel, .form-container {
                width: 100%;
                padding: 40px;
            }
            
            .welcome-panel {
                border-radius: 0 0 30px 30px;
                order: 2;
            }
            
            .form-container {
                order: 1;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        
        <div class="form-container">
            <form action="LoginServlet" method="post">
                <h1>Login</h1>
                
                <% if (request.getParameter("error") != null) { %>
                    <div class="error-message">
                        Invalid username or password!
                    </div>
                <% } %>
                            
                <input type="text" name="username" required placeholder="Username">
				<input type="password" placeholder="Password" name="password" required>               
                <button type="submit">LOGIN</button>
            </form>
        </div>
       
        <div class="welcome-panel">
            <h1>Hello, User!</h1>
            <p>Register with your personal details to use all of site features</p>
            <a href="register.jsp" class="ghost">Register</a>
        </div>
    </div>
</body>
</html>