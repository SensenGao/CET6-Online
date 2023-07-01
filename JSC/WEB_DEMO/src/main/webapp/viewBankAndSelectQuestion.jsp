<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>题目列表</title>
    <!-- Bootstrap 的 CSS 文件 -->
    <c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>
    <link rel="stylesheet" href="${path}/resource/bootstrap/css/bootstrap.css">
    <style>
        body {
            background-color: #a6e1e2;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .navbar {
            background-color: #30679a;
            color: white;
            top: 0;
            width: 100%; /* Set the desired width */
            height: 80px;
            z-index: 1;
            position: fixed;
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
            z-index: 2;
            position: fixed;
        }

        .container {
            width: 40%;
            float: left;
            display: flex;
            flex-direction: column; /* 设置元素上下分布 */
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .manageContainer {
            position: absolute;
            top: 0;
            right: 10%;
            width: 50%;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            height: 100vh;
        }

        .table {
            width: 100%;
            table-layout: fixed;
            border: 3px solid darkgray;
        }
        .table td, .table th {
            border: 3px solid darkgray;
        }


        .divider {
            /*border-top: 2px dashed #000;*/
            width: 80%;
            margin: 20px 0;
        }

        .question-list {
            font-size: 32px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .question-number {
            width: 50px;
            height: 50px;
            border: 2px solid #000;
            background-color: #ADD8E6;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            margin: 10px;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            background-color: #afd9ee;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .center-line {
            position: fixed;
            top: 0;
            left: 37%;
            transform: translateX(-50%);
            height: 100%;
            width: 1px;
            background-color: #000;
            content: "";
        }
    </style>
</head>
<body>



<nav class="navbar">
    <div class="container-fluid">
        <span class="navbar-brand" style="font-size: 32px; text-align: center; line-height: 50px; margin-left: 490px;">教师端</span>
        <span class="navbar-text" style="font-size: 20px; text-align: center; line-height: 50px; margin-left: 1040px;">欢迎，XX老师</span>
    </div>
</nav>

<div style="position: absolute; top: 0; left: 0;">
    <img src="${path}/resource/picture/logo.jpg" alt="Icon" class="logo-img">
</div>

<div class="center-line"></div>
<div class="container">
    <h1 style="font-size: 40px;font-weight:600;">选择题</h1>
    <div class="question-list">
        <c:forEach var="option" items="${optionList}">
        </c:forEach>


        <% for (int i = 1; i <= 24; i++) { %>
        <div class="question-number" onclick="openModal(<%= i %>)"><%= i %></div>
        <% } %>
    </div>
    <h1> </h1>
    <h1 style="font-size: 40px;font-weight:600;">主观题</h1>
    <div class="question-list">
        <% int i = 1; %>
        <c:forEach var="subQuestion" items="${subQuestionList}">
            <div class="question-number" onclick="openSubModal('${subQuestion.getSubjective_ID()}', '${subQuestion.getSubjective_Stem()}', '${subQuestion.getSubjective_Answer()}')"><%= i %></div>
            <% i = i + 1; %>
        </c:forEach>

    </div>
    <h1> </h1>
    <h1> </h1>
</div>

<div class="manageContainer">
    <br><br>
    <br><br>
    <br><br>
    <h1 style="font-size: 40px;font-weight:600;">试卷题目列表</h1>

    <h2 style="font-size: 30px;font-weight:600;">选择题</h2>
    <!-- 考试信息列表 -->
    <table class="table">
        <tbody>
        <tr>
            <td style="font-size: 20px;font-weight:600;">试题编号</td>
            <td style="font-size: 20px;font-weight:600;">试题内容</td>
            <td style="font-size: 20px;font-weight:600;">操作</td>
        </tr>
        <tr>
            <td style="font-size: 18px;font-weight:450;">1</td>
            <td style="font-size: 18px;font-weight:450;">Youth is n...</td>
            <td><button type="button" class="btn btn-danger"
                        style="font-size: 18px;font-weight:450;">删除</button></td>
        </tr>
        <tr>
            <td style="font-size: 18px;font-weight:450;">2</td>
            <td style="font-size: 18px;font-weight:450;">When your...</td>
            <td><button type="button" class="btn btn-danger"
                        style="font-size: 18px;font-weight:450;">删除</button></td>
        </tr>
        <tr>
            <td style="font-size: 18px;font-weight:450;">3</td>
            <td style="font-size: 18px;font-weight:450;">In stories e...</td>
            <td><button type="button" class="btn btn-danger"
                        style="font-size: 18px;font-weight:450;">删除</button></td>
        </tr>
        </tbody>

    </table>
    <h2 style="font-size: 30px;font-weight:600;">主观题</h2>
    <table class="table">
        <tbody>
        <tr>
            <td style="font-size: 20px;font-weight:600;">试题编号</td>
            <td style="font-size: 20px;font-weight:600;">试题内容</td>
            <td style="font-size: 20px;font-weight:600;">操作</td>
        </tr>
        <!-- 使用JSP标签循环遍历考试信息 -->
        <c:forEach var="exam" items="${examSublist}">
            <tr>
                <td style="font-size: 18px;font-weight:450;">${exam.getSubjective_ID()}</td>
                <td style="font-size: 18px;font-weight:450;">${exam.getSubjective_Stem20()}</td>
                <td>
                    <!-- 删除考试信息按钮 -->
                    <button type="button" class="btn btn-danger"
                            style="font-size: 18px;font-weight:450;">删除</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>




<div class="divider"></div>

<div id="myModal" class="modal" aria-hidden="true">
    <div class="modal-content">
        <h2 id="questionTitle"></h2>
        <p id="questionDetails"></p>
        <p id="questionAnswer"></p>
        <div class="modal-buttons">
            <button onclick="deleteQuestion()">删除</button>
            <button onclick="addQuestion()">添加</button>
        </div>
    </div>
</div>

<div id="SubModal" class="modal" aria-hidden="true">
    <div class="modal-content">
        <h2 id="subQuestionTitle"></h2>
        <p id="subQuestionDetails"></p>
        <p id="subQuestionAnswer"></p>
        <div class="modal-buttons">
            <button onclick="deleteSubQuestion()">删除</button>
            <button onclick="addSubQuestion()">添加</button>
        </div>
    </div>
</div>




<script>
    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the <span> element that closes the modal
    var closeBtn = document.getElementsByClassName("close")[0];

    // 删除题目
    function deleteQuestion() {
        // 在这里编写删除题目的逻辑
        closeModal();
    }

    // 添加题目
    function addQuestion() {
        closeModal();
    }

    // Open the modal and populate with question details
    // 打开模态框，并设置题目信息和选项
    function openModal(questionTitle,questionDetails,questionAnswer) {
        const modal = document.getElementById('myModal');
        const titleElement = document.getElementById('questionTitle');
        const detailsElement = document.getElementById('questionDetails');
        const AnswerElement = document.getElementById('questionAnswer');

        titleElement.textContent = questionTitle;
        detailsElement.textContent = questionDetails;
        AnswerElement.textContent = questionAnswer;

        modal.style.display = 'block';
    }

    // 关闭模态框
    function closeModal() {
        const modal = document.getElementById('myModal');
        modal.style.display = 'none';
    }


    // Simulating fetching question details from the server
    function fetchQuestionDetails(questionNumber, callback) {
        // Replace with your own server request logic
        // This is just a mock example
        setTimeout(function () {
            var questionDetails = "This is the detailed information for Question " + questionNumber;
            callback(questionDetails);
        }, 500);
    }

    //-------------------以下是主观题的相关内容------------------------------------------------------------
    // Get the modal
    var subModal = document.getElementById("SubModal");

    // 删除题目
    function deleteSubQuestion() {
        // 在这里编写删除题目的逻辑
        closeSubModal();
    }

    // 添加题目
    function addSubQuestion() {
        // 在这里编写添加题目的逻辑
        // 在这里编写添加题目的逻辑
        //1.主观题的题号发送给后端
        //2.间隔大约200ms，刷新页面
        const modal = document.getElementById('SubModal');
        const subId = document.getElementById('subQuestionTitle');
        location.href = "${path}/CET6/" + "viewBankAndSelectQuestion.do?examId=${examId}" + "&&newSub=" + subId.textContent;
        setInterval(function() {
            location.reload();
        }, 200);
        closeSubModal();
    }

    // Open the modal and populate with question details
    // 打开模态框，并设置题目信息和选项
    function openSubModal(questionTitleID,questionDetails,questionAnswer) {
        const modal = document.getElementById('SubModal');
        const titleElement = document.getElementById('subQuestionTitle');
        const detailsElement = document.getElementById('subQuestionDetails');
        const AnswerElement = document.getElementById('subQuestionAnswer');

        titleElement.textContent = questionTitleID;
        detailsElement.textContent = questionDetails;
        AnswerElement.textContent = questionAnswer;

        modal.style.display = 'block';
    }

    // 关闭模态框
    function closeSubModal() {
        const modal = document.getElementById('SubModal');
        modal.style.display = 'none';
    }


</script>

</body>
</html>
