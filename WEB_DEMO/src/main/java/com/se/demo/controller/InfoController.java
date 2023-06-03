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
    public String admin(Model model){
        List<ExamInfo> list = new ArrayList<>();
        list.add(new ExamInfo("0", "1", "2"));
        list.add(new ExamInfo("0", "1", "2"));
        model.addAttribute("examList", list);
        return "admin";
    }

}
