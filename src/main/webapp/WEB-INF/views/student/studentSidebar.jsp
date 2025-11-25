<!-- studentSidebar.jsp -->

<%
String contextPath = request.getContextPath();
%>

<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background: #f5f6fa;
}

a {
	text-decoration: none;
}

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

/* Normal links */
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

/* Active item (Default -> Dashboard) */
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
	<h2>Student Panel</h2>

	<a href="<%=contextPath%>/student/dashboard"
		class="<%="dashboard".equals(request.getAttribute("activePage")) ? "active" : ""%>">
		Dashboard </a> 
		<a href="<%=contextPath%>/student/allCourses"
		class="<%="allcourses".equals(request.getAttribute("activePage")) ? "active" : ""%>">
		All Courses </a> 
		<a href="<%=contextPath%>/student/enrolledCourses"
		class="<%="enrolled".equals(request.getAttribute("activePage")) ? "active" : ""%>">
		Enrolled Courses </a> 
		<a href="<%=contextPath%>/student/myProfile"
		class="<%="profile".equals(request.getAttribute("activePage")) ? "active" : ""%>">
		My Profile </a> 
		<a href="<%=contextPath%>/student/logout">Logout</a>
</div>
