<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<!-- Bootstrap 的 CSS 文件 -->--%>
<%--<c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>--%>
<%--<link rel="stylesheet" href="${path}/resource/bootstrap/css/bootstrap.css">--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>Teacher Page</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <h1>Teacher Page</h1>--%>

<%--    <div class="row">--%>
<%--        <div class="col">--%>
<%--            <button class="btn btn-primary" onclick="location.href='enter_subjective_questions.do'">录入主观题</button>--%>
<%--        </div>--%>
<%--        <div class="col">--%>
<%--            <button class="btn btn-primary" onclick="location.href='enter_objective_questions.do'">录入客观题</button>--%>
<%--        </div>--%>
<%--        <div class="col">--%>
<%--            <button class="btn btn-primary" onclick="location.href='viewBankAndSelectQuestion.do'">查看题库/选择试题</button>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <div class="row">--%>
<%--        <div class="col">--%>
<%--            <button class="btn btn-primary" onclick="location.href='grade_subjective.do'">批改主观题</button>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Page</title>
    <!-- Bootstrap 的 CSS 文件 -->
    <c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>
    <link rel="stylesheet" href="${path}/resource/bootstrap/css/bootstrap.css">
    <style>

    </style>
</head>
<body>

<div class="container" style="width: 200px">
    <div style="text-align: center;">
        <h1>教师页面</h1>
        <div style="margin-top: 50px; width: 150px;">
            <button class="btn btn-primary btn-block mb-3" onclick="location.href='enter_subjective_questions.do'">录入主观题</button>
            <button class="btn btn-primary btn-block mb-3" onclick="location.href='enter_objective_questions.do'">录入客观题</button>
            <button class="btn btn-primary btn-block mb-3" onclick="openExamNumberModal()">查看题库/选择试题</button>
            <button class="btn btn-primary btn-block" onclick="location.href='grade_subjective.do'">批改主观题</button>
        </div>
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
