<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Staff" %>
<%@ page import="DAO.StaffDAO" %>

<%
    StaffDAO staffDAO = new StaffDAO();
    List<Staff> staffList = staffDAO.getAllStaff();
    request.setAttribute("staffList", staffList);
%>

<jsp:include page="admin-header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Delete Staff</title>
    <style>
        :root {
            --primary: #E2725B;
            --secondary: #F5F5DC;
            --accent1: #A0522D;
            --accent2: #FFDAB9;
            --bg-light: #FFF5E9;
            --danger: #D94F4F;
            --danger-hover: #B03B3B;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: var(--secondary);
            padding: 40px;
            color: var(--accent1);
            margin: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 16px rgba(160, 82, 45, 0.15);
        }

        th, td {
            padding: 15px 20px;
            text-align: left;
            border-bottom: 1px solid var(--accent2);
        }

        th {
            background-color: var(--primary);
            color: white;
            font-weight: 700;
            letter-spacing: 0.05em;
        }

        tr:hover {
            background-color: var(--bg-light);
        }

        .delete-button {
            background-color: var(--danger);
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 700;
            transition: background-color 0.3s ease;
        }

        .delete-button:hover {
            background-color: var(--danger-hover);
        }

        h2 {
            text-align: center;
            color: var(--primary);
            margin-bottom: 20px;
            font-weight: 700;
            font-size: 2rem;
            letter-spacing: 0.08em;
        }

        .no-records {
            text-align: center;
            color: var(--accent1);
            font-weight: 600;
            padding: 20px;
        }

        @media screen and (max-width: 600px) {
            table, th, td {
                font-size: 0.9rem;
            }
            h2 {
                font-size: 1.6rem;
            }
        }
    </style>
</head>
<body>

<c:if test="${not empty sessionScope.message}">
    <p style="color: var(--primary); text-align: center;">${sessionScope.message}</p>
    <c:remove var="message" scope="session"/>
</c:if>

<h2>Delete Staff Records</h2>

<c:choose>
    <c:when test="${empty staffList}">
        <p class="no-records">No staff records found.</p>
    </c:when>
    <c:otherwise>
        <table>
            <thead>
                <tr>
                    <th>Staff ID</th>
                    <th>Name</th>
                    <th>Username</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>Salary</th>
                    <th>Shift</th>
                    <th>Hire Date</th>
                    <th>Job Title</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="staff" items="${staffList}">
                    <tr>
                        <td>${staff.staffId}</td>
                        <td>${staff.firstName} ${staff.lastName}</td>
                        <td>${staff.username}</td>
                        <td>${staff.phone}</td>
                        <td>${staff.email}</td>
                        <td>${staff.gender}</td>
                        <td>${staff.salary}</td>
                        <td>${staff.shift}</td>
                        <td>${staff.hireDate}</td>
                        <td>${staff.jobTitle}</td>
                        <td>
                            <form action="DeleteStaffServlet" method="post" onsubmit="return confirm('Are you sure you want to delete ${staff.firstName} ${staff.lastName}?');">
                                <input type="hidden" name="staffId" value="${staff.staffId}" />
                                <button type="submit" class="delete-button">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>

</body>
</html>
