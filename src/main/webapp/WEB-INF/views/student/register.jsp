<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register | Course Management System</title>
<%
String contextPath = request.getContextPath();
%>
<% String msg = (String) request.getAttribute("msg"); %>

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

.register-box {
	background: #ffffff;
	padding: 40px;
	width: 420px;
	border-radius: 10px;
	border: 1px solid #e0e0e0;
	box-sizing: border-box;
}

.register-box h2 {
	text-align: center;
	font-weight: 500;
	color: #333;
	margin-bottom: 25px;
}

/* Labels */
label {
	font-size: 14px;
	color: #444;
}

/* Inputs */
input[type=text], input[type=email], input[type=password] {
	width: 100%;
	padding: 10px 12px;
	margin-top: 6px;
	margin-bottom: 18px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 14px;
	background: #fafafa;
	box-sizing: border-box;
}

/* Dropdown */
select {
	width: 100%;
	padding: 10px 12px;
	margin-top: 6px;
	margin-bottom: 18px;
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

/* Footer link */
.footer-links {
	text-align: center;
	margin-top: 18px;
}

.footer-links a {
	text-decoration: none;
	color: #4a69bd;
	font-weight: bold;
	font-size: 14px;
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

	<div class="register-box">

		<h2>Student Registration</h2>
		<% if(msg!=null) { %>
		<div class="error-msg"><%= msg %></div>
		<% } %>
		<form action="registerStudent" method="post">

			<label>Name</label> <input type="text" name="name" required>
			<label>Gender</label> <select name="gender" required>
				<option value="">Select Gender</option>
				<option value="Male">Male</option>
				<option value="Female">Female</option>
				<option value="Other">Other</option>
			</select> <label>College Name</label> <input type="text" name="clgName"
				required> <label>Email</label> <input type="email"
				name="email" required> <label>Password</label> <input
				type="password" name="password" required>

			<button type="submit">Register</button>
		</form>

		<div class="footer-links">
			<p>
				<a href="<%=contextPath%>/login">Already Registered? Login Here</a>
			</p>
		</div>

	</div>

</body>
</html>
