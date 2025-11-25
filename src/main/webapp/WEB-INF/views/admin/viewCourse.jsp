<%@page import="com.entity.Course"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Course Details</title>
<%
Course course = (Course) request.getAttribute("course");
%>
<style>
body {
	margin: 0;
	font-family: 'Segoe UI', sans-serif;
	background: #f4f6f9;
	background-size: 300% 300%;
	animation: gradientMove 10s ease infinite;
}

@
keyframes gradientMove { 0% {
	background-position: 0% 50%;
}

50


%
{
background-position


:


100
%


50
%;


}
100


%
{
background-position


:


0
%


50
%;


}
}
.main-content {
	margin-left: 230px;
	padding: 40px;
	display: flex;
	justify-content: center;
	align-items: flex-start;
	min-height: 100vh;
}

.details-box {
	width: 620px;
	max-width: calc(100% - 40px);
	padding: 28px;
	background: #fff;
	backdrop-filter: blur(12px);
	border-radius: 16px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.12);
	border: 1px solid rgba(255, 255, 255, 0.6);
}

.details-head {
	text-align: center;
	margin-bottom: 20px;
}

.details-head h2 {
	margin: 0;
	font-size: 24px;
	color: #2c3e50;
	font-weight: 700;
}

.details-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 18px 20px;
	margin-top: 20px;
}

.field {
	display: flex;
	flex-direction: column;
}

label {
	font-size: 13px;
	color: #3b4956;
	margin-bottom: 6px;
	font-weight: 600;
}

input, textarea {
	padding: 10px 12px;
	border-radius: 10px;
	border: 1px solid #d0d6dd;
	background: rgba(255, 255, 255, 0.95);
	font-size: 14px;
}

input[readonly], textarea[readonly] {
	background: rgba(255, 255, 255, 0.6);
}

textarea {
	min-height: 110px;
	resize: vertical;
}

.full {
	grid-column: 1/-1;
}

.actions {
	margin-top: 25px;
	display: flex;
	justify-content: flex-end;
	gap: 12px;
}

.btn {
	padding: 10px 16px;
	border-radius: 10px;
	font-weight: 600;
	border: none;
	cursor: pointer;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.12);
	font-size: 14px;
}

.btn-update {
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	color: white;
}

.btn-delete {
	background: #ff4b5c;
	color: white;
}

.btn-back {
	background: white;
	border: 1px solid #ddd;
	color: #2c3e50;
}

/* Modal background overlay */
.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.45);
	backdrop-filter: blur(3px);
	justify-content: center;
	align-items: center;
	z-index: 9999;
}

/* Modal box */
.modal-content {
	width: 380px;
	background: rgba(255, 255, 255, 0.8);
	padding: 25px;
	border-radius: 14px;
	text-align: center;
	box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
	animation: pop 0.3s ease;
}

@
keyframes pop {from { transform:scale(0.6);
	opacity: 0;
}

to {
	transform: scale(1);
	opacity: 1;
}

}
.modal-content h3 {
	margin: 0;
	font-size: 20px;
	font-weight: 700;
	color: #2c3e50;
}

.modal-content p {
	font-size: 14px;
	margin: 12px 0 20px;
	color: #4a4a4a;
}

.modal-actions {
	display: flex;
	justify-content: space-between;
	gap: 15px;
}

.modal-actions .btn {
	flex: 1;
	padding: 10px 0;
	border-radius: 10px;
	font-size: 14px;
	cursor: pointer;
	text-decoration: none;
	font-weight: 600;
}

.modal-actions .cancel {
	background: white;
	border: 1px solid #ccc;
	color: #2c3e50;
}

.modal-actions .delete {
	background: #ff4b5c;
	color: white;
}

.modal-actions .delete:hover {
	background: #e63946;
}

.modal-actions .cancel:hover {
	background: #f2f2f2;
}

.btn-update:hover {
	transform: translateY(-3px);
}

.btn-delete:hover {
	transform: translateY(-3px);
	background: #e63946;
}

.btn-back:hover {
	transform: translateY(-2px);
}

@media ( max-width : 800px) {
	.details-grid {
		grid-template-columns: 1fr;
	}
	.actions {
		justify-content: center;
	}
}
</style>
</head>

<body>

	<%@ include file="adminSidebar.jsp"%>

	<div class="main-content">
		<div class="details-box">

			<div class="details-head">
				<h2>Course Details</h2>
			</div>

			<div class="details-grid">

				<div class="field full">
					<label>Course Name</label> <input type="text"
						value="<%=course.getTitle()%>" readonly>
				</div>

				<div class="field">
					<label>Duration </label> <input type="text"
						value="<%=course.getDuration()%>" readonly>
				</div>

				<div class="field">
					<label>Price </label> <input type="number"
						value="<%=course.getPrice()%>" readonly>
				</div>

				<div class="field full">
					<label>Start Date</label> <input type="date" readonly
						value="<%=course.getStartDate()%>">
				</div>

				<div class="field full">
					<label>Description</label>
					<textarea readonly><%=course.getDescription()%></textarea>
				</div>

			</div>

			<div class="actions">
				<a href="<%=contextPath%>/admin/manageCourses"
					class="btn btn-back">Back</a> <a
					href="<%=contextPath%>/admin/updateCoursePage/<%=course.getId()%>"
					class="btn btn-update">Update</a> <a
					onclick="openModal('<%=contextPath%>/admin/deleteCourse/<%=course.getId()%>')"
					class="btn btn-delete" style="color: white;"> Delete </a>
			</div>

		</div>
	</div>
	<!-- Delete Confirmation Modal -->
	<div id="deleteModal" class="modal">
		<div class="modal-content">
			<h3>Delete Course?</h3>
			<p>Are you sure you want to delete this course? This action
				cannot be undone.</p>

			<div class="modal-actions">
				<button class="btn cancel" onclick="closeModal()">Cancel</button>
				<a id="confirmDeleteBtn" href="#" class="btn delete">Delete</a>
			</div>
		</div>
	</div>
	<script>
		function openModal(deleteUrl) {
			document.getElementById("deleteModal").style.display = "flex";
			document.getElementById("confirmDeleteBtn").href = deleteUrl;
		}

		function closeModal() {
			document.getElementById("deleteModal").style.display = "none";
		}
	</script>

</body>
</html>
