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
    <title>Objective Questions</title>
</head>
<body>
<div class="container">
    <h1>Objective Questions</h1>

    <form action="enter_objective_questions.jsp" method="POST">
        <div class="form-group">
            <label for="question">Question:</label>
            <textarea class="form-control" id="question" name="question" rows="4"></textarea>
        </div>

        <div class="form-group">
            <label for="optionA">Option A:</label>
            <input type="text" class="form-control" id="optionA" name="optionA">
        </div>

        <div class="form-group">
            <label for="optionB">Option B:</label>
            <input type="text" class="form-control" id="optionB" name="optionB">
        </div>

        <div class="form-group">
            <label for="optionC">Option C:</label>
            <input type="text" class="form-control" id="optionC" name="optionC">
        </div>

        <div class="form-group">
            <label for="optionD">Option D:</label>
            <input type="text" class="form-control" id="optionD" name="optionD">
        </div>

        <div class="form-group">
            <label>Correct Answer:</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="correctAnswer" id="optionA_radio" value="A" checked>
                <label class="form-check-label" for="optionA_radio">
                    Option A
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="correctAnswer" id="optionB_radio" value="B">
                <label class="form-check-label" for="optionB_radio">
                    Option B
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="correctAnswer" id="optionC_radio" value="C">
                <label class="form-check-label" for="optionC_radio">
                    Option C
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="correctAnswer" id="optionD_radio" value="D">
                <label class="form-check-label" for="optionD_radio">
                    Option D
                </label>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>
