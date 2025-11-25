<%@page import="java.util.List"%>
<%@page import="com.entity.Student"%>
<%@page import="com.entity.Course"%>

<%
    Student student = (Student) request.getAttribute("student");
    List<Course> courses = (List<Course>) request.getAttribute("courses");
%>

<!DOCTYPE html>
<html>
<head>
<title>Student Details</title>

<style>
body {
	margin: 0;
	font-family: 'Segoe UI', sans-serif;
	background: #f4f6f9;
}

.content {
	margin-left: 230px;
	padding: 30px;
}

.card {
	width: 650px;
	background: #fff;
	padding: 25px;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h2 {
	margin: 0 0 20px 0;
	color: #2c3e50;
}

.section-title {
	margin-top: 25px;
	font-size: 18px;
	font-weight: bold;
	color: #2c3e50;
	border-bottom: 2px solid #eee;
	padding-bottom: 8px;
}

.detail-row {
	display: flex;
	justify-content: space-between;
	padding: 12px 0;
	border-bottom: 1px solid #eee;
	font-size: 16px;
}

.detail-row label {
	font-weight: bold;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 15px;
}

th, td {
	padding: 12px;
	text-align: left;
	border-bottom: 1px solid #ddd;
	font-size: 15px;
}

th {
	background: #f0f3f7;
	font-weight: bold;
	color: #2c3e50;
}

.btn-wrapper {
    width: 100%;
    display: flex;
    justify-content: flex-end;  /* pushes button to right */
    margin-top: 20px;
}

.btn-back {
    padding: 10px 20px;
    background: #555;
    color: white;
    text-decoration: none;
    border-radius: 6px;
}

.btn-back:hover {
    background: #333;
}

</style>

</head>
<body>

	<%@ include file="adminSidebar.jsp"%>

	<div class="content">

		<div class="card">

			<h2>Student Details</h2>

			<!-- Student Info -->
			<div class="detail-row">
				<label>Name:</label> <span><%= student.getName() %></span>
			</div>

			<div class="detail-row">
				<label>Email:</label> <span><%= student.getEmail() %></span>
			</div>

			<div class="detail-row">
				<label>Gender:</label> <span><%= student.getGender() %></span>
			</div>

			<div class="detail-row">
				<label>College:</label> <span><%= student.getClgName() %></span>
			</div>

			<!-- Enrolled Courses Section Inside Same Card -->
			<div class="section-title">Enrolled Courses</div>

			<table>
				<tr>
					<th>Course Name</th>
					<th>Description</th>
				</tr>

				<%
                if (courses != null && courses.size() > 0) {
                    for (Course c : courses) {
            %>

				<tr>
					<td><%= c.getTitle() %></td>
					<td><%= c.getDescription() %></td>
				</tr>

				<%
                    }
                } else {
            %>

				<tr>
					<td colspan="2" style="text-align: center; padding: 15px;">No
						courses enrolled.</td>
				</tr>

				<%
                }
            %>
			</table>

			<div class="btn-wrapper">
				<a href="<%= request.getContextPath() %>/admin/manageStudents"
					class="btn-back">Back</a>
			</div>


		</div>

	</div>

</body>
</html>
