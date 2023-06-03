package com.se.demo.controller;

//通话日志控制层

import com.se.demo.entity.ExamInfo;
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
    public String login(){

        return "login";
    }

    @RequestMapping("student.do")
    public String student(Model model,
                          @RequestParam(name = "userId", defaultValue = "")String userId,
                          @RequestParam(name = "userPassword", defaultValue = "")String userPassword){
        model.addAttribute("name", "aaa");
        model.addAttribute("gender", "gender");
        return "student";
    }


    @RequestMapping("admin.do")
    public String admin(Model model){
        List<ExamInfo> list = new ArrayList<>();
        list.add(new ExamInfo("0", "1", "2"));
        list.add(new ExamInfo("0", "1", "2"));
        model.addAttribute("examList", list);
        return "admin";
    }

    @RequestMapping("enter_subjective_questions.do")
    public String enter_subjective_questions(Model model,
                                             @RequestParam(name = "question", defaultValue = "")String question,
                                             @RequestParam(name = "answer", defaultValue = "")String answer){
        if(question.length() >= 1 && answer.length() >= 1) {
            userService.addSubQuestion(question, answer);
            model.addAttribute("question", "");
            model.addAttribute("answer", "");
        }
        return "enter_subjective_questions";
    }

}
