<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员界面</title>
    <!-- Bootstrap 的 CSS 文件 -->
    <c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>
    <link rel="stylesheet" href="${path}/resource/bootstrap/css/bootstrap.css">
    <title>用户界面</title>
    <style>
        body {
            background-color: #b9def0;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
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

<div class="container">
    <h1>管理员界面</h1>

    <!-- 添加考试信息按钮 -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addExamModal">
        添加考试信息
    </button>

    <!-- 考试信息列表 -->
    <table class="table">
        <thead>
        <tr>
            <th>考试名称</th>
            <th>考试日期</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <!-- 使用JSP标签循环遍历考试信息 -->
        <c:forEach var="exam" items="${examList}">
            <tr>
                <td>${exam.id}</td>
                <td>${exam.date}</td>
                <td>
                    <!-- 删除考试信息按钮 -->
                    <button type="button" class="btn btn-danger" data-toggle="modal"
                            data-target="#deleteExamModal" data-examid="${exam.id}">
                        删除
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- 添加考试信息模态框 -->
<div class="modal fade" id="addExamModal" tabindex="-1" role="dialog" aria-labelledby="addExamModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addExamModalLabel">添加考试信息</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- 在模态框中放置添加考试信息的表单 -->
                <form action="admin.jsp" method="get">
                    <div class="form-group">
                        <label for="addExamId">考试ID:</label>
                        <input type="text" class="form-control" id="addExamId" name="addExamId">
                    </div>

                    <div class="form-group">
                        <label for="addExamDate">考试日期:</label>
                        <input type="date" class="form-control" id="addExamDate" name="addExamDate">
                    </div>

                    <button type="button" class="btn btn-primary" onclick="addExamInfo()">添加</button>
                    <script type="text/javascript">
                        function addExamInfo() {
                            location.href =  "${path}/CET6/admin.do?userId=${userId}&userPassword=${userPassword}&action=addExam&examId=" + $("#addExamId").val() + "&examDate=" + $("#addExamDate").val();
                            alert("考试信息添加成功！");
                        }
                    </script>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 删除考试信息模态框 -->
<div class="modal fade" id="deleteExamModal" tabindex="-1" role="dialog" aria-labelledby="deleteExamModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteExamModalLabel">删除考试信息</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- 在模态框中放置删除考试信息的表单 -->
                <form id="deleteExamForm" method="post">
                    <input type="hidden" id="deleteExamId" name="deleteExamId">

                    <p>确认要删除该考试信息吗？</p>

                    <button type="button" class="btn btn-danger" onclick="deleteExamInfo()">删除</button>
                </form>
                <script type="text/javascript">
                    function deleteExamInfo() {
                        location.href =  "${path}/CET6/admin.do?userId=${userId}&userPassword=${userPassword}&action=deleteExam&examId=" + $("#deleteExamId").val() + "&examDate=";
                        alert("考试信息删除成功！");
                    }
                </script>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${path}/resource/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${path}/resource/bootstrap/js/bootstrap.js"></script>

</body>
</html>
```