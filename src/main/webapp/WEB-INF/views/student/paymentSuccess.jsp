<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Successful</title>

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

.card-success {
	width: 420px;
	margin: 40px auto;
	background: #fff;
	padding: 25px;
	border-radius: 12px;
	text-align: center;
	box-shadow: 0 3px 15px rgba(0,0,0,0.15);
}

.card-success h2 {
	color: #28a745;
	margin-bottom: 10px;
}

.card-success p {
	font-size: 16px;
	color: #333;
}

.btn-home {
	display: inline-block;
	margin-top: 20px;
	padding: 10px 18px;
	background: #2575fc;
	color: white;
	text-decoration: none;
	border-radius: 8px;
}

.btn-home:hover {
	background: #1e63d6;
}
</style>

</head>
<body>

	<%@ include file="studentSidebar.jsp" %>

	<div class="main-content">

		<div class="card-success">
			<h2>Payment Successful </h2>
			<p>Your payment has been received successfully.</p>
			<p>You are now enrolled in the course.</p>

			<a class="btn-home" href="<%=request.getContextPath()%>/student/dashboard">
				Go to Dashboard
			</a>
		</div>

	</div>

</body>
</html>
