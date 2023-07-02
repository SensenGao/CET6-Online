package com.se.demo.controller;

//通话日志控制层

import com.se.demo.entity.*;
import com.se.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/CET6/")
public class webController {
    @Autowired //控制层调用业务层
    private UserService userService;

    @RequestMapping("login.do")
    public String login(Model model,
                        @RequestParam(name = "role", defaultValue = "")String role,
                        @RequestParam(name = "userId", defaultValue = "")String userId,
                        @RequestParam(name = "userPassword", defaultValue = "")String userPassword){
        int flag=0;
        if(!userId.isEmpty() && !userPassword.isEmpty()) {
            switch (role) {
                case "student" : {
                    flag = userService.student_check(userId, userPassword);
                    break;
                }
                case "teacher" : {
                    flag = userService.teacher_check(userId, userPassword);
                    break;
                }
                case "admin" : {
                    flag = userService.admin_check(userId, userPassword);
                    break;
                }
                default : {
                }
            }
        }
        model.addAttribute("flag", flag);
        model.addAttribute("userId", userId);
        model.addAttribute("userPassword", userPassword);
        return "login";
    }

    @RequestMapping("sign.do")
    public String sign(Model model,
                       @RequestParam(name = "email", defaultValue = "") String email,
                       @RequestParam(name = "tel", defaultValue = "") String tel,
                       @RequestParam(name = "name", defaultValue = "") String name,
                       @RequestParam(name = "role", defaultValue = "") String role,
                       @RequestParam(name = "gender", defaultValue = "") String gender,
                       @RequestParam(name = "password", defaultValue = "") String password) {
        int flag = 0;
        if (!role.isEmpty()) {
            flag = userService.sign(role, name, password, gender, tel, email);
        }
        model.addAttribute("flag", flag);
        return "sign";
    }


    @RequestMapping("student.do")
    public String student(Model model,
                          @RequestParam(name = "userId", defaultValue = "") String userId,
                          @RequestParam(name = "userPassword", defaultValue = "") String userPassword) {
        model.addAttribute("name", "aaa");
        model.addAttribute("gender", "gender");
        return "student";
    }

    @RequestMapping("historyScore.do")
    public String student(Model model) {

        return "historyScore";
    }


    @RequestMapping("admin.do")
    public String admin(Model model,
                        @RequestParam(name = "userId", defaultValue = "") String userId,
                        @RequestParam(name = "userPassword", defaultValue = "") String userPassword,
                        @RequestParam(name = "action", defaultValue = " ") String action,
                        @RequestParam(name = "examId", defaultValue = "") String examId,
                        @RequestParam(name = "examName", defaultValue = "") String examName,
                        @RequestParam(name = "examDate", defaultValue = "") String examDate,
                        @RequestParam(name = "teacherId", defaultValue = "") String teacherId,
                        @RequestParam(name = "teacherName", defaultValue = "") String teacherName,
                        @RequestParam(name = "teacherGender", defaultValue = "") String teacherGender,
                        @RequestParam(name = "teacherEmail", defaultValue = "") String teacherEmail,
                        @RequestParam(name = "teacherTel", defaultValue = "") String teacherTel,
                        @RequestParam(name = "teacherPassword", defaultValue = "") String teacherPassword,
                        @RequestParam(name = "studentId", defaultValue = "") String studentId,
                        @RequestParam(name = "studentName", defaultValue = "") String studentName,
                        @RequestParam(name = "studentGender", defaultValue = "") String studentGender,
                        @RequestParam(name = "studentEmail", defaultValue = "") String studentEmail,
                        @RequestParam(name = "studentTel", defaultValue = "") String studentTel,
                        @RequestParam(name = "studentPassword", defaultValue = "") String studentPassword
    ) {
        System.out.println("admin.do");
        switch (action) {
            case "addExam": {
                userService.add_exam(examName, examDate);
                break;
            }
            case "updateExam": {
                if (!examName.isEmpty()) {
                    userService.up_exam(examId, examName, "ExamPaper_name");
                }
                if (!examDate.isEmpty()) {
                    userService.up_exam(examId, examDate, "ExamDate");
                }
                break;
            }
            case "deleteExam": {
                userService.delete_exam(examId);
                break;
            }
            case "addTeacher": {
                userService.add_teacher(teacherName, teacherGender, teacherEmail, teacherTel, teacherPassword);
                break;
            }
            case "updateTeacher": {
                if (!teacherName.isEmpty()) {
                    userService.up_user(teacherId, teacherName, "Name", "examiner");
                }
                if (!teacherGender.isEmpty()) {
                    userService.up_user(teacherId, teacherGender, "Gender", "examiner");
                }
                if (!teacherEmail.isEmpty()) {
                    userService.up_user(teacherId, teacherEmail, "Email", "examiner");
                }
                if (!teacherTel.isEmpty()) {
                    userService.up_user(teacherId, teacherTel, "Tel", "examiner");
                }
                if (!teacherPassword.isEmpty()) {
                    userService.up_user(teacherId, teacherPassword, "Password", "examiner");
                }
                break;
            }
            case "deleteTeacher": {
                userService.delete_teacher(teacherId);
                break;
            }
            case "addStudent": {
                userService.add_student(studentName, studentGender, studentEmail, studentTel, studentPassword);
                break;
            }
            case "updateStudent": {
                if (!studentName.isEmpty()) {
                    userService.up_user(studentId, studentName, "Name", "examinee");
                }
                if (!studentGender.isEmpty()) {
                    userService.up_user(studentId, studentGender, "Gender", "examinee");
                }
                if (!studentEmail.isEmpty()) {
                    userService.up_user(studentId, studentEmail, "Email", "examinee");
                }
                if (!studentTel.isEmpty()) {
                    userService.up_user(studentId, studentTel, "Tel", "examinee");
                }
                if (!studentPassword.isEmpty()) {
                    userService.up_user(studentId, studentPassword, "Password", "examinee");
                }
                break;
            }
            case "deleteStudent": {
                userService.delete_student(studentId);
                break;
            }
            default: {
            }
        }
        List<ExamInfo> list1 = userService.get_exam();
        model.addAttribute("examList", list1);
        List<ExameeInfo> list2 = userService.get_student();
        model.addAttribute("studentList", list2);
        List<ExamerInfo> list3 = userService.get_teacher();
        model.addAttribute("teacherList", list3);
        return "admin";
    }

