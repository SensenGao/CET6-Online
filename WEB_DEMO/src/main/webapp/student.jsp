<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>试卷列表</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
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
                // 跳转到考生答题界面
                location.href = "${path}/CET6/" + "test.do?examId="+examId;
            }
        }
    </script>
</head>
<body>
<h1>试卷列表</h1>
<table>
    <tr>
        <th>试卷ID</th>
        <th>试卷日期</th>
        <th>操作</th>
    </tr>

    <tr>
        <td>111</td>
        <td>"2020-07-14"</td>
        <td>
            <button onclick="showExamDetails(111)">报名考试</button>
            <button onclick="showPaymentDialog(111)">考试缴费</button>
            <button onclick="showEnterExamDialog(111)">进入考试</button>
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
</body>
</html>
