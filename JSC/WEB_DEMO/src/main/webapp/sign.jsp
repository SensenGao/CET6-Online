<%--
  Created by IntelliJ IDEA.
  User: 86151
  Date: 2022/7/18
  Time: 1:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>注册页面</title>
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
            max-width: 400px;
            margin: 0 auto;
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

<c:choose>
    <c:when test="${flag == 1}">
        <script type="text/javascript">
            alert("注册失败，请重新输入！");
        </script>
    </c:when>
    <c:when test="${flag == 2}">
        <script type="text/javascript">
            alert("注册成功，正在返回登录页面！");
            // 使用 JavaScript 的方式实现自动跳转
            setTimeout(function() {
                location.href = "http://localhost/CET6/login.do";
            }, 500); // 延迟 0.5 秒后跳转
        </script>
    </c:when>
</c:choose>
<div class="container">
    <h2>注册信息</h2>
    <form>
        <label for="name">用户名:</label>
        <input type="text" id="name" name="name" required>

        <label for="password">密码:</label>
        <input type="password" id="password" name="password" required>

        <label for="email">邮箱:</label>
        <input type="text" id="email" name="email" required>

        <label for="tel">电话:</label>
        <input type="text" id="tel" name="tel" required>

        <label for="gender">性别:</label>
        <select id="gender" name="gender">
            <option value="male">男</option>
            <option value="female">女</option>
            <option value="other">其它</option>
        </select>

        <label for="role">选择身份:</label>
        <select id="role" name="role">
            <option value="student">学生</option>
            <option value="teacher">教师</option>
            <option value="admin">管理员</option>
        </select>

        <div style="display: flex; justify-content: space-between;">
            <input type="button" value="注册" onclick="signData()">
        </div>

        <script type="text/javascript">
            function signData() {
                location.href = "${path}/CET6/sign.do?"+
                    "role="+$("#role").val()+
                    "&tel="+$("#tel").val()+
                    "&email="+$("#email").val()+
                    "&gender="+$("#gender").val()+
                    "&name="+$("#name").val()+
                    "&password="+$("#password").val();
            }
        </script>
    </form>
</div>
<script type="text/javascript" src="${path}/resource/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${path}/resource/bootstrap/js/bootstrap.js"></script>

</body>
</html>

