<%@page import="com.entity.Course"%>

<%
Course course = (Course) request.getAttribute("course");
boolean isEnrolled = (boolean) request.getAttribute("isEnrolled");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Course Details</title>

<style>
body {
	margin: 0;
	font-family: 'Segoe UI', sans-serif;
	background: #f5f7fa;
}

/* Main layout pushes page right because of sidebar */
.main-content {
	margin-left: 230px;
	padding: 40px;
	min-height: 100vh;
	display: flex;
	justify-content: center; /* Center horizontally */
	align-items: flex-start; /* Align slightly from top */
}

/* Center box */
.details-box {
	width: 600px;
	background: white;
	padding: 30px 70px 30px 40px;
	border-radius: 14px;
	box-shadow: 0 5px 25px rgba(0, 0, 0, 0.12);
	border: 1px solid #ddd;
}

h2 {
	margin: 0 0 24px 0;
	text-align: center;
	font-size: 22px;
	font-weight: 700;
	color: #2c3e50;
}

label {
	font-size: 14px;
	font-weight: 600;
	color: #555;
}

input, textarea {
	width: 100%;
	padding: 10px 12px;
	margin-top: 4px;
	margin-bottom: 18px;
	border-radius: 8px;
	border: 1px solid #ccc;
	background: #fafafa;
	font-size: 14px;
}

textarea {
	resize: vertical;
	min-height: 110px;
}

.btn-back {
	padding: 10px 16px;
	background: #444;
	color: white;
	text-decoration: none;
	border-radius: 8px;
	font-size: 14px;
	display: inline-block;
	margin-top: 10px;
}

.btn-back:hover {
	background: #222;
}

.btn-enroll-detail {
	padding: 10px 16px;
	background: #28a745;
	color: white;
	border-radius: 8px;
	text-decoration: none;
	font-size: 14px;
	font-weight: 600;
	margin-top: 10px;
}

.btn-enroll-detail:hover {
	background: #1e7e34;
}

.btn-enroll-detail.disabled {
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

		<div class="details-box">

			<h2>Course Details</h2>

			<label>Course Name</label> <input type="text" readonly
				value="<%=course.getTitle()%>"> <label>Duration
				</label> <input type="text" readonly
				value="<%=course.getDuration()%>"> <label>Price</label> <input
				type="text" readonly value="<%=course.getPrice()%>"> <label>Start
				Date</label> <input type="date" readonly
				value="<%=course.getStartDate()%>"> <label>Description</label>
			<textarea readonly><%=course.getDescription()%></textarea>
		
			<div
				style="display: flex; justify-content: flex-end; gap: 12px; margin-top: 10px;">

				<a href="<%=contextPath%>/student/allCourses" class="btn-back">Back</a>

				<a
					href="<%=isEnrolled ? "#" : contextPath + "/student/enroll/" + course.getId()%>"
					class="btn-enroll-detail <%=isEnrolled ? "disabled" : ""%>"> <%=isEnrolled ? "Enrolled" : "Enroll Now"%>
				</a>

			</div>

		</div>

	</div>

</body>
</html>
