<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.entity.Student"%>
<%@page import="com.entity.Course"%>

<%
    Student stu = (Student) request.getAttribute("student");
    Course course = (Course) request.getAttribute("course");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Process Payment</title>

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

.payment-card {
	width: 420px;
	margin: 40px auto;
	background: #fff;
	padding: 25px;
	border-radius: 12px;
	box-shadow: 0 3px 15px rgba(0,0,0,0.15);
}

.payment-card h2 {
	margin: 0 0 15px 0;
	color: #2c3e50;
	text-align: center;
}

.payment-row {
	margin: 12px 0;
	font-size: 16px;
	color: #333;
}

.payment-row b {
	color: #000;
}

.btn-pay {
	display: block;
	width: 100%;
	text-align: center;
	margin-top: 20px;
	padding: 12px 0;
	background: #28a745;
	color: white;
	font-size: 16px;
	text-decoration: none;
	border-radius: 8px;
}

.btn-pay:hover {
	background: #1e7e34;
}
</style>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<%@ include file="studentSidebar.jsp" %>

	<div class="main-content">

		<div class="payment-card">

			<h2>Payment Summary</h2>

			<div class="payment-row">
				<b>Student:</b> <%= stu.getName() %>
			</div>

			<div class="payment-row">
				<b>Course:</b> <%= course.getTitle() %>
			</div>

			<div class="payment-row">
				<b>Duration:</b> <%= course.getDuration() %> hrs
			</div>

			<div class="payment-row">
				<b>Amount to Pay:</b> Rs. <%= course.getPrice() %>
			</div>

			<button class="btn-pay" id="payBtn">Pay Now</button>

		</div>

	</div>
<script>
    $(document).ready(function () {

        $("#payBtn").click(function (e) {
            e.preventDefault();

            // call backend to create order
            $.ajax({
                url: "<%= request.getContextPath() %>/student/createOrder",
                type: "POST",
                data: {
                    courseId: "<%= course.getId() %>",
                    studentEmail: "<%= stu.getEmail() %>"
                },
                success: function (data) {

                    var options = {
                        "key": data.key, 
                        "amount": data.amount,
                        "currency": "INR",
                        "name": "Course Payment",
                        "description": "Course Purchase",
                        "order_id": data.orderId, 
                        "handler": function (response) {

                            // After success – call backend
                            $.ajax({
                                url: "<%= request.getContextPath() %>/student/verifyPayment",
                                type: "POST",
                                data: {
                                    orderId: data.orderId,
                                    paymentId: response.razorpay_payment_id,
                                    signature: response.razorpay_signature,
                                    amount: data.amount,
                                    email: "<%= stu.getEmail() %>",
                                    courseId :"<%= course.getId() %>"
                                },
                                success: function (msg) {
                                    alert("Payment Successful");
                                    window.location.href = "<%= request.getContextPath() %>/student/paymentSuccess";
                                },
                                error: function () {
                                    alert("Payment verification failed");
                                    window.location.href = "<%= request.getContextPath() %>/student/paymentFailed";
                                }
                            });

                        },
                        "theme": {
                            "color": "#3399cc"
                        }
                    };

                    var rzp1 = new Razorpay(options);
                    rzp1.open();
                },
                error: function () {
                    alert("Something went wrong while creating order");
                    window.location.href = "<%= request.getContextPath() %>/student/paymentFailed";
                }
            });

        });
    });
</script>

</body>
</html>
