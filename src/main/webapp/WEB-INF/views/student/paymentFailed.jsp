<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Failed</title>

<style>
body {
	margin: 0;
	font-family: 'Segoe UI', sans-serif;
	background: #f4f6f9;
}

.main-content {
	margin-left: 230px;
	padding: 40px;
}

.card-failed {
	width: 420px;
	margin: 40px auto;
	background: #fff;
	padding: 25px;
	border-radius: 12px;
	text-align: center;
	box-shadow: 0 3px 15px rgba(0,0,0,0.15);
}

.card-failed h2 {
	color: #dc3545;
	margin-bottom: 10px;
}

.card-failed p {
	font-size: 16px;
	color: #333;
}

.btn-try {
	display: inline-block;
	margin-top: 20px;
	padding: 10px 18px;
	background: #dc3545;
	color: white;
	text-decoration: none;
	border-radius: 8px;
}

.btn-try:hover {
	background: #b52d3a;
}
</style>

</head>
<body>

	<%@ include file="studentSidebar.jsp" %>

	<div class="main-content">

		<div class="card-failed">
			<h2>Payment Failed </h2>
			<p>Something went wrong while processing your payment.</p>
			<p>Please try again later.</p>

			<a class="btn-try" href="<%=request.getContextPath()%>/student/allCourses">
				Try Again
			</a>
		</div>

	</div>

</body>
</html>
