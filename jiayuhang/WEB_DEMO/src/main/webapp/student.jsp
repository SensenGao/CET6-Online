<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>学生端</title>
    <!-- Bootstrap 的 CSS 文件 -->
    <c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>
    <link rel="stylesheet" href="${path}/resource/bootstrap/css/bootstrap.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #a6e1e2;
        }
        table {
            width: 600px;
            margin: 0 auto;
            border-collapse: collapse;
            transform: scale(1.5);
        }
        th, td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ccc;
            border-right: none;
        }
        th {
            font-weight: bold;
        }
        .modal {
            z-index: 1000; /* 设置一个较高的 z-index 值 */
        }
        .navbar {
            background-color: #30679a;
            color: white;
            width: 100%; /* Set the desired width */
            height: 80px;
        }
        .navbar-brand {
            color: white;
            margin-left: 10px;
        }
        .navbar-text {
            color: white;
            margin-right: 10px;
        }
        .logo-img {
            width: 480px;
            height: 80px;
        }
        .centered-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
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
                // 跳转到考生答题界面
                location.href = "${path}/CET6/" + "test.do?examId="+examId;
            }
        }
    </script>
</head>
<body>

<nav class="navbar">
    <div class="container-fluid">
        <span class="navbar-brand" style="font-size: 32px; text-align: center; line-height: 50px; margin-left: 490px;">学生端</span>
        <span class="navbar-text ml-auto" style="font-size: 20px; text-align: center; line-height: 50px; margin-left: 1040px;">欢迎，gaosensen同学</span>
    </div>
</nav>

<div style="position: absolute; top: 0; left: 0;">
    <img src="${path}/resource/picture/logo.jpg" alt="Icon" class="logo-img">
</div>

<div>
<p id="id" style="color: #428bca ;font-size: 52px; position:absolute; top: 45px; left: 50%; text-align: center;
    font-weight:600; line-height: 250px; transform: translate(-50%)">可参加的考试
</div>

<div class="centered-content">
<table>
    <tr>
        <th>考试ID</th>
        <th>考试名称</th>
        <th>考试日期</th>
        <th>操作</th>
    </tr>

    <tr>
        <td>1</td>
        <td>CET6-2022-06</td>
        <td>2022-06-14</td>
        <td>
            <button onclick="showExamDetails(1)" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">报名考试</button>
            <button onclick="showPaymentDialog(1)" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">考试缴费</button>
            <button onclick="showEnterExamDialog(1)" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">进入考试</button>
        </td>
    </tr>
    <tr>
        <td>2</td>
        <td>CET6-2023-03</td>
        <td>2023-03-05</td>
        <td>
            <button onclick="showExamDetails(1)" style=" background-color: #a92f2b; color: #f1f1f1; border: none;"> 报名考试</button>
            <button onclick="showPaymentDialog(1)" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">考试缴费</button>
            <button onclick="showEnterExamDialog(1)" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">进入考试</button>
        </td>
    </tr>
    <tr>
        <td>3</td>
        <td>CET6-2023-06</td>
        <td>2023-06-15</td>
        <td>
            <button onclick="showExamDetails(1)" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">报名考试</button>
            <button onclick="showPaymentDialog(1)" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">考试缴费</button>
            <button onclick="showEnterExamDialog(1)" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">进入考试</button>
        </td>
    </tr>


    <c:forEach var="exam" items="${examList}">
        <tr>
            <td>${exam.examId}</td>
            <td>${exam.examDate}</td>
            <td>
                <button onclick="showExamDetails(${exam.examId})">报名考试</button>
                <button onclick="showPaymentDialog(${exam.examId})">考试缴费</button>
                <button onclick="showEnterExamDialog(${exam.examId})">进入考试</button>
            </td>
        </tr>
    </c:forEach>
</table>
</div>

</body>
</html>
