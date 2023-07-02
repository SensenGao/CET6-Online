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
    <title>Subjective Questions</title>
</head>
<body>
<div class="container">
    <h1>Subjective Questions</h1>

    <form>
        <div class="form-group">
            <label for="question">Question:</label>
            <textarea class="form-control" id="question" name="question" rows="4"></textarea>
        </div>
        <div class="form-group">
            <label for="answer">Answer:</label>
            <textarea class="form-control" id="answer" name="answer" rows="10"></textarea>
        </div>
        <button type="submit" class="btn btn-primary" onclick="insertData()">Submit</button>
    </form>
</div>
<script type="text/javascript" src="${path}/resource/jquery/jquery-2.1.1.min.js" ></script>
<script type="text/javascript" src="${path}/resource/bootstrap/js/bootstrap.js" ></script>
<script type="text/javascript">
    function insertData(){
        location.href="${path}/CET6/enter_subjective_questions.do?question="+$("#question").val()+"&&answer="+$("#answer").val();
    }
</script>
</body>
</html>
