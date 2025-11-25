<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
int totalCourses = (int) request.getAttribute("totalCourses");
int totalEnrolledCourses = (int) request.getAttribute("totalEnrolledCourses");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student | Course Management System</title>
<style>

body {
    margin: 0;
    font-family: "Segoe UI", Arial, sans-serif;
    background: #f5f6fa;
}

/* Content area */
.content {
    margin-left: 230px;
    padding: 40px;
}

.content h1 {
    font-size: 28px;
    color: #333;
    letter-spacing: 0.5px;
    margin-bottom: 10px;
}

.content p {
    color: #555;
    font-size: 15px;
    margin-top: 5px;
}

/* Cards container */
.dashboard-cards {
	display: flex;
	gap: 20px;
	flex-wrap: wrap;
}

/* Individual card */
.card {
	width: 250px;
	cursor: pointer;
	background: #fff;
	padding: 25px;
	border-radius: 12px;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
	border-left: 6px solid #4a69bd;
}

.card h2 {
	font-size: 38px;
	margin: 0;
	color: #2c3e50;
}

.card p {
	margin-top: 8px;
	color: #666;
	font-size: 15px;
	letter-spacing: 0.3px;
}

.card:hover {
	transform: scale(1.05);
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.15);
}

/* Colors for each card */
.card.totalCourses {
	border-left-color: #1e90ff;
}

.card.totalEnrolledCourses {
	border-left-color: #20c997;
}

</style>

</head>

<body>

<!-- Sidebar -->
<%@ include file="studentSidebar.jsp" %>

<!-- Content Area -->
<div class="content">
   <h1>Student Dashboard</h1>

		<div class="dashboard-cards">

			<div class="card totalCourses" onclick="location.href='<%= contextPath %>/student/allCourses'">
				<h2><%= totalCourses %></h2>
				<p>Total Courses</p>
			</div>

			<div class="card totalEnrolledCourses" onclick="location.href='<%= contextPath %>/student/enrolledCourses'">
				<h2><%= totalEnrolledCourses %></h2>
				<p>Total Enrolled Courses</p>
			</div>

		</div>
</div>

</body>
</html>
