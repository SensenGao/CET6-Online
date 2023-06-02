<%--
  Created by IntelliJ IDEA.
  User: 86151
  Date: 2022/7/18
  Time: 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户界面</title>
    <!-- Bootstrap 的 CSS 文件 -->
    <c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>
    <link rel="stylesheet" href="${path}/resource/bootstrap/css/bootstrap.css">
</head>
<body>

<h2>姓名: ${name}</h2>
<h2>性别: ${gender}</h2>


<script type="text/javascript" src="${path}/resource/jquery/jquery-2.1.1.min.js" ></script>
<script type="text/javascript" src="${path}/resource/bootstrap/js/bootstrap.js" ></script>
<script type="text/javascript"  src="${path}/resource/jquery/echarts.min.js"></script>
<script type="text/javascript">



</script>
</body>
</html>
