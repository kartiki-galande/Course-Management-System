<%@page import="java.util.List"%>
<%@page import="com.entity.Student"%>
<%@page import="java.util.Map"%>

<%
    List<Student> students = (List<Student>) request.getAttribute("students");
    Map<Integer, Boolean> enrollmentStatus = (Map<Integer, Boolean>) request.getAttribute("enrollmentStatus");
%>

<!DOCTYPE html>
<html>
<head>
<title>Student List</title>

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

h2 {
	margin: 0 0 20px 0;
	color: #2c3e50;
}

.table-box {
	width: 95%;
	background: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
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

.status-enrolled {
	color: #28a745;
	font-weight: bold;
}

.status-not {
	color: #dc3545;
	font-weight: bold;
}
</style>

</head>
<body>

	<%@ include file="adminSidebar.jsp"%>

	<div class="content">
		<h2>All Students</h2>

		<div class="table-box">

			<table>
				<tr>
					<th>Name</th>
					<th>Email</th>
					<th>College</th>
					<th>Gender</th>
					<th>Status</th>
					<th>Details</th>
				</tr>

				<%
			if (students != null && students.size() > 0) {
				for (Student st : students) {

					boolean isEnrolled = enrollmentStatus.containsKey(st.getId()) 
					                     && enrollmentStatus.get(st.getId());
			%>

				<tr>
					<td><%= st.getName() %></td>
					<td><%= st.getEmail() %></td>
					<td><%= st.getClgName() %></td>
					<td><%= st.getGender() %></td>

					<td>
						<% if (isEnrolled) { %> <span class="status-enrolled">Enrolled</span>
						<% } else { %> <span class="status-not">Not Enrolled</span> <% } %>
					</td>
					<td><a
						href="<%= request.getContextPath() %>/admin/viewStudent/<%= st.getId() %>"
						style="color: #007bff; text-decoration: none; font-weight: bold;">
							View </a></td>
				</tr>

				<%
				}
			} else {
			%>

				<tr>
					<td colspan="5" style="text-align: center; padding: 15px;">No
						students registered yet.</td>
				</tr>

				<%
			}
			%>

			</table>

		</div>

	</div>

</body>
</html>
