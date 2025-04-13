<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>About Us – Grab & Go</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
   
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #121212;
      color: #fff;
    }

   
    .navbar {
      position: relative;
      background-color: #1e1e1e;
      padding: 20px 40px;
      display: flex;
      align-items: center;
      height: 70px;
    }

   
    .logo {
      position: absolute;
      left: 40px;
      font-size: 28px;
      font-weight: bold;
      color: #FFCC00;
    }

 
    .nav-container {
      width: 100%;
      text-align: center;
    }

    .nav-links {
      list-style: none;
      display: inline-flex;
      gap: 25px;
    }

    .nav-links li a {
      color: white;
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s ease;
    }

    .nav-links li a:hover {
      color: #FFCC00;
    }

    .about-section {
      padding: 80px 60px;
      text-align: center;
      background-color: #1a1a1a;
    }

    .about-section h2 {
      color: #FFCC00;
      font-size: 36px;
      margin-bottom: 20px;
    }

    .about-section p {
      font-size: 18px;
      color: #ccc;
      margin-bottom: 40px;
      max-width: 800px;
      margin-left: auto;
      margin-right: auto;
    }

   
    .members-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 30px;
      justify-items: center;
    }

    .member-card {
      background-color: #2a2a2a;
      padding: 20px;
      border-radius: 16px;
      text-align: center;
      box-shadow: 0 0 10px rgba(255, 204, 0, 0.1);
      transition: transform 0.3s ease;
      max-width: 350px;
    }

    .member-card img {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      object-fit: cover;
      margin-bottom: 15px;
      border: 3px solid #FFCC00;
    }

    .member-card h3 {
      font-size: 22px;
      margin-bottom: 10px;
      color: #fff;
    }

    .member-card p {
      font-size: 16px;
      color: #ccc;
    }

    .member-card:hover {
      transform: translateY(-8px);
    }


    .footer {
      background-color: #1e1e1e;
      text-align: center;
      padding: 20px 0;
      font-size: 14px;
      color: #ccc;
    }


    @media screen and (max-width: 768px) {
      .nav-links {
        flex-direction: column;
      }
      .logo {
        position: static;
        text-align: center;
        margin-bottom: 10px;
      }
      .navbar {
        flex-direction: column;
        height: auto;
      }
      .nav-container {
        margin-top: 10px;
      }
    }
  </style>
</head>
<body>
  <!-- Navigation -->
  <header class="navbar">
    <div class="logo">Grab & Go</div>
    <div class="nav-container">
      <ul class="nav-links">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="menu.jsp">Menu</a></li>
        <li><a href="cart.jsp">Cart</a></li>
        <li><a href="aboutus.jsp">About Us</a></li>
      </ul>
    </div>
  </header>

  <!-- About Us Section -->
  <section class="about-section">
    <h2>About Us</h2>
    <p>We are a passionate team dedicated to delivering the best food ordering experience. Meet the creative individuals behind Grab & Go.</p>
    <div class="members-grid">
      <!-- Group Member 1 -->
      <div class="member-card">
        <img src="images/member1.jpg" alt="Member 1">
        <h3>Sanjog Gurung</h3>
        <p>Team Leader & Front-end Developer, Back-end Developer, UI/UX Designer, Quality Assurance & Tester</p>
      </div>
      <!-- Group Member 2 -->
      <div class="member-card">
        <img src="images/member2.jpg" alt="Member 2">
        <h3>Nischay Poudel</h3>
        <p>Front-end Developer, Back-end Developer, UI/UX Designer, Quality Assurance & Tester</p>
      </div>
      <!-- Group Member 3 -->
      <div class="member-card">
        <img src="images/member3.jpg" alt="Member 3">
        <h3>Prabesh Marasini</h3>
        <p>Front-end Developer, Back-end Developer, UI/UX Designer, Quality Assurance & Tester</p>
      </div>
      <!-- Group Member 4 -->
      <div class="member-card">
        <img src="images/member4.jpg" alt="Member 4">
        <h3>Samuel Acharya</h3>
        <p>Front-end Developer, Back-end Developer, UI/UX Designer, Quality Assurance & Tester</p>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="footer">
    <p>&copy; 2025 Grab & Go. All rights reserved.</p>
  </footer>
</body>
</html>
