<%@page import="java.util.List"%>
<%@page import="com.entity.Course"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin - Courses</title>
<%
List<Course> courses = (List<Course>) request.getAttribute("courses");
%>
<style>
body {
	margin: 0;
	font-family: 'Segoe UI', sans-serif;
	background: #f4f6f9;
	background-size: 300% 300%;
	animation: gradientMove 10s ease infinite;
}

@
keyframes gradientMove { 0% {
	background-position: 0% 50%;
}

50
%
{
background-position
:
100%
50%;
}
100



%
{
background-position
 
:
0
%
 
50
%;


}
}
.main-content {
	margin-left: 230px;
	padding: 35px;
}

.top-bar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 35px;
}

.top-bar h1 {
	font-size: 32px;
	color: #2c3e50;
	font-weight: 700;
}

.add-btn {
	padding: 12px 22px;
	background: #3498db;
	color: white;
	font-size: 15px;
	border-radius: 8px;
	text-decoration: none;
	transition: 0.3s;
	font-weight: 500;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

.add-btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.25);
}

/* --- Cards --- */
.course-container {
	display: flex;
	flex-wrap: wrap;
	gap: 30px;
}

.course-card {
	width: 280px;
	padding: 22px;
	background: #fff;
	backdrop-filter: blur(12px);
	border-radius: 18px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
	transition: 0.25s;
	border: 1px solid rgba(255, 255, 255, 0.5);
	position: relative;
}

.course-card:hover {
	transform: translateY(-6px);
	box-shadow: 0 12px 25px rgba(0, 0, 0, 0.20);
}

.course-card h3 {
	margin: 0;
	font-size: 22px;
	color: #2c3e50;
	font-weight: 600;
}

.course-card p {
	margin: 8px 0;
	color: #555;
	font-size: 14px;
}

.view-btn {
	display: inline-block;
	margin-top: 15px;
	padding: 10px 16px;
	background: #3498db;
	color: white;
	border-radius: 6px;
	text-decoration: none;
	font-size: 14px;
	font-weight: 500;
	transition: 0.3s;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.15);
}

.view-btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
}
</style>

</head>

<body>

	<!-- Include Admin Sidebar -->
	<%@ include file="adminSidebar.jsp"%>

	<div class="main-content">

		<div class="top-bar">
			<h1>Available Courses</h1>
			<form action="<%=contextPath%>/admin/searchCourses" method="get"
				style="display: flex; gap: 10px;">
				<input type="text" name="keyword" placeholder="Search courses..."
					style="padding: 10px 15px; width: 250px; border-radius: 8px; border: 1px solid #ccc; font-size: 14px;" />

				<button type="submit"
					style="padding: 10px 20px; background: #3498db; color: white; border: none; border-radius: 8px; cursor: pointer; font-size: 14px;">
					Search</button>
			</form>
			<a href="<%=contextPath%>/admin/addCourseForm" class="add-btn">+
				Add Course</a>
		</div>

		<div class="course-container">
			<%
			if (courses == null || courses.isEmpty()) {
			%>

			<div class="no-course">
				<h2>No courses added yet</h2>
			</div>

			<%
			} else {
			%>

			<%
			for (Course c : courses) {
			%>
			<div class="course-card">
				<h3><%=c.getTitle()%></h3>

				<p>
					<b>Start Date :</b>
					<%=c.getStartDate()%></p>
				<p>
					<b>Duration :</b>
					<%=c.getDuration()%></p>
				<p>
					<b>Price : </b> Rs.
					<%=c.getPrice()%></p>

				<a href="<%=contextPath%>/admin/courseDetail/<%=c.getId()%>"
					class="view-btn"> View Details </a>
			</div>
			<%
			}
			%>

			<%
			}
			%>
		</div>

	</div>

</body>
</html>
