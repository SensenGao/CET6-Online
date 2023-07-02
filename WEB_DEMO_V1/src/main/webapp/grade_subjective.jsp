<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>学生答卷页面</title>
    <!-- Bootstrap 的 CSS 文件 -->
    <c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>
    <link rel="stylesheet" href="${path}/resource/bootstrap/css/bootstrap.css">
    <style>
        table {
            width: 80%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        .rightPart {
            width: 40%;
            margin-left: 20px;
            top: 50px;
            display: ${display};
        }

        .center-line {
            position: fixed;
            top: 0;
            left: 45%;
            transform: translateX(-50%);
            height: 100%;
            width: 1px;
            background-color: #000;
            content: "";
        }

    </style>
</head>
<body>
<h1>学生答卷列表</h1>
<div class="center-line"></div>

<div style="display: flex;">
    <div style="width: 50%;">
        <table>
            <tr>
                <th>学生ID</th>
                <th>考试ID</th>
                <th>主观题总分</th>
                <th>客观题总分</th>
                <th>查看答卷</th>
            </tr>
            <tr>
                <td>2010764</td>
                <td>1</td>
                <th>${subScores}</th>
                <th>413.5</th>
                <td><button onclick="showQuestionDetails()">查看答卷</button></td>
            </tr>
            <tr>
                <td>2013628</td>
                <td>1</td>
                <th>-</th>
                <th>357</th>
                <td><button onclick="showQuestionDetails()">查看答卷</button></td>
            </tr>
            <!-- 添加更多学生答卷的行 -->
        </table>
    </div>

    <div class="rightPart" id="rightPart">
        <form id="questionDetails">
            <c:forEach var="subAnswer" items="${subAnswerList}">
                <div class="form-group">
                    <%--@declare id="question"--%><label for="question">Question:</label>
                    <textarea class="form-control"  name="question" rows="4">${subAnswer.getSubjective_Stem()}</textarea>
                </div>
                <div class="form-group">
                    <%--@declare id="answer"--%><label for="answer">Answer:</label>
                    <textarea class="form-control"  name="answer" rows="10">${subAnswer.getSubjective_Answer()}</textarea>
                </div>
                <div class="form-group">
                    <%--@declare id="score"--%><label for="score">Score:</label>
                    <textarea style="width: 150px" class="form-control" name="score" rows="1"></textarea>
                </div>

                <div>   </div>
                <br>
                <br>
                <div>  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </div>
                <br>
                <br>
                <div>   </div>

            </c:forEach>

        </form>
        <button class="btn btn-primary" onclick="submitScore()">Submit</button>
        <br>
        <br>
        <br>
        <br>
    </div>
</div>


</body>
<script>
    function showQuestionDetails() {
        location.href = "${path}/CET6/" + "grade_subjective.do?display='block'&&exam_id=1"+"&&student_id=1";
    }

    function submitScore() {
        location.href = "${path}/CET6/" + "grade_subjective.do?display='none'&&scores=75.5"+"&&exam_id=1"+"&&student_id=1";
    }
</script>
</html>
