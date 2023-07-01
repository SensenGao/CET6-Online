<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>学生历史分数页面</title>
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
    font-weight:600; line-height: 250px; transform: translate(-50%)">成绩查询
</div>



<div class="centered-content">

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
        <tr>
            <td>2010764</td>
            <td>gaosensen</td>
            <th>3</th>
            <th>2003-12-15</th>
            <th>68</th>
            <th>503</th>
            <th>571</th>
        </tr>
        <tr>
            <td>2010764</td>
            <td>gaosensen</td>
            <th>4</th>
            <th>2004-12-15</th>
            <th>68</th>
            <th>503</th>
            <th>571</th>
        </tr>
        <tr>
            <td>2010764</td>
            <td>gaosensen</td>
            <th>5</th>
            <th>2005-12-15</th>
            <th>68</th>
            <th>503</th>
            <th>571</th>
        </tr>
        <tr>
            <td>2010764</td>
            <td>gaosensen</td>
            <th>6</th>
            <th>2006-12-15</th>
            <th>68</th>
            <th>503</th>
            <th>571</th>
        </tr>
    </table>
</div>
</body>
</html>
