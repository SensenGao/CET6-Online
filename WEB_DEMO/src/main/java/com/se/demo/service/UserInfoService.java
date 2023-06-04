package com.se.demo.service;

import com.se.demo.entity.ExamInfo;

import java.util.List;

//访问通话日志业务层接口
public interface UserInfoService {
    //查询通话记录日志
    List<ExamInfo> get_exam();
    void add_exam(String ExamId, String Date);
    void delete_exam(String ExamId);
    int student_check(String userId,String userPassword);
    int teacher_check(String userId,String userPassword);
    int admin_check(String userId,String userPassword);
    int sign(String role,String name,String password,String gender,String tel,String email);
}
