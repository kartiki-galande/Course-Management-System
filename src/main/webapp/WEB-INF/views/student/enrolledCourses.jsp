<%@page import="java.util.List"%>
<%@page import="com.entity.Course"%>

<%
List<Course> enrolledCourses = (List<Course>) request.getAttribute("enrolledCourses");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Enrolled Courses</title>

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: #f5f7fa;
}

.main-content {
    margin-left: 230px;
    padding: 30px;
}

h2 {
    margin: 0 0 20px 0;
    color: #2c3e50;
}

.course-box {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
}

.course-card {
    width: 280px;
    background: white;
    padding: 18px;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    border: 1px solid #ddd;
}

.course-card h3 {
    margin: 0 0 10px 0;
    font-size: 18px;
    color: #34495e;
}

.course-card p {
    margin: 6px 0;
    font-size: 14px;
    color: #555;
}

.btn-view {
    display: inline-block;
    margin-top: 12px;
    padding: 8px 12px;
    background: #2575fc;
    color: white;
    border-radius: 8px;
    text-decoration: none;
    font-size: 14px;
}

.btn-view:hover {
    background: #1e63d6;
}

.btn-unenroll {
    display: inline-block;
    margin-top: 8px;
    padding: 8px 12px;
    background: #e63946;
    color: white;
    border-radius: 8px;
    text-decoration: none;
    font-size: 14px;
}

.btn-unenroll:hover {
    background: #c6282e;
}

.empty-msg {
    font-size: 16px;
    margin-top: 20px;
    color: #555;
}
</style>

</head>

<body>

<%@ include file="studentSidebar.jsp" %>

<div class="main-content">
    
    <h2>My Enrolled Courses</h2>

    <div class="course-box">

        <%
        if (enrolledCourses != null && !enrolledCourses.isEmpty()) {
            for (Course c : enrolledCourses) {
        %>

        <div class="course-card">
            <h3><%= c.getTitle() %></h3>

            <p><b>Duration:</b> <%= c.getDuration() %></p>
            <p><b>Price:</b> Rs. <%= c.getPrice() %></p>

            <a class="btn-view"
               href="<%= contextPath %>/student/enrolledCourseDetails/<%= c.getId() %>">
               View Details
            </a>

            <a class="btn-unenroll"
               href="<%= contextPath %>/student/unenroll/<%= c.getId() %>">
               Unenroll
            </a>
        </div>

        <%
            }
        } else {
        %>

        <p class="empty-msg">You have not enrolled in any courses yet.</p>

        <%
        }
        %>

    </div>

</div>

</body>
</html>
