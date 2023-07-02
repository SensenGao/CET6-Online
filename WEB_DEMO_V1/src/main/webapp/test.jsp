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
            display: ${display};
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
        <% for (int i = 1; i <= 10; i++) { %>
            <div class="question-number" onclick="openModal(<%= i %>)"><%= i %></div>
        <% } %>
    </div>
    <h1> </h1>
    <h1> </h1>
    <h1>主观题</h1>
    <div class="question-list">
        <% int i = 1; %>
        <c:forEach var="subQuestion" items="${examSublist}">
            <div class="question-number" onclick="showSubQuestion('${subQuestion.getSubjective_string_ID()}')"><%= i %></div>
            <% i = i + 1; %>
        </c:forEach>
    </div>
</div>

<div class="questionContainer">
    <form id="questionDetails">
            <div class="form-group">
                <%--@declare id="question"--%><label for="question">Question:</label>
                <textarea class="form-control"  name="question" rows="4">${subQuetion.getSubjective_Stem()}</textarea>
            </div>
            <div class="form-group">
                <%--@declare id="answer"--%><label for="answer">Answer:</label>
                <textarea class="form-control"  name="answer" rows="10">${subQuetion.getSubjective_Answer()}</textarea>
            </div>
            <div>   </div>
            <div>   </div>
    </form>
    <button class ="btn btn-primary" onclick="submitAnswer()">Submit</button>
</div>




<div class="divider"></div>



<script>
    function showSubQuestion(subId) {
        //在这里修改questionContainer的属性，让其展示，并且学生可以答题
        location.href = "${path}/CET6/" + "test.do?display='block'&&examId=${examId}"+"&&stuId=${stuId}"+"&&subId="+subId;
    }

    function submitAnswer(){
        //再次修改questionContainer的属性，右半部分显示为空
        location.href = "${path}/CET6/" + "test.do?&&examId=${examId}"+"&&stuId=${stuId}";
    }
</script>

</body>
</html>
