
<% String contextPath =request.getContextPath(); %>

<style>

/* Sidebar */
.sidebar {
	position: fixed;
	left: 0;
	top: 0;
	width: 230px;
	height: 100%;
	background: #ffffff;
	border-right: 1px solid #e0e0e0;
	padding-top: 30px;
}

.sidebar h2 {
	text-align: center;
	font-size: 20px;
	color: #333;
	margin-bottom: 30px;
	font-weight: 500;
}

a{
text-decoration: none;
}

/* Default link */
.sidebar a {
	display: block;
	padding: 14px 25px;
	font-size: 15px;
	color: #333;
	text-decoration: none;
	border-bottom: 1px solid #f0f0f0;
}

/* Hover effect */
.sidebar a:hover {
	background: #eef1f7;
	color: #4a69bd;
}

/* Selected/Active item (default Dashboard) */
.sidebar a.active {
	background: #e4e9f7;
	color: #4a69bd;
	font-weight: bold;
}

.sidebar a.active {
	background: #3498db;
	color: white;
	font-weight: bold;
}
</style>

<div class="sidebar">
	<h2>Admin Panel</h2>

	<a href="<%= contextPath %>/admin/dashboard"
		class="<%= "dashboard".equals(request.getAttribute("activePage")) ? "active" : "" %>">
		Dashboard </a>
		 <a href="<%= contextPath %>/admin/myProfile"
		class="<%= "profile".equals(request.getAttribute("activePage")) ? "active" : "" %>">
		My Profile </a> 
		<a href="<%= contextPath %>/admin/manageCourses"
		class="<%= "manageCourses".equals(request.getAttribute("activePage")) ? "active" : "" %>">
		Courses </a>
		 <a href="<%= contextPath %>/admin/manageStudents"
		class="<%= "students".equals(request.getAttribute("activePage")) ? "active" : "" %>">
		Students </a>
		 <a href="<%= contextPath %>/admin/logout">Logout</a>
</div>
