package com.se.demo.service.impl;

import com.se.demo.dao.UserInfoDao;
import com.se.demo.entity.ExamInfo;
import com.se.demo.entity.ExameeInfo;
import com.se.demo.entity.ExamerInfo;
import com.se.demo.entity.AdminInfo;

import com.se.demo.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class UserInfoServiceImpl implements UserInfoService {
    @Autowired
    private UserInfoDao userInfoDao;

    @Override
    public List<ExamInfo> get_exam() {
        List<ExamInfo> list = userInfoDao.get_exam();
        return list;
    }

    @Override
    public void add_exam(String ExamId, String Date) {
        Map<String, Object> map = new HashMap<>();
        map.put("ExamId", ExamId);
        map.put("Date", Date);
        userInfoDao.add_exam(map);
    }

    @Override
    public void delete_exam(String ExamId){
        Map<String, Object> map = new HashMap<>();
        map.put("ExamId", ExamId);
        userInfoDao.delete_exam(map);
    }

    @Override
    public int student_check(String userId,String userPassword){
        Map<String, Object> map = new HashMap<>();
        int temp = Integer.parseInt(userId);

        map.put("userId", temp);
        map.put("userPassword", userPassword);
        List<ExameeInfo> list = userInfoDao.student_check(map);
        if(list.isEmpty()){return 1;}
        return 2;
    }
    public int teacher_check(String userId,String userPassword){
        Map<String, Object> map = new HashMap<>();
        int temp = Integer.parseInt(userId);
        map.put("userId", temp);
        map.put("userPassword", userPassword);
        List<ExamerInfo> list = userInfoDao.teacher_check(map);
        if(list.isEmpty()){return 1;}
        return 3;
    }
    public int admin_check(String userId,String userPassword){
        Map<String, Object> map = new HashMap<>();
        int temp = Integer.parseInt(userId);
        map.put("userId", temp);
        map.put("userPassword", userPassword);
        List<AdminInfo> list = userInfoDao.admin_check(map);
        if(list.isEmpty()){return 1;}
        return 4;
    }
    public int sign(String role,String name,String password,String gender,String tel,String email){
        Map<String, Object> map = new HashMap<>();
        map.put("name", name);
        map.put("tel", tel);
        map.put("email", email);
        int flag=1;
        switch (role) {
            case "student" -> {
                role="examinee";
                System.out.println("/n text ");
                List<ExameeInfo> list = userInfoDao.student_sign(map);
                if(list.isEmpty()){flag=2;}
            }
            case "teacher" -> {
                role="examiner";
                List<ExamerInfo> list = userInfoDao.teacher_sign(map);
                if(list.isEmpty()){flag=2;}
            }
            case "admin" -> {
                role="manager";
                List<AdminInfo> list = userInfoDao.admin_sign(map);
                if(list.isEmpty()){flag=2;}
            }
            default -> {}
        }
        map.put("role",role);
        map.put("password",password);
        map.put("gender",gender);
        if(flag == 2){
            int temp = userInfoDao.get_id(map) + 1;
            map.put("id",temp);
            userInfoDao.push_sign(map);
        }
        return flag;
    }
}
