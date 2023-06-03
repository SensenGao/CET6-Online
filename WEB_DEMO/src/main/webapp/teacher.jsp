<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Bootstrap 的 CSS 文件 -->
<c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>
<link rel="stylesheet" href="${path}/resource/bootstrap/css/bootstrap.css">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Page</title>
</head>
<body>
<div class="container">
    <h1>Teacher Page</h1>

    <div class="row">
        <div class="col">
            <button class="btn btn-primary" onclick="location.href='enter_questions.jsp'">录入试题</button>
        </div>
        <div class="col">
            <button class="btn btn-primary" onclick="location.href='view_question_bank.jsp'">查看题库</button>
        </div>
    </div>

    <div class="row">
        <div class="col">
            <button class="btn btn-primary" onclick="location.href='select_questions.jsp'">选择试题</button>
        </div>
        <div class="col">
            <button class="btn btn-primary" onclick="location.href='grade_subjective.jsp'">批改主观题</button>
        </div>
    </div>

</div>

</body>
</html>