    @RequestMapping("teacher.do")
    public String teacher(Model model) {

        return "teacher";
    }

    @RequestMapping("enter_subjective_questions.do")
    public String enter_subjective_questions(Model model,
                                             @RequestParam(name = "question", defaultValue = "") String question,
                                             @RequestParam(name = "answer", defaultValue = "") String answer) {
        if (question.length() >= 1 && answer.length() >= 1) {
            userService.addSubQuestion(question, answer);
            model.addAttribute("question", "");
            model.addAttribute("answer", "");
        }
        return "enter_subjective_questions";
    }

    @RequestMapping("enter_objective_questions.do")
    public String enter_objective_questions(Model model,
                                            @RequestParam(name = "question", defaultValue = "") String question,
                                            @RequestParam(name = "option1", defaultValue = "") String option1,
                                            @RequestParam(name = "option2", defaultValue = "") String option2,
                                            @RequestParam(name = "option3", defaultValue = "") String option3,
                                            @RequestParam(name = "option4", defaultValue = "") String option4,
                                            @RequestParam(name = "answer", defaultValue = "") String answer) {
        if (question.length() >= 1 && answer.length() >= 1) {
            String options = option1 + "@@" + option2 + "@@" + option3 + "@@" + option4;
            //System.out.println(options);
            userService.addOptQuestion(question, options, answer);
        }
        return "enter_objective_questions";
    }

    @RequestMapping("viewBankAndSelectQuestion.do")
    public String viewBankAndSelectQuestion(Model model,
                                            @RequestParam(name = "examId", defaultValue = "") String examId,
                                            @RequestParam(name = "newSub", defaultValue = "") String newSub) {
        List<SubjectiveQuestion> subSrclist = userService.getSubQuestions();
        model.addAttribute("subQuestionList", subSrclist);


        if (examId.length() >= 1) {
            List<ExamPaper> subSequence = userService.getExamSub(examId);
            if (subSequence.isEmpty()) {
                List<SubjectiveQuestion> examSublist = new ArrayList<>();
                model.addAttribute("examSublist", examSublist);
            } else {
//                System.out.println(subSequence.get(0).getSubjective_IDs());
                if (newSub.length() >= 1) { //插入新的主观题;
                    subSequence.get(0).setSubjective_IDs(subSequence.get(0).getSubjective_IDs() + "@@" + newSub);
//                    System.out.println("添加了新题");
                }
//                System.out.println(subSequence.get(0).getSubjective_IDs());
                List<Integer> Ids = new ArrayList<>();
                String[] tokens = subSequence.get(0).getSubjective_IDs().split("@@");
                for (String token : tokens) {
                    try {
//                        System.out.println(token);
                        int number = Integer.parseInt(token.trim());
                        Ids.add(number);
//                        System.out.println(number);
                    } catch (NumberFormatException e) {
                        System.err.println("无法解析为数字: " + token); // 处理非数字的情况，可以选择忽略或进行其他处理
                    }
                }
                List<SubjectiveQuestion> examSublist = new ArrayList<>();
                for (int id : Ids) {
                    List<SubjectiveQuestion> examSub = userService.getSubById(id);
                    examSublist.add(examSub.get(0));
                }
                model.addAttribute("examId", examId);
                model.addAttribute("examSublist", examSublist);
                if (newSub.length() >= 1) {
                    userService.changeSubofExam(examId, subSequence.get(0).getSubjective_IDs());
                }
            }
        }
        return "viewBankAndSelectQuestion";
    }

