<%--
  Created by IntelliJ IDEA.
  User: 86151
  Date: 2022/7/18
  Time: 1:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>登录</title>
    <!-- Bootstrap 的 CSS 文件 -->
    <c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>
    <link rel="stylesheet" href="${path}/resource/bootstrap/css/bootstrap.css">
</head>

<body>
<form>
    <div class="form-group">
        <label for="userid">账号</label>
        <input type="text" class="form-control" id="userid" placeholder="请输入账号" style="width: 500px">
    </div>
    <div class="form-group">
        <label for="userpassword">密码</label>
        <input type="text" class="form-control" id="userpassword" placeholder="请输入密码" style="width: 500px">
    </div>
    <button type="button" class="btn btn-primary" onclick="queryData()">查询</button>
</form>
<script type="text/javascript" src="${path}/resource/jquery/jquery-2.1.1.min.js" ></script>
<script type="text/javascript" src="${path}/resource/bootstrap/js/bootstrap.js" ></script>
<script type="text/javascript">
    function queryData(){
        location.href="${path}/CET6/view.do?userId="+$("#userid").val()+"&&userPassword="+$("#userpassword").val();
    }
</script>
</body>
</html>
