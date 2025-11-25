<%@page import="com.entity.Course"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Course</title>
<% Course course = (Course) request.getAttribute("course"); %>
<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', sans-serif;
        background: linear-gradient(135deg, #e0f7fa, #e8eaf6, #fce4ec);
        background-size: 300% 300%;
        animation: gradientMove 10s ease infinite;
    }

    @keyframes gradientMove {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    .main-content {
        margin-left: 230px;
        padding: 40px;
        display: flex;
        justify-content: center;
        align-items: flex-start;
        min-height: 100vh;
    }

    .form-box {
        width: 600px;
        max-width: calc(100% - 40px);
        padding: 28px;
        background: rgba(255,255,255,0.78);
        backdrop-filter: blur(12px);
        border-radius: 16px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.12);
        border: 1px solid rgba(255,255,255,0.6);
    }

    .form-head {
        text-align: center;
        margin-bottom: 20px;
    }
    .form-head h2 {
        margin: 0;
        font-size: 24px;
        color: #2c3e50;
        font-weight: 700;
    }

    .form-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 16px 18px;
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

    input[type="text"],
    input[type="number"],
    input[type="date"],
    textarea {
        padding: 10px 12px;
        border-radius: 10px;
        border: 1px solid #d0d6dd;
        background: rgba(255,255,255,0.95);
        font-size: 14px;
    }

    textarea {
        resize: vertical;
        min-height: 100px;
    }

    .full {
        grid-column: 1 / -1;
    }

    .actions {
        margin-top: 20px;
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
        box-shadow: 0 6px 18px rgba(0,0,0,0.12);
        font-size: 14px;
    }

    .btn-primary {
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        color: white;
    }

    .btn-secondary {
        background: white;
        color: #2c3e50;
        border: 1px solid #e3e7ee;
    }

    .btn-primary:hover { transform: translateY(-3px); }
    .btn-secondary:hover { transform: translateY(-2px); }

    @media (max-width: 800px) {
        .form-grid { grid-template-columns: 1fr; }
        .actions { justify-content: center; }
    }
</style>
</head>

<body>

<%@ include file="adminSidebar.jsp" %>

<div class="main-content">
    <div class="form-box">
        <div class="form-head">
            <h2>Update Course</h2>
        </div>

        <form action="<%= contextPath %>/admin/updateCourse" method="post">

            <!-- Hidden ID -->
            <input type="hidden" name="id" value="<%= course.getId() %>">

            <div class="form-grid">

                <div class="field full">
                    <label>Course Name <span style="color:#d33">*</span></label>
                    <input type="text" name="title" value="<%= course.getTitle() %>" required>
                </div>

                <div class="field">
                    <label>Duration <span style="color:#d33">*</span></label>
                    <input type="text" name="duration" min="1" value="<%= course.getDuration() %>" required>
                </div>

                <div class="field">
                    <label>Price </label>
                    <input type="number" name="price" step="0.01" min="0" value="<%= course.getPrice() %>">
                </div>

                <div class="field full">
                    <label>Start Date</label>
                    <input type="date" name="startDate" value="<%= course.getStartDate() %>">
                </div>

                <div class="field full">
                    <label>Description</label>
                    <textarea name="description"><%= course.getDescription() %></textarea>
                </div>

            </div>

            <div class="actions">
                <a href="<%= contextPath %>/admin/courseDetail/<%= course.getId() %>" class="btn btn-secondary">Cancel</a>
                <button type="submit" class="btn btn-primary">Update Course</button>
            </div>

        </form>

    </div>
</div>

</body>
</html>
