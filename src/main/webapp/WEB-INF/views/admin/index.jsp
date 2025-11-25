<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
int totalCourses = (int) request.getAttribute("totalCourses");
int totalStudents = (int) request.getAttribute("totalStudents");
int enrolled = (int) request.getAttribute("totalEnrolledStudents");
int notEnrolled = (int) request.getAttribute("totalNonEnrolledStudents");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Dashboard</title>

<style>
body {
	margin: 0;
	font-family: "Segoe UI", Arial, sans-serif;
	background: #f5f6fa;
}

/* Main content area */
.content {
	margin-left: 230px;
	padding: 40px;
}

h1 {
	font-size: 26px;
	color: #333;
	margin-bottom: 25px;
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
.card.courses {
	border-left-color: #1e90ff;
}

.card.students {
	border-left-color: #20c997;
}

.card.enrolled {
	border-left-color: #28a745;
}

.card.unenrolled {
	border-left-color: #e74c3c;
}
</style>
</head>

<body>

	<%@ include file="adminSidebar.jsp"%>

	<div class="content">

		<h1>Admin Dashboard</h1>

		<div class="dashboard-cards">

			<div class="card courses" onclick="location.href='<%= contextPath %>/admin/manageCourses'">
				<h2><%= totalCourses %></h2>
				<p>Total Courses</p>
			</div>

			<div class="card students" onclick="location.href='<%= contextPath %>/admin/manageStudents'">
				<h2><%= totalStudents %></h2>
				<p>Total Students</p>
			</div>

			<div class="card enrolled" onclick="location.href='<%= contextPath %>/admin/manageStudents'">
				<h2><%= enrolled %></h2>
				<p>Enrolled Students</p>
			</div>

			<div class="card unenrolled" onclick="location.href='<%= contextPath %>/admin/manageStudents'">
				<h2><%= notEnrolled %></h2>
				<p>Not Enrolled Students</p>
			</div>

		</div>

	</div>

</body>
</html>