    @RequestMapping("grade_subjective.do")
    public String grade_subjective(Model model,
                                   @RequestParam(name = "display", defaultValue = "none") String display,
                                   @RequestParam(name = "scores", defaultValue = "-") String scores,
                                   @RequestParam(name = "exam_id", defaultValue = "") String exam_id,
                                   @RequestParam(name = "student_id", defaultValue = "") String student_id) {

        if (exam_id.length() >= 1 && student_id.length() >= 1) {
            List<ExamPaper> subSequence = userService.getExamSub(exam_id);
            if (subSequence.isEmpty()) {
                List<SubjectiveQuestion> examSublist = new ArrayList<>();
                model.addAttribute("examSublist", examSublist);
            } else {
                List<Integer> Ids = new ArrayList<>();
                String[] tokens = subSequence.get(0).getSubjective_IDs().split("@@");
                for (String token : tokens) {
                    try {
                        int number = Integer.parseInt(token.trim());
                        Ids.add(number);
                    } catch (NumberFormatException e) {
                        System.err.println("无法解析为数字: " + token); // 处理非数字的情况，可以选择忽略或进行其他处理
                    }
                }
                List<SubjectiveQuestion> subAnswerList = new ArrayList<>();
                for (int id : Ids) {
                    List<SubjectiveQuestion> examSub = userService.getSubById(id);
                    subAnswerList.add(examSub.get(0));
                }
                model.addAttribute("subAnswerList", subAnswerList);
            }
        }
        model.addAttribute("subScores", scores); //统计主观题总分;
        model.addAttribute("display", display);
        return "grade_subjective";
    }

    @RequestMapping("test.do")
    public String test(Model model,
                       @RequestParam(name = "display", defaultValue = "none") String display,
                       @RequestParam(name = "examId", defaultValue = "") String examId,
                       @RequestParam(name = "stuId", defaultValue = "") String stuId,
                       @RequestParam(name = "subAnswer", defaultValue = "") String subAnswer,
                       @RequestParam(name = "subId", defaultValue = "") String subId) {
        List<ExamPaper> subSequence = userService.getExamSub(examId);
        if (subSequence.isEmpty()) {
            List<SubjectiveQuestion> examSublist = new ArrayList<>();
            model.addAttribute("examSublist", examSublist);
        } else {
            List<Integer> Ids = new ArrayList<>();
            String[] tokens = subSequence.get(0).getSubjective_IDs().split("@@");
            for (String token : tokens) {
                try {
                    int number = Integer.parseInt(token.trim());
                    Ids.add(number);
                } catch (NumberFormatException e) {
                    System.err.println("无法解析为数字: " + token); // 处理非数字的情况，可以选择忽略或进行其他处理
                }
            }
            List<SubjectiveQuestion> examSublist = new ArrayList<>();
            for (int id : Ids) {
                List<SubjectiveQuestion> examSub = userService.getSubById(id);
                examSublist.add(examSub.get(0));
            }
            model.addAttribute("examSublist", examSublist);

        }
        if (subId != "") {
//            System.out.println(subId);
//            Integer temp = Integer.parseInt(subId);
//            int temp=Integer.valueOf(subId);
            List<SubjectiveQuestion> subQuetion = userService.getSubById(1);
            subQuetion.get(0).setSubjective_Answer("");
            model.addAttribute("subQuetion", subQuetion.get(0));
        }

        model.addAttribute("display", display);
        model.addAttribute("examId", examId);
        model.addAttribute("stuId", stuId);
        return "test";
    }

}
