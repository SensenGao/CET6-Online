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

        .clock{
            position: relative;
            top: 15%;
            left: 35%;
        }

        .questionContainer {
            position: relative;
            top: 20%;
            left: 20%;
            width: 80%;
            display: ${display};
            flex-direction: column;
            align-items: flex-start;
            height: 100vh;
        }

        .ObjContainer{
            position: relative;
            top: 20%;
            left: 20%;
            width: 80%;
            display: ${Objdisplay};
            flex-direction: column;
            align-items: flex-start;
            height: 100vh;
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

        .divider {
            /*border-top: 2px dashed #000;*/
            width: 80%;
            margin: 20px 0;
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
        .btn-primary{
            position: relative;
            left: 45%;
            width: 100px;
            height: 50px;
        }
    </style>
</head>
<body>

<nav class="navbar">
    <div class="container-fluid">
        <span class="navbar-brand" style="font-size: 32px; text-align: center; line-height: 50px; margin-left: 490px;">学生端</span>
        <span class="navbar-text" style="font-size: 20px; text-align: center; line-height: 50px; margin-left: 1040px;">欢迎，XX学生</span>
    </div>
</nav>

<div style="position: absolute; top: 0; left: 0;">
    <img src="${path}/resource/picture/logo.jpg" alt="Icon" class="logo-img">
</div>

<div class="center-line"></div>

<div class="container">
    <h1 style="font-size: 40px;font-weight:600;">选择题</h1>
    <div class="question-list">
        <% for (int i = 1; i <= 24; i++) { %>
        <div class="question-number" onclick="showObjQuestion()"><%= i %></div>
        <% } %>
    </div>
    <h1> </h1>
    <h1 style="font-size: 40px;font-weight:600;">主观题</h1>
    <div class="question-list">
        <% int i = 1; %>
        <c:forEach var="subQuestion" items="${examSublist}">
            <div class="question-number" onclick="showSubQuestion('${subQuestion.getSubjective_string_ID()}')"><%= i %></div>
            <% i = i + 1; %>
        </c:forEach>
    </div>
    <h1> </h1>
    <h1> </h1>
</div>

<div class="manageContainer">
    <div class="clock">
        <!-- 倒计时计时器 -->
        <h2 style="font-size: 50px;font-weight: 600;color: #AA0000">剩余时间：<span id="countdown"></span></h2>
    </div>

    <div class="questionContainer">
        <form id="questionDetails">
            <div class="form-group" style="font-size: 25px">
                <%--@declare id="question"--%><label for="question">Question:</label>
                    <!--
                         <textarea class="form-control"  name="question" rows="4">${subQuetion.getSubjective_Stem()}</textarea>
                    -->
                    ${subQuetion.getSubjective_Stem()}
            </div>
            <div class="form-group" style="font-size: 25px">
                <%--@declare id="answer"--%><label for="answer">Answer:</label>
                <textarea class="form-control"  name="answer" rows="15">${subQuetion.getSubjective_Answer()}</textarea>
            </div>
            <div>   </div>
            <div>   </div>
        </form>
        <button class ="btn btn-primary" onclick="submitAnswer()">Submit</button>
    </div>

    <div class="ObjContainer">
        <form id="ObjDetails">
            <div class="form-group" style="font-size: 30px">
                <%--@declare id="question"--%><label for="question">Question:</label>
                你现在处于什么地方？（）
            </div>
            <div class="form-group" style="font-size: 30px">
                <p><input class="inputClass" type="radio" value="A" style="width: 20px;height: 20px"> A.青海</p>
                <p><input class="inputClass" type="radio" value="A" style="width: 20px;height: 20px"> B.北京</p>
                <p><input class="inputClass" type="radio" value="A" style="width: 20px;height: 20px"> C.上海</p>
                <p><input class="inputClass" type="radio" value="A" style="width: 20px;height: 20px"> D.天津</p>
            </div>
            <div>   </div>
            <div>   </div>
        </form>
        <button class ="btn btn-primary" onclick="submitAnswer()">Submit</button>
    </div>
</div>

<div class="divider"></div>



<script>
    //***************************************
    //************倒计时部分*******************
    //***************************************
    // 设置初始倒计时时间（以秒为单位）
    var initialCountdownSeconds = 3600; // 1小时

    function startCountdown(countdownSeconds) {
        var countdownElement = document.getElementById("countdown");
        var minutes, seconds;

        var countdownInterval = setInterval(function() {
            // 计算剩余时间的分钟和秒数
            minutes = Math.floor(countdownSeconds / 60);
            seconds = countdownSeconds % 60;

            // 将时间格式化为两位数显示
            var formattedTime = ("0" + minutes).slice(-2) + ":" + ("0" + seconds).slice(-2);

            // 更新倒计时元素的显示
            countdownElement.innerHTML = formattedTime;

            // 倒计时结束时停止计时器并执行相应操作
            if (countdownSeconds <= 0) {
                clearInterval(countdownInterval);
                // 在此处添加倒计时结束的逻辑
            }

            countdownSeconds--; // 减少剩余时间一秒

            // 保存当前剩余时间到本地存储
            localStorage.setItem("countdownSeconds", countdownSeconds);
        }, 1000); // 每秒更新一次计时器
    }

    // 在页面加载完成后开始倒计时
    window.onload = function() {
        var countdownSeconds = localStorage.getItem("countdownSeconds");

        // 如果之前保存的剩余时间不存在，则使用初始时间
        if (!countdownSeconds) {
            countdownSeconds = initialCountdownSeconds;
        }

        startCountdown(countdownSeconds);
    };

    function showSubQuestion(subId) {
        //在这里修改questionContainer的属性，让其展示，并且学生可以答题
        Objdisplay = 'none'
        location.href = "${path}/CET6/" + "test.do?display='block'&&examId=${examId}"+"&&stuId=${stuId}"+"&&subId="+subId;
    }

    function showObjQuestion(){
        display='none'
        location.href = "${path}/CET6/" + "test.do?Objdisplay='block'&&examId=${examId}"+"&&stuId=${stuId}";
    }

    function submitAnswer(){
        //再次修改questionContainer的属性，右半部分显示为空
        location.href = "${path}/CET6/" + "test.do?&&examId=${examId}"+"&&stuId=${stuId}";
    }
</script>

</body>
</html>
