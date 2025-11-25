<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login | Course Management System</title>
<% String msg = (String) request.getAttribute("msg"); %>
<%
String contextPath = request.getContextPath();
%>
<style>
body {
	margin: 0;
	font-family: "Segoe UI", Arial, sans-serif;
	background: #f5f6fa;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

a{
text-decoration: none;
}

/* Clean centered card */
.login-box {
	background: #ffffff;
	padding: 40px;
	width: 360px;
	border-radius: 10px;
	border: 1px solid #e0e0e0;
	box-sizing: border-box;
}

/* Title */
.login-box h2 {
	text-align: center;
	font-weight: 500;
	color: #333;
	margin-bottom: 30px;
}

/* Labels */
label {
	font-size: 14px;
	color: #444;
}

/* Inputs centered by width + block display */
input[type=email], input[type=password] {
	width: 100%;
	display: block;
	padding: 10px 12px;
	margin-top: 6px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 14px;
	background: #fafafa;
	box-sizing: border-box;
}

/* Button */
button {
	width: 100%;
	padding: 10px;
	background: #4a69bd;
	border: none;
	border-radius: 6px;
	color: white;
	font-size: 15px;
	cursor: pointer;
	transition: 0.2s ease;
}

button:hover {
	background: #3c55a6;
}

/* Footer Links */
.footer-links {
	text-align: center;
	margin-top: 18px;
}

.footer-links a {
	text-decoration: none;
	color: #4a69bd;
	font-size: 14px;
	font-weight: bold; /* <-- made bold */
}

.footer-links a:hover {
	text-decoration: underline;
}

/*Error style*/
.error-msg {
	background: #ffdddd;
	border-left: 4px solid #e74c3c;
	padding: 10px;
	margin-bottom: 15px;
	color: #c0392b;
	border-radius: 4px;
	font-size: 14px;
}
</style>

</head>

<body>

	<div class="login-box">

		<h2>Login</h2>
		<% if(msg!=null) { %>
		<div class="error-msg"><%= msg %></div>
		<% } %>
		<form action="<%= contextPath %>/loginCheck" method="post">

			<label>Email</label> <input type="email" name="email" required>

			<label>Password</label> <input type="password" name="password"
				required>

			<button type="submit">Login</button>
		</form>

		<div class="footer-links">
			<p>
				<a href="<%= contextPath %>/student/register">New Student? Register Here</a>
			</p>
		</div>

	</div>

</body>
</html>
