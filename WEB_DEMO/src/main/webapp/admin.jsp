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
            margin-right: 5px;
            /* 添加右侧边距 */
        }

        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #45a049;
        }

        th {
            text-align: center;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="row">
        <!-- 左侧部分，显示所有的考试信息 -->
        <div class="col-md-4" style="overflow-x: auto; white-space: nowrap;">
            <h2>考试信息管理</h2>

            <!-- 添加考试信息按钮 -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addExamModal">
                添加考试信息
            </button>

            <!-- 考试信息列表 -->
            <table class="table">
                <thead>
                <tr>
                    <th>考试ID</th>
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
                        <td contenteditable="true"
                            onblur="updateExamInfo('${exam.id}', 'examId', this.innerText)">${exam.name}
                        </td>
                        <td contenteditable="true"
                            onblur="updateExamInfo('${exam.id}', 'examDate', this.innerText)">
                                ${exam.date}</td>
                        <td>
                            <!-- 删除考试信息按钮 -->
                            <button type="button" class="btn btn-danger"
                                    onclick="deleteExamInfo('${exam.id}')">
                                删除
                            </button>
                            <!-- 查看考试信息按钮 TODO -->
                            <button type="button" class="btn btn-success">
                                查看
                            </button>
                        </td>
                    </tr>
                </c:forEach>

                <script type="text/javascript">
                    function updateExamInfo(examId, field, new_value) {
                        location.href = "${path}/CET6/admin.do?userId=${userId}&userPassword=${userPassword}&action=updateExam&examId=" + examId + "&" + field + "=" + new_value;
                        alert("exam " + examId + " 更改成功！");
                    }

                    function deleteExamInfo(examId) {
                        location.href = "${path}/CET6/admin.do?userId=${userId}&userPassword=${userPassword}&action=deleteExam&examId=" + examId;
                        alert("exam " + examId + " 删除成功！");
                    }
                </script>

                </tbody>
            </table>
        </div>

        <!-- 中间部分，显示所有的教师信息 -->
        <div class="col-md-4" style="overflow-x: auto; white-space: nowrap;">
            <h2>教师信息管理</h2>

            <!-- 添加教师信息按钮 -->
            <button type="button" class="btn btn-primary" data-toggle="modal"
                    data-target="#addTeacherModal">
                添加教师信息
            </button>

            <!-- 教师信息列表 -->
            <table class="table">
                <thead>
                <tr>
                    <th>教师ID</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>Email</th>
                    <th>Tel</th>
                    <th>Password</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <!-- 使用JSP标签循环遍历教师信息 -->
                <c:forEach var="teacher" items="${teacherList}">
                    <tr>
                        <td>${teacher.id}</td>
                        <td contenteditable="true"
                            onblur="updateTeacherInfo('${teacher.id}', 'teacherName', this.innerText)">
                                ${teacher.name}</td>
                        <td contenteditable="true"
                            onblur="updateTeacherInfo('${teacher.id}', 'teacherGender', this.innerText)">
                                ${teacher.gender}</td>
                        <td contenteditable="true"
                            onblur="updateTeacherInfo('${teacher.id}', 'teacherEmail', this.innerText)">
                                ${teacher.email}</td>
                        <td contenteditable="true"
                            onblur="updateTeacherInfo('${teacher.id}', 'teacherTel', this.innerText)">
                                ${teacher.tel}</td>
                        <td contenteditable="true"
                            onblur="updateTeacherInfo('${teacher.id}', 'teacherPassword', this.innerText)">
                                ${teacher.password}</td>
                        <td>
                            <!-- 删除教师信息按钮 -->
                            <button type="button" class="btn btn-danger"
                                    onclick="deleteTeacherInfo('${teacher.id}')">
                                删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>

                <script type="text/javascript">
                    function updateTeacherInfo(teacherId, field, new_value) {
                        location.href = "${path}/CET6/admin.do?userId=${userId}&userPassword=${userPassword}&action=updateTeacher&teacherId=" + teacherId + "&" + field + "=" + new_value;
                        alert("teacher " + teacherId + " 更改成功！");
                    }

                    function deleteTeacherInfo(teacherId) {
                        location.href = "${path}/CET6/admin.do?userId=${userId}&userPassword=${userPassword}&action=deleteTeacher&teacherId=" + teacherId;
                        alert("teacher " + teacherId + " 删除成功！");
                    }
                </script>

                </tbody>
            </table>
        </div>

        <!-- 右侧部分，显示所有的学生信息 -->
        <div class="col-md-4" style="overflow-x: auto; white-space: nowrap;">
            <h2>学生信息管理</h2>

            <!-- 添加学生信息按钮 -->
            <button type="button" class="btn btn-primary" data-toggle="modal"
                    data-target="#addStudentModal">
                添加学生信息
            </button>

            <!-- 学生信息列表 -->
            <table class="table">
                <thead>
                <tr>
                    <th>学生ID</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>Email</th>
                    <th>Tel</th>
                    <th>Password</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <!-- 使用JSP标签循环遍历学生信息 -->
                <c:forEach var="student" items="${studentList}">
                    <tr>
                        <td>${student.id}</td>
                        <td contenteditable="true"
                            onblur="updateStudentInfo('${student.id}', 'studentName', this.innerText)">
                                ${student.name}</td>
                        <td contenteditable="true"
                            onblur="updateStudentInfo('${student.id}', 'studentGender', this.innerText)">
                                ${student.gender}</td>
                        <td contenteditable="true"
                            onblur="updateStudentInfo('${student.id}', 'studentEmail', this.innerText)">
                                ${student.email}</td>
                        <td contenteditable="true"
                            onblur="updateStudentInfo('${student.id}', 'studentTel', this.innerText)">
                                ${student.tel}</td>
                        <td contenteditable="true"
                            onblur="updateStudentInfo('${student.id}', 'studentPassword', this.innerText)">
                                ${student.password}</td>
                        <td>
                            <!-- 删除学生信息按钮 -->
                            <button type="button" class="btn btn-danger"
                                    onclick="deleteStudentInfo('${student.id}')">
                                删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>

                <script type="text/javascript">
                    function updateStudentInfo(studentId, field, new_value) {
                        location.href = "${path}/CET6/admin.do?userId=${userId}&userPassword=${userPassword}&action=updateStudent&studentId=" + studentId + "&" + field + "=" + new_value;
                        alert("student " + studentId + " 更改成功！");
                    }

                    function deleteStudentInfo(studentId) {
                        location.href = "${path}/CET6/admin.do?userId=${userId}&userPassword=${userPassword}&action=deleteStudent&studentId=" + studentId;
                        alert("student " + studentId + " 删除成功！");
                    }
                </script>

                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- 添加考试信息模态框 -->
<div class="modal fade" id="addExamModal" tabindex="-1" role="dialog" aria-labelledby="addExamModalLabel"
     aria-hidden="true">
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
                        <label for="addExamId">考试ID</label>
                        <input type="text" class="form-control" id="addExamId" name="addExamId">
                    </div>

                    <div class="form-group">
                        <label for="addExamName">考试名称<span style="color:red; white-space: nowrap;"> *
                                        </span></label>
                        <input type="text" class="form-control" id="addExamName" name="addExamName"
                               required>
                    </div>

                    <div class="form-group">
                        <label for="addExamDate">考试日期<span style="color:red; white-space: nowrap;"> *
                                        </span></label>
                        <input type="date" class="form-control" id="addExamDate" name="addExamDate"
                               required>
                    </div>

                    <button type="button" class="btn btn-primary" onclick="addExamInfo()">添加</button>
                    <script type="text/javascript">
                        function addExamInfo() {
                            location.href = "${path}/CET6/admin.do?userId=${userId}&userPassword=${userPassword}&action=addExam&examId=" + $("#addExamId").val() + "&examName=" + $("#addExamName").val() + "&examDate=" + $("#addExamDate").val();
                            alert("exam " + $("#addExamId").val() + " 添加成功！");
                        }
                    </script>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 添加教师信息模态框 -->
<div class="modal fade" id="addTeacherModal" tabindex="-1" role="dialog"
     aria-labelledby="addTeacherModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addTeacherModalLabel">添加教师信息</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- 在模态框中放置添加教师信息的表单 -->
                <form action="admin.jsp" method="get">
                    <div class="form-group">
                        <label for="addTeacherId">教师ID</label>
                        <input type="text" class="form-control" id="addTeacherId" name="addTeacherId">
                    </div>

                    <div class="form-group">
                        <label for="addTeacherName">教师姓名<span style="color:red; white-space: nowrap;"> *
                                        </span></label>
                        <input type="text" class="form-control" id="addTeacherName" name="addTeacherName"
                               required>
                    </div>

                    <div class="form-group">
                        <label for="addTeacherGender">教师性别<span style="color:red; white-space: nowrap;"> *
                                        </span></label>
                        <select name="addTeacherGender" id="addTeacherGender" required>
                            <option value="男">男</option>
                            <option value="女">女</option>
                            <option value="其它">其它</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="addTeacherEmail">教师Email<span style="color:red; white-space: nowrap;"> *
                                        </span></label>
                        <input type="text" class="form-control" id="addTeacherEmail" name="addTeacherEmail"
                               required>
                    </div>

                    <div class="form-group">
                        <label for="addTeacherTel">教师Tel<span style="color:red; white-space: nowrap;"> *
                                        </span></label>
                        <input type="text" class="form-control" id="addTeacherTel" name="addTeacherTel"
                               required>
                    </div>

                    <div class="form-group">
                        <label for="addTeacherPassword">教师Password<span
                                style="color:red; white-space: nowrap;"> * </span></label>
                        <input type="text" class="form-control" id="addTeacherPassword"
                               name="addTeacherPassword" required>
                    </div>

                    <button type="button" class="btn btn-primary" onclick="addTeacherInfo()">添加</button>
                    <script type="text/javascript">
                        function addTeacherInfo() {
                            location.href = "${path}/CET6/admin.do?userId=${userId}&userPassword=${userPassword}&action=addTeacher&teacherId=" + $("#addTeacherId").val() + "&teacherName=" + $("#addTeacherName").val() + "&teacherGender=" + $("#addTeacherGender").val() + "&teacherEmail=" + $("#addTeacherEmail").val() + "&teacherTel=" + $("#addTeacherTel").val() + "&teacherPassword=" + $("#addTeacherPassword").val();
                            alert("Teacher " + $("#addTeacherId").val() + " 添加成功！");
                        }
                    </script>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 添加学生信息模态框 -->
<div class="modal fade" id="addStudentModal" tabindex="-1" role="dialog"
     aria-labelledby="addStudentModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addStudentModalLabel">添加学生信息</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- 在模态框中放置添加学生信息的表单 -->
                <form action="admin.jsp" method="get">
                    <div class="form-group">
                        <label for="addStudentId">学生ID</label>
                        <input type="text" class="form-control" id="addStudentId" name="addStudentId">
                    </div>

                    <div class="form-group">
                        <label for="addStudentName">学生姓名<span style="color:red; white-space: nowrap;"> *
                                        </span></label>
                        <input type="text" class="form-control" id="addStudentName" name="addStudentName"
                               required>
                    </div>

                    <div class="form-group">
                        <label for="addStudentGender">学生性别<span style="color:red; white-space: nowrap;"> *
                                        </span></label>
                        <select name="addStudentGender" id="addStudentGender" required>
                            <option value="男">男</option>
                            <option value="女">女</option>
                            <option value="其它">其它</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="addStudentEmail">学生Email<span style="color:red; white-space: nowrap;"> *
                                        </span></label>
                        <input type="text" class="form-control" id="addStudentEmail" name="addStudentEmail"
                               required>
                    </div>

                    <div class="form-group">
                        <label for="addStudentTel">学生Tel<span style="color:red; white-space: nowrap;"> *
                                        </span></label>
                        <input type="text" class="form-control" id="addStudentTel" name="addStudentTel"
                               required>
                    </div>

                    <div class="form-group">
                        <label for="addStudentPassword">学生Password<span
                                style="color:red; white-space: nowrap;"> * </span></label>
                        <input type="text" class="form-control" id="addStudentPassword"
                               name="addStudentPassword" required>
                    </div>

                    <button type="button" class="btn btn-primary" onclick="addStudentInfo()">添加</button>
                    <script type="text/javascript">
                        function addStudentInfo() {
                            location.href = "${path}/CET6/admin.do?userId=${userId}&userPassword=${userPassword}&action=addStudent&studentId=" + $("#addStudentId").val() + "&studentName=" + $("#addStudentName").val() + "&studentGender=" + $("#addStudentGender").val() + "&studentEmail=" + $("#addStudentEmail").val() + "&studentTel=" + $("#addStudentTel").val() + "&studentPassword=" + $("#addStudentPassword").val();
                            alert("Student " + $("#addStudentId").val() + " 添加成功！");
                        }
                    </script>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${path}/resource/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${path}/resource/bootstrap/js/bootstrap.js"></script>

</body>

</html>
```