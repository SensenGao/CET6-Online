<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生界面</title>
    <c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>
    <link rel="stylesheet" href="${path}/resource/bootstrap/css/bootstrap.css">
    <style>
        body {
            background-color: #b9def0;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 100%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            border-collapse: collapse;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"],
        input[type="button"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 5px;
            /* 添加右侧边距 */
        }

        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #45a049;
        }

        th, td {
            padding: 8px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
    <script>
        function showExamDetails(examId) {
            // 弹出报名考试的详细信息和确认提示框
            var examDetails = "考试ID：" + examId + "<br>" +
                "考试日期：2023-06-10<br>" +
                "考试地点：考试中心";
            var confirmMessage = "确定要报名该考试吗？";

            var confirmDialog = confirm(examDetails + "\n\n" + confirmMessage);
            if (confirmDialog) {
                // 执行报名考试的操作，可以是提交表单或其他逻辑
                alert("报名成功！");
            }
        }

        function showPaymentDialog(examId) {
            // 弹出考试缴费的确认提示框
            var confirmMessage = "请确认是否缴费？";

            var confirmDialog = confirm(confirmMessage);
            if (confirmDialog) {
                // 执行缴费操作，可以是提交表单或其他逻辑
                alert("缴费成功！");
            }
        }

        function showEnterExamDialog(examId) {
            // 弹出进入考试的确认提示框
            var confirmMessage = "确定要进入考试吗？";

            var confirmDialog = confirm(confirmMessage);
            if (confirmDialog) {
                // 执行进入考试的操作，可以是跳转到考试页面或其他逻辑
                alert("进入考试！");
            }
        }
    </script>
</head>

<body>

<div class="container">
    <h1 class="text-center">试卷列表</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>试卷ID</th>
            <th>试卷日期</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="exam" items="${examList}">
            <tr>
                <td>${exam.examId}</td>
                <td>${exam.examDate}</td>
                <td>
                    <button class="btn btn-primary" onclick="showExamDetails('${exam.examId}')">报名考试</button>
                    <button class="btn btn-info" onclick="showPaymentDialog('${exam.examId}')">考试缴费</button>
                    <button class="btn btn-success" onclick="showEnterExamDialog('${exam.examId}')">进入考试</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script type="text/javascript" src="${path}/resource/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${path}/resource/bootstrap/js/bootstrap.js"></script>

</body>

</html>
