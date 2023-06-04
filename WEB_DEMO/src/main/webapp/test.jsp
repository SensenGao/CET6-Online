<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>题目列表</title>
    <!-- Bootstrap 的 CSS 文件 -->
    <c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>
    <link rel="stylesheet" href="${path}/resource/bootstrap/css/bootstrap.css">
    <style>
        body {
            background-color: #b9def0;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 40%;
            float: left;
            display: flex;
            flex-direction: column; /* 设置元素上下分布 */
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .questionContainer {
            position: absolute;
            top: 10%;
            right: 10%;
            width: 50%;
            display: block;
            flex-direction: column;
            align-items: flex-start;
            height: 100vh;
        }

        .divider {
            /*border-top: 2px dashed #000;*/
            width: 80%;
            margin: 20px 0;
        }

        .question-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .question-number {
            width: 50px;
            height: 50px;
            border: 1px solid #000;
            background-color: #4476A7;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            margin: 10px;
        }

        .center-line {
            position: fixed;
            top: 0;
            left: 37%;
            transform: translateX(-50%);
            height: 100%;
            width: 1px;
            background-color: #000;
            content: "";
        }
    </style>
</head>
<body>
<div class="center-line"></div>
<div class="container">
    <h1>选择题</h1>
    <div class="question-list">
        <% for (int i = 1; i <= 20; i++) { %>
            <div class="question-number" onclick="openModal(<%= i %>)"><%= i %></div>
        <% } %>
    </div>
    <h1> </h1>
    <h1> </h1>
    <h1>主观题</h1>
    <div class="question-list">
        <% int i = 1; %>
        <c:forEach var="subQuestion" items="${subQuestionList}">
            <div class="question-number" onclick="showSubQuestion()"><%= i %></div>
            <% i = i + 1; %>
        </c:forEach>
    </div>
</div>

<div class="questionContainer">
    <form id="questionDetails">
            <div class="form-group">
                <label for="question">Question:</label>
                <textarea class="form-control"  name="question" rows="4">${subAnswer.getSubjective_Stem()}</textarea>
            </div>
            <div class="form-group">
                <label for="answer">Answer:</label>
                <textarea class="form-control"  name="answer" rows="10">${subAnswer.getSubjective_Answer()}</textarea>
            </div>
            <div class="form-group">
                <label for="score">Score:</label>
                <textarea class="form-control" name="score" rows="1"></textarea>
            </div>
            <div>   </div>
            <div>   </div>
        <button type="submit" class="btn btn-primary" onclick="submitSubQuestionAnswer()">Submit</button>
    </form>
</div>




<div class="divider"></div>



<script>
    function showSubQuestion() {
        //在这里修改questionContainer的属性，让其展示，并且学生可以答题
    }

    function submitSubQuestionAnswer(){
        //再次修改questionContainer的属性，让其展示，并且学生可以答题


    }
</script>

</body>
</html>
