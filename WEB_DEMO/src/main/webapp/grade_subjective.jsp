<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>学生答卷页面</title>
    <!-- Bootstrap 的 CSS 文件 -->
    <c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>
    <link rel="stylesheet" href="${path}/resource/bootstrap/css/bootstrap.css">
    <style>

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        .question-details {
            margin-left: 20px;
        }
    </style>
</head>
<body>
<h1>学生答卷列表</h1>

<div style="display: flex;">
    <div style="width: 50%;">
        <table>
            <tr>
                <th>学生ID</th>
                <th>考试ID</th>
                <th>查看答卷</th>
            </tr>
            <tr>
                <td>学生1</td>
                <td>考试1</td>
                <td><button onclick="showQuestionDetails(1)">查看答卷</button></td>
            </tr>
            <tr>
                <td>学生2</td>
                <td>考试2</td>
                <td><button onclick="showQuestionDetails(2)">查看答卷</button></td>
            </tr>
            <!-- 添加更多学生答卷的行 -->
        </table>
    </div>

    <div class="question-details" id="questionDetails">
        <!-- 学生答卷的详细信息将动态显示在这里 -->
    </div>
</div>

<script>
    function showQuestionDetails(studentId) {
        // 这里可以使用Ajax请求获取学生答卷的详细信息，然后将结果动态显示在页面上
        var questionDetailsDiv = document.getElementById("questionDetails");
        questionDetailsDiv.innerHTML = "正在加载学生答卷...";

        // 模拟Ajax请求的延迟，这里使用setTimeout函数来模拟延迟1秒钟
        setTimeout(function() {
            var questionDetails = "学生" + studentId + "的答卷信息：题目1，答案A；题目2，答案B；题目3，答案C。";
            questionDetailsDiv.innerHTML = questionDetails;
        }, 1000);
    }
</script>
</body>
</html>
