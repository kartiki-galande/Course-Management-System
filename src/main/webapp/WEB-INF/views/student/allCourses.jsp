<%@page import="com.entity.Enrollment"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Course"%>

<%
List<Course> courses = (List<Course>) request.getAttribute("courses");
List<Integer> enrolledCourseIds = (List<Integer>) request.getAttribute("courseIds");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Courses</title>

<style>
body {
	margin: 0;
	font-family: 'Segoe UI', sans-serif;
	background: #f5f7fa;
}

.main-content {
	margin-left: 230px;
	padding: 30px;
}

h2 {
	margin: 0 0 20px 0;
	color: #2c3e50;
}

.course-box {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
}

.course-card {
	width: 280px;
	background: white;
	padding: 18px;
	border-radius: 12px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	border: 1px solid #ddd;
}

.course-card h3 {
	margin: 0 0 10px 0;
	font-size: 18px;
	color: #34495e;
}

.course-card p {
	margin: 6px 0;
	font-size: 14px;
	color: #555;
}

.btn-view {
	display: inline-block;
	margin-top: 12px;
	padding: 8px 12px;
	background: #2575fc;
	color: white;
	border-radius: 8px;
	text-decoration: none;
	font-size: 14px;
}

.btn-view:hover {
	background: #1e63d6;
}

.btn-enroll {
	display: inline-block;
	margin-top: 8px;
	padding: 8px 12px;
	background: #28a745;
	color: white;
	border-radius: 8px;
	text-decoration: none;
	font-size: 14px;
}

.btn-enroll:hover {
	background: #1e7e34;
}

.btn-enroll.disabled {
	pointer-events: none;
	background: #aaa;
	cursor: not-allowed;
	opacity: 0.6;
}
</style>

</head>

<body>

	<%@ include file="studentSidebar.jsp"%>

	<div class="main-content">
		<h2>Available Courses</h2>

		<div class="course-box">
			<%
			if (courses != null) {
				for (Course c : courses) {
			%>

			<div class="course-card">
				<h3><%=c.getTitle()%></h3>
				<p>
					<b>Duration:</b>
					<%=c.getDuration()%>
				</p>
				<p>
					<b>Price:</b> Rs.
					<%=c.getPrice()%></p>
				<%
				boolean isEnrolled = enrolledCourseIds.contains(c.getId());
				%>
				<a class="btn-view"
					href="<%=contextPath%>/student/courseDetail/<%=c.getId()%>/<%= isEnrolled%>">
					View Details </a> 
					<a
					class="btn-enroll <%=isEnrolled ? "disabled" : ""%>"
					href="<%=isEnrolled ? "#" : contextPath + "/student/pay/" + c.getId()%>">
					<%=isEnrolled ? "Enrolled" : "Enroll"%>
				</a>

			</div>

			<%
			}
			} else {
			%>

			<p>No courses available</p>

			<%
			}
			%>
		</div>

	</div>

</body>
</html>
