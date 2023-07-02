<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>登录页面</title>
    <!-- Bootstrap 的 CSS 文件 -->
    <c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>
    <link rel="stylesheet" href="${path}/resource/bootstrap/css/bootstrap.css">
    <style>
        body {
            background-color: #a6e1e2;
            /*font-family: Arial, sans-serif;*/
            /*display: flex;*/
            /*justify-content: center;*/
            /*align-items: center;*/
            /*height: 100vh;*/
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

        .container {
            max-width: 400px;
            margin: 190px auto 0;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
            margin-right: 5px; /* 添加右侧边距 */
        }

        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<p id="id" style="color: #428bca ;font-size: 60px; position:absolute; top: 50px; left: 30%; text-align: center;
    font-weight:600; line-height: 250px;">欢迎使用四六级在线答题系统

<c:choose>
    <c:when test="${flag == 1}">
        <script type="text/javascript">
            alert("登录失败，请重新输入！");
            // 使用 JavaScript 的方式实现自动跳转
        </script>
    </c:when>
    <c:when test="${flag == 2}">
        <script type="text/javascript">
            alert("登录成功，正在跳转到学生页面...");
            // 使用 JavaScript 的方式实现自动跳转
            setTimeout(function() {
                location.href = "${path}/CET6/student_platform.do?userId=${userId}&userPassword=${userPassword}";
            }, 500); // 延迟 0.5 秒后跳转
        </script>
    </c:when>
    <c:when test="${flag == 3}">
        <script type="text/javascript">
            alert("登录成功，正在跳转到教师页面...");
            // 使用 JavaScript 的方式实现自动跳转
            setTimeout(function() {
                location.href = "${path}/CET6/teacher.do?userId=${userId}&userPassword=${userPassword}";
            }, 500); // 延迟 0.5 秒后跳转
        </script>
    </c:when>
    <c:when test="${flag == 4}">
        <script type="text/javascript">
            alert("登录成功，正在跳转到管理员页面...");
            // 使用 JavaScript 的方式实现自动跳转
            setTimeout(function() {
                location.href = "${path}/CET6/admin.do?userId=${userId}&userPassword=${userPassword}";
            }, 500); // 延迟 0.5 秒后跳转
        </script>
    </c:when>
</c:choose>

<nav class="navbar">
    <div class="container-fluid">
        <span class="navbar-brand" style="font-size: 32px; text-align: center; line-height: 50px; margin-left: 490px;">登录/注册</span>
        <%--        <span class="navbar-text ml-auto" style="font-size: 20px; text-align: center; line-height: 50px; margin-left: 1040px;">欢迎，XX老师</span>--%>
    </div>
</nav>

<div style="position: absolute; top: 0; left: 0;">
    <img src="${path}/resource/picture/logo.jpg" alt="Icon" class="logo-img">
</div>

<div class="container">

    <h2>用户登录</h2>
    <form>
        <label for="username">账号:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">密码:</label>
        <input type="password" id="password" name="password" required>

        <label for="role">选择身份:</label>
        <select id="role" name="role">
            <option value="student">学生</option>
            <option value="teacher">教师</option>
            <option value="admin">管理员</option>
        </select>

        <div style="display: flex; justify-content: space-between;">
            <input type="button" value="登录" onclick="loginData()">
            <input type="button" value="注册" onclick="signData()">
        </div>

        <script type="text/javascript">
            function loginData() {
                location.href = "${path}/CET6/login.do?" + "role=" + $("#role").val() + "&userId=" + $("#username").val() + "&userPassword=" + $("#password").val();
            }
        </script>
        <script type="text/javascript">
            function signData() {
                location.href = "${path}/CET6/sign.do";
            }
        </script>
    </form>
</div>
<script type="text/javascript" src="${path}/resource/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${path}/resource/bootstrap/js/bootstrap.js"></script>

</body>
</html>

