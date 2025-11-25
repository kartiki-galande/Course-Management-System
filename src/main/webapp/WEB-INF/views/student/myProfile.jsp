<%@page import="com.entity.Student"%>
<%@page import="com.entity.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Student s = (Student) request.getAttribute("student");
%>

<!DOCTYPE html>
<html>
<head>
<title>Student Profile</title>

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: #f4f6f9;
}

/* FIXED: Prevent header from going behind sidebar */
.content {
    margin-left: 230px;  
    padding: 30px;
}

.header h2 {
    margin: 0 0 20px 0;
    color: #2c3e50;
}

.profile-card {
    background: #fff;
    padding: 25px;
    border-radius: 10px;
    width: 500px;
    margin: 0 auto;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
}

.profile-row {
    display: flex;
    justify-content: space-between;
    padding: 12px 0;
    border-bottom: 1px solid #eee;
    font-size: 16px;
}

.profile-row label {
    font-weight: bold;
}

.btn-container {
    margin-top: 20px;
    text-align: right;
}

.btn-back {
    padding: 10px 20px;
    background: #555;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}

.btn-back:hover {
    background: #333;
}
</style>
</head>
<body>

<%@ include file="studentSidebar.jsp"%>

<div class="content">

    <div class="header">
        <h2>Student Profile</h2>
    </div>

    <div class="card profile-card">

        <div class="profile-row">
            <label>Name:</label> <span><%= s.getName() %></span>
        </div>

        <div class="profile-row">
            <label>Email:</label> <span><%= s.getEmail() %></span>
        </div>

        <div class="profile-row">
            <label>College:</label> <span><%= s.getClgName() %></span>
        </div>

        <div class="profile-row">
            <label>Gender:</label> <span><%= s.getGender() %></span>
        </div>

        <div class="btn-container">
            <a href="<%=contextPath%>/student/dashboard" class="btn-back">Back</a>
        </div>

    </div>

</div>

</body>
</html>
