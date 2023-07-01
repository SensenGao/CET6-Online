<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>主界面</title>
    <!-- Bootstrap 的 CSS 文件 -->
    <c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>
    <link rel="stylesheet" href="${path}/resource/bootstrap/css/bootstrap.css">
    <style>
        body {
            background-color: #a6e1e2;
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

    </style>
</head>
<body>


<nav class="navbar">
    <div class="container-fluid">
        <span class="navbar-brand" style="font-size: 32px; text-align: center; line-height: 50px; margin-left: 490px;">教师端</span>
        <span class="navbar-text ml-auto" style="font-size: 20px; text-align: center; line-height: 50px; margin-left: 1040px;">欢迎，jiayuhang老师</span>
    </div>
</nav>

<div style="position: absolute; top: 0; left: 0;">
    <img src="${path}/resource/picture/logo.jpg" alt="Icon" class="logo-img">
</div>


<p id="id" style="color: #428bca ;font-size: 52px; position:absolute; top: 45px; left: 28%; text-align: center;
    font-weight:600; line-height: 250px;">欢迎进入四六级在线答题系统教师端


<%--<div class="container" style="width: 200px">--%>
<%--    <div style="text-align: center;">--%>
<%--        <div style="margin-top: 50px; width: 150px;">--%>
<%--            <button class="btn btn-primary btn-block mb-3" onclick="location.href='enter_subjective_questions.do'">录入主观题</button>--%>
<%--            <button class="btn btn-primary btn-block mb-3" onclick="location.href='enter_objective_questions.do'">录入客观题</button>--%>
<%--            <button class="btn btn-primary btn-block mb-3" onclick="openExamNumberModal()">查看题库/选择试题</button>--%>
<%--            <button class="btn btn-primary btn-block" onclick="location.href='grade_subjective.do'">批改主观题</button>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<!--四个卡片进行跳转 -->
<div class="card" style="width: 410px;
    position: absolute;top: 290px;left: 265px" >
    <img src="${path}/resource/picture/1.png" class="card-img-top" alt="...">
    <div class="card-body">
        <h5 class="card-title"></h5>
        <p class="card-text"></p>
        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='enter_subjective_questions.do'"
                style="width: 280px; height: 60px;margin-top: 25px; margin-left: -10px;" >录入主观题</button>
    </div>
</div>

<div class="card" style="width: 410px;
    position: absolute;top: 290px;left: 615px" >
    <img src="${path}/resource/picture/2.png" class="card-img-top" alt="...">
    <div class="card-body">
        <h5 class="card-title"></h5>
        <p class="card-text"></p>
        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='enter_objective_questions.do'"
                style="width: 280px; height: 60px;margin-top: 25px; margin-left: -10px;" >录入客观题</button>
    </div>
</div>
<div class="card" style="width: 410px;
    position: absolute;top: 290px;left: 975px" >
    <img src="${path}/resource/picture/3.png" class="card-img-top" alt="...">
    <div class="card-body">
        <h5 class="card-title"></h5>
        <p class="card-text"></p>
        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="openExamNumberModal()"
                style="width: 280px; height: 60px;margin-top: 25px; margin-left: -10px;">查看题库/在线组题</button>
    </div>
</div>

<div class="card" style="width: 410px;
    position: absolute;top: 290px;left: 1335px" >
    <img src="${path}/resource/picture/4.png" class="card-img-top" alt="...">
    <div class="card-body">
        <h5 class="card-title"></h5>
        <p class="card-text"></p>
        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='grade_subjective.do'"
                style="width: 280px; height: 60px; margin-top: 25px; margin-left: -10px;">批改主观题</button>
    </div>
</div>



<!-- Modal -->
<div id="examNumberModal" class="modal" tabindex="-1" role="dialog" aria-labelledby="examNumberModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="examNumberModalLabel">输入考试号</h5>
                <button type="button" class="close" onclick="closeExamNumberModal()" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input type="text" id="examNumberInput" class="form-control" placeholder="请输入考试号">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="submitExamNumber()">确认</button>
                <button type="button" class="btn btn-secondary" onclick="closeExamNumberModal()">取消</button>
            </div>
        </div>
    </div>
</div>

<script>
    function openExamNumberModal() {
        const modal = document.getElementById('examNumberModal');
        // $('#examNumberModal').modal('show');
        modal.style.display = 'block';
    }

    function closeExamNumberModal() {
        const modal = document.getElementById('examNumberModal');
        // $('#examNumberModal').modal('show');
        modal.style.display = 'none';
    }

    function submitExamNumber() {
        const modal = document.getElementById('examNumberModal');
        const examNumberInput = document.getElementById('examNumberInput');
        modal.style.display = 'none';
        location.href = "${path}/CET6/" + "viewBankAndSelectQuestion.do?examId=" + examNumberInput.value;

    }
</script>
</body>

</html>
