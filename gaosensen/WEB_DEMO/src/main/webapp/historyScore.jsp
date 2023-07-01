<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>学生历史分数页面</title>
    <!-- Bootstrap 的 CSS 文件 -->
    <c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>
    <link rel="stylesheet" href="${path}/resource/bootstrap/css/bootstrap.css">
    <style>
        .container {
            display: flex;
            justify-content: center;
            margin: 5% 5%;
        }

        table {
            width: 80%;
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

</head>

<body>
<h1>试卷列表</h1>
<div class="container">

    <table>
        <tr>
            <th>学生ID</th>
            <th>学生姓名</th>
            <th>考试ID</th>
            <th>考试日期</th>
            <th>主观题总分</th>
            <th>客观题总分</th>
            <th>总分</th>
        </tr>
        <tr>
            <td>2010764</td>
            <td>gaosensen</td>
            <th>1</th>
            <th>2002-6-14</th>
            <th>75.5</th>
            <th>413.5</th>
            <th>489</th>
        </tr>
        <tr>
            <td>2010764</td>
            <td>gaosensen</td>
            <th>2</th>
            <th>2002-12-15</th>
            <th>68</th>
            <th>503</th>
            <th>571</th>
        </tr>
    </table>
</div>
</body>
</html>
