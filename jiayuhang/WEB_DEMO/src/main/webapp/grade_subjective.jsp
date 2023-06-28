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
        body {
            background-color: #a6e1e2;
        }
        table {
            width: 85%;
            border-collapse: collapse;
            line-height: 2.0; /* 设置行高值，例如 1.5 */
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
            width: 70%;
            margin-left: 610px;
            position: absolute;
            top: 180px;
            height: 800px;
            overflow: auto; /* 显示滚动条 */
            display: ${display};
        }

        .leftPart {
            width: 26%;
            margin-left: 10px;
            top: 50px;
            height: 700px;
            overflow: auto; /* 显示滚动条 */
            display: block;
        }

        .center-line {
            position: fixed;
            top: 80px;
            left: 27%;
            transform: translateX(-50%);
            height: 100%;
            width: 1px;
            background-color: #000;
            content: "";
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
        .score-button {
            width: 50px;
            height: 50px;
            border: 1px solid #000;
            background-color: #4476A7;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            margin: 10px;
        }
        .score-button:active {
            background-color: #f1f1f1;
            color: #000;

        }

    </style>
</head>
<body>


<nav class="navbar">
    <div class="container-fluid">
        <span class="navbar-brand" style="font-size: 32px; text-align: center; line-height: 50px; margin-left: 490px;">教师端</span>
        <span class="navbar-text ml-auto" style="font-size: 20px; text-align: center; line-height: 50px; margin-left: 1040px;">欢迎，XX老师</span>
    </div>
</nav>

<div style="position: absolute; top: 0; left: 0;">
    <img src="${path}/resource/picture/logo.jpg" alt="Icon" class="logo-img">
</div>


<h1 style="color: #428bca ;font-size: 30px; font-weight:600; top: 15px; left: 05%;">待批改试卷列表：
    <br>
    <br>
</h1>
<div class="center-line"></div>


<div class="leftPart" id="leftPart">
<%--    <div style="width: 33%;">--%>
        <table>
            <tr>
                <th>学生ID</th>
                <th>考试ID</th>
                <th>主观题总分</th>
                <th>客观题总分</th>
                <th>操作</th>
            </tr>

            <tr>
                <td>2010764</td>
                <td>1</td>
                <th>${subScores}</th>
                <th>320</th>
                <td><button onclick="showQuestionDetails()" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">查看试卷</button></td>
            </tr>
            <tr>
                <td>2013628</td>
                <td>1</td>
                <th>-</th>
                <th>320</th>
                <td><button onclick="showQuestionDetails()" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">查看试卷</button></td>
            </tr>
            <tr>
                <td>2013629</td>
                <td>1</td>
                <th>-</th>
                <th>320</th>
                <td><button onclick="showQuestionDetails()" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">查看试卷</button></td>
            </tr>
            <tr>
                <td>2013630</td>
                <td>1</td>
                <th>-</th>
                <th>320</th>
                <td><button onclick="showQuestionDetails()" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">查看试卷</button></td>
            </tr>
            <tr>
                <td>2013631</td>
                <td>1</td>
                <th>-</th>
                <th>320</th>
                <td><button onclick="showQuestionDetails()" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">查看试卷</button></td>
            </tr>
            <tr>
                <td>2013632</td>
                <td>1</td>
                <th>-</th>
                <th>320</th>
                <td><button onclick="showQuestionDetails()" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">查看试卷</button></td>
            </tr>
            <tr>
                <td>2013633</td>
                <td>1</td>
                <th>-</th>
                <th>320</th>
                <td><button onclick="showQuestionDetails()" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">查看试卷</button></td>
            </tr>
            <tr>
                <td>2013634</td>
                <td>1</td>
                <th>-</th>
                <th>320</th>
                <td><button onclick="showQuestionDetails()" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">查看试卷</button></td>
            </tr>
            <tr>
                <td>2013635</td>
                <td>1</td>
                <th>-</th>
                <th>320</th>
                <td><button onclick="showQuestionDetails()" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">查看试卷</button></td>
            </tr>
            <tr>
                <td>2013636</td>
                <td>1</td>
                <th>-</th>
                <th>320</th>
                <td><button onclick="showQuestionDetails()" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">查看试卷</button></td>
            </tr>
            <tr>
                <td>2013637</td>
                <td>1</td>
                <th>-</th>
                <th>320</th>
                <td><button onclick="showQuestionDetails()" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">查看试卷</button></td>
            </tr>
            <tr>
                <td>2013638</td>
                <td>1</td>
                <th>-</th>
                <th>320</th>
                <td><button onclick="showQuestionDetails()" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">查看试卷</button></td>
            </tr>
            <tr>
                <td>2013639</td>
                <td>1</td>
                <th>-</th>
                <th>320</th>
                <td><button onclick="showQuestionDetails()" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">查看试卷</button></td>
            </tr>
            <tr>
                <td>2013640</td>
                <td>1</td>
                <th>-</th>
                <th>320</th>
                <td><button onclick="showQuestionDetails()" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">查看试卷</button></td>
            </tr>
            <tr>
                <td>2013641</td>
                <td>1</td>
                <th>-</th>
                <th>320</th>
                <td><button onclick="showQuestionDetails()" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">查看试卷</button></td>
            </tr>
            <tr>
                <td>2013642</td>
                <td>1</td>
                <th>-</th>
                <th>320</th>
                <td><button onclick="showQuestionDetails()" style=" background-color: #a92f2b; color: #f1f1f1; border: none;">查看试卷</button></td>
            </tr>
            <!-- 添加更多学生答卷的行 -->
        </table>
<%--    </div>--%>
</div>

<p id="id" style="color: #428bca ;font-size: 50px; position:absolute; top: 100px; left: 31%; text-align: center;
    font-weight:600;">阅卷区：

<div class="rightPart" id="rightPart">

    <form id="questionDetails">
        <c:forEach var="subAnswer" items="${subAnswerList}">
            <div class="form-group">
                <%--@declare id="question"--%><label for="question" style="color: #0e1113 ;font-size: 26px;">Question:</label>
                <textarea style="width: 1000px" class="form-control"  name="question" rows="4">${subAnswer.getSubjective_Stem()}</textarea>
            </div>
            <div class="form-group">
                <%--@declare id="answer"--%><label for="answer" style="color: #0e1113 ;font-size: 26px;">Answer:</label>
                <textarea style="width: 1000px" class="form-control"  name="answer" rows="10">${subAnswer.getSubjective_Answer()}</textarea>
            </div>
<%--            <div class="form-group">--%>
<%--                &lt;%&ndash;@declare id="score"&ndash;%&gt;<label for="score" style="color: #0e1113 ;font-size: 26px;">Score:</label>--%>
<%--                <textarea style="width: 150px" class="form-control" name="score" rows="1"></textarea>--%>
<%--            </div>--%>

            <div class="form-group">
                    <%--@declare id="score"--%><label for="score" style="color: #0e1113 ;font-size: 26px;">Score:</label>
                <input style="width: 150px" class="form-control" type="number" name="score" min="0" max="10">
            </div>

<%--            <div class="form-group">--%>
<%--&lt;%&ndash;                    &lt;%&ndash;@declare id="score"&ndash;%&gt;<label for="score" style="color: #0e1113; font-size: 26px;">Score:</label>&ndash;%&gt;--%>


<%--            <div class="score-buttons">--%>
<%--                    <button type="button" class="score-button" value="0">0</button>--%>
<%--                    <button type="button" class="score-button" value="1">1</button>--%>
<%--                    <button type="button" class="score-button" value="2">2</button>--%>
<%--                    <button type="button" class="score-button" value="3">3</button>--%>
<%--                    <button type="button" class="score-button" value="4">4</button>--%>
<%--                    <button type="button" class="score-button" value="5">5</button>--%>
<%--                    <button type="button" class="score-button" value="6">6</button>--%>
<%--                    <button type="button" class="score-button" value="7">7</button>--%>
<%--                    <button type="button" class="score-button" value="8">8</button>--%>
<%--                    <button type="button" class="score-button" value="9">9</button>--%>
<%--                    <button type="button" class="score-button" value="10">10</button>--%>
<%--                    <input type="hidden" name="score" id="score-input">--%>
<%--                </div>--%>
<%--            </div>--%>


<%--            <div class="form-group">--%>
<%--                &lt;%&ndash;@declare id="score"&ndash;%&gt;<label for="score" style="color: #0e1113; font-size: 26px;">Score:</label>--%>
<%--                <div class="score-input-container">--%>
<%--                    <input type="text" id="score-input" class="form-control" readonly>--%>
<%--                    <button type="button" class="score-button" value="0">0</button>--%>
<%--                    <button type="button" class="score-button" value="1">1</button>--%>
<%--                    <button type="button" class="score-button" value="2">2</button>--%>
<%--                    <button type="button" class="score-button" value="3">3</button>--%>
<%--                    <button type="button" class="score-button" value="4">4</button>--%>
<%--                    <button type="button" class="score-button" value="5">5</button>--%>
<%--                    <button type="button" class="score-button" value="6">6</button>--%>
<%--                    <button type="button" class="score-button" value="7">7</button>--%>
<%--                    <button type="button" class="score-button" value="8">8</button>--%>
<%--                    <button type="button" class="score-button" value="9">9</button>--%>
<%--                    <button type="button" class="score-button" value="10">10</button>--%>
<%--                </div>--%>
<%--            </div>--%>


            <div>   </div>
            <br>
            <br>
            <div>  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </div>
            <br>
            <br>
            <div>   </div>

        </c:forEach>

    </form>
    <button style="width: 180px; height: 50px" class="btn btn-primary" onclick="submitScore()">提交评分</button>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>

</div>



</body>
<script>
    function showQuestionDetails() {
        location.href = "${path}/CET6/" + "grade_subjective.do?display='block'&&exam_id=1"+"&&student_id=1";
    }

    function submitScore() {
        location.href = "${path}/CET6/" + "grade_subjective.do?display='none'&&scores=75.5"+"&&exam_id=1"+"&&student_id=1";
    }

    // $(document).ready(function() {
    //     $('.score-button').click(function() {
    //         var score = $(this).val();
    //         $('#score-input').val(score);
    //     });
    // });

</script>
</html>
