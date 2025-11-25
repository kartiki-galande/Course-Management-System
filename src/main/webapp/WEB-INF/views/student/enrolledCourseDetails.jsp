<%@page import="com.entity.Enrollment"%>
<%@page import="com.entity.Course"%>
<%
Course course = (Course) request.getAttribute("course");
Enrollment enrollment = (Enrollment) request.getAttribute("enrollment");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enrolled Course Details</title>

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

    .details-box {
        width: 620px;
        max-width: calc(100% - 40px);
        padding: 28px;
        background: rgba(255,255,255,0.78);
        backdrop-filter: blur(12px);
        border-radius: 16px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.12);
        border: 1px solid rgba(255,255,255,0.6);
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
        background: rgba(255,255,255,0.95);
        font-size: 14px;
    }

    input[readonly], textarea[readonly] {
        background: rgba(255,255,255,0.6);
    }

    textarea {
        min-height: 110px;
        resize: vertical;
    }

    .full {
        grid-column: 1 / -1;
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
        box-shadow: 0 6px 18px rgba(0,0,0,0.12);
        font-size: 14px;
        text-decoration: none;
    }

    .btn-back {
        background: white;
        border: 1px solid #ddd;
        color: #2c3e50;
    }

    .btn-unenroll {
        background: #ff4b5c;
        color: white;
    }

    .btn-unenroll:hover {
        background: #e63946;
        transform: translateY(-3px);
    }

    .btn-back:hover { transform: translateY(-2px); }

    @media (max-width: 800px) {
        .details-grid { grid-template-columns: 1fr; }
        .actions { justify-content: center; }
    }
</style>
</head>

<body>

<%@ include file="studentSidebar.jsp" %>

<div class="main-content">
    <div class="details-box">

        <div class="details-head">
            <h2>Enrolled Course Details</h2>
        </div>

        <div class="details-grid">

            <div class="field full">
                <label>Course Name</label>
                <input type="text" value="<%= course.getTitle() %>" readonly>
            </div>

            <div class="field">
                <label>Duration </label>
                <input type="text" value="<%= course.getDuration() %>" readonly>
            </div>

            <div class="field">
                <label>Price</label>
                <input type="text" value="<%= course.getPrice() %>" readonly>
            </div>

            <div class="field full">
                <label>Start Date</label>
                <input type="date" value="<%= course.getStartDate() %>" readonly>
            </div>
            
             <div class="field full">
                <label>Enrolled Date</label>
                <input type="date" value="<%= enrollment.getEnrollmentDate() %>" readonly>
            </div>

            <div class="field full">
                <label>Description</label>
                <textarea readonly><%= course.getDescription() %></textarea>
            </div>

        </div>

        <div class="actions">
            <a href="<%= contextPath %>/student/enrolledCourses" class="btn btn-back">Back</a>

            <a href="<%= contextPath %>/student/unenroll/<%= enrollment.getCourseId() %>" 
               class="btn btn-unenroll">
                Unenroll
            </a>
        </div>

    </div>
</div>

</body>
</html>
