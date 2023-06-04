package com.se.demo.controller;

//通话日志控制层

import com.se.demo.entity.ExamInfo;
import com.se.demo.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/CET6/")
public class InfoController {
    @Autowired //控制层调用业务层
    private UserInfoService userInfoService;


    @RequestMapping("login.do")
    public String login(){

        return "login";
    }


    @RequestMapping("student.do")
    public String student(Model model,
                        @RequestParam(name = "userId", defaultValue = "")String userId,
                       @RequestParam(name = "userPassword", defaultValue = "")String userPassword){
//        List<UserInfo> userInfos = userInfoService.findUserInfo(userId, userPassword);

//        String gender = userInfos.get(0).getGender();
//        String userName = userInfos.get(0).getName();
//        System.out.println(userName+","+gender);
        model.addAttribute("name", "aaa");
        model.addAttribute("gender", "gender");
        return "student";
    }


    @RequestMapping("admin.do")
    public String admin(Model model,
                        @RequestParam(name = "userId", defaultValue = "")String userId,
                        @RequestParam(name = "userPassword", defaultValue = "")String userPassword,
                        @RequestParam(name = "action", defaultValue = " ")String action,
                        @RequestParam(name = "examId", defaultValue = "")String examId,
                        @RequestParam(name = "examName", defaultValue = "")String examName,
                        @RequestParam(name = "examDate", defaultValue = "")String examDate,
                        @RequestParam(name = "teacherId", defaultValue = "")String teacherId,
                        @RequestParam(name = "teacherName", defaultValue = "")String teacherName,
                        @RequestParam(name = "teacherGender", defaultValue = "")String teacherGender,
                        @RequestParam(name = "teacherEmail", defaultValue = "")String teacherEmail,
                        @RequestParam(name = "teacherTel", defaultValue = "")String teacherTel,
                        @RequestParam(name = "teacherPassword", defaultValue = "")String teacherPassword,
                        @RequestParam(name = "studentId", defaultValue = "")String studentId,
                        @RequestParam(name = "studentName", defaultValue = "")String studentName,
                        @RequestParam(name = "studentGender", defaultValue = "")String studentGender,
                        @RequestParam(name = "studentEmail", defaultValue = "")String studentEmail,
                        @RequestParam(name = "studentTel", defaultValue = "")String studentTel,
                        @RequestParam(name = "studentPassword", defaultValue = "")String studentPassword
                        ){
        System.out.println("admin.do");
        switch (action) {
            case "addExam" -> {
                System.out.println("addExam " + examId);
            }
            case "updateExam" -> {
                System.out.println("updateExam" + examId); // 找非空的字段更新
            }
            case "deleteExam" -> {
                System.out.println("deleteExam" + examId);
            }
            case "addTeacher" -> {
                System.out.println("addTeacher " + teacherId);
            }
            case "updateTeacher" -> {
                System.out.println("updateTeacher" + teacherId);
            }
            case "deleteTeacher" -> {
                System.out.println("deleteTeacher" + teacherId);
            }
            case "addStudent" -> {
                System.out.println("addStudent " + studentId);
            }
            case "updateStudent" -> {
                System.out.println("updateStudent" + studentId);
            }
            case "deleteStudent" -> {
                System.out.println("deleteStudent" + studentId);
            }
            default -> {
            }
        }
        List<ExamInfo> list = new ArrayList<>();
        list.add(new ExamInfo("0", "1", "2"));
        list.add(new ExamInfo("1", "1", "1"));
        model.addAttribute("examList", list);
        return "admin";
    }

}
