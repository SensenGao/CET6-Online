<!-- Bootstrap 的 CSS 文件 -->
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
        .form-check-inline {
            display: inline-block;
            margin-right: 1rem;
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

<div class="container">
    <h1 style="color: #428bca ;font-size: 40px; font-weight:600;">
        客观题录入
    </h1>

    <form>
        <div class="form-group">
            <label for="question" style="color: #000000 ;font-size: 25px; font-weight:500;">
                题干录入：
            </label>
            <textarea class="form-control" id="question" name="question" rows="4"
                      style="font-size: 20px; font-weight:600; width: 1000px"></textarea>
        </div>

        <div class="form-group">
            <label for="question" style="color: #000000 ;font-size: 25px; font-weight:500;">
                选项A：
            </label>
            <input type="text" class="form-control" id="optionA" name="optionA"
                   style="font-size: 20px; font-weight:600;  width: 1000px">
        </div>

        <div class="form-group">
            <label for="question" style="color: #000000 ;font-size: 25px; font-weight:500;">
                选项B：
            </label>
            <input type="text" class="form-control" id="optionB" name="optionB"
                   style="font-size: 20px; font-weight:600; width: 1000px">
        </div>

        <div class="form-group">
            <label for="question" style="color: #000000 ;font-size: 25px; font-weight:500;">
                选项C：
            </label>
            <input type="text" class="form-control" id="optionC" name="optionC"
                   style="font-size: 20px; font-weight:600; width: 1000px">
        </div>

        <div class="form-group">
            <label for="question" style="color: #000000 ;font-size: 25px; font-weight:500;">
                选项D：
            </label>
            <input type="text" class="form-control" id="optionD" name="optionD"
                   style="font-size: 20px; font-weight:500; width: 1000px">
        </div>

        <div class="form-group">
            <label style="font-size: 25px; font-weight:500;">正确答案：</label>
            <div class="form-check-inline">
                <input class="form-check-input" type="radio" name="correctAnswer" id="optionA_radio" value="A" checked>
                <label class="form-check-label" for="optionA_radio"
                       style="font-size: 25px; font-weight:500;">选项 A</label>
            </div>
            <div class="form-check-inline">
                <input class="form-check-input" type="radio" name="correctAnswer" id="optionB_radio" value="B">
                <label class="form-check-label" for="optionB_radio"
                       style="font-size: 25px; font-weight:500;">选项 B</label>
            </div>
            <div class="form-check-inline">
                <input class="form-check-input" type="radio" name="correctAnswer" id="optionC_radio" value="C">
                <label class="form-check-label" for="optionC_radio"
                       style="font-size: 25px; font-weight:500;">选项 C</label>
            </div>
            <div class="form-check-inline">
                <input class="form-check-input" type="radio" name="correctAnswer" id="optionD_radio" value="D">
                <label class="form-check-label" for="optionD_radio"
                       style="font-size: 25px; font-weight:500;">选项 D</label>
            </div>

        </div>
    </form>
    <button type="submit" class="btn btn-primary" onclick="insertData()"
            style="color: #ffffff ;font-size: 20px; font-weight:500;">
        提交录入信息
    </button>
</div>
<script type="text/javascript" src="${path}/resource/jquery/jquery-2.1.1.min.js" ></script>
<script type="text/javascript" src="${path}/resource/bootstrap/js/bootstrap.js" ></script>
<script type="text/javascript">
    function insertData(){
        var selectedAnswer;
        var radioButtons = document.getElementsByName("correctAnswer");
        for (var i = 0; i < radioButtons.length; i++) {
            if (radioButtons[i].checked) {
                selectedAnswer = radioButtons[i].value; break;
            }
        }
        location.href="${path}/CET6/enter_objective_questions.do?question="+$("#question").val()+"&&option1="+$("#optionA").val()+"&&option2="+$("#optionB").val()+"&&option3="+$("#optionC").val()+"&&option4="+$("#optionD").val()+"&&answer="+encodeURIComponent(selectedAnswer);
    }
</script>
</body>
</html>
