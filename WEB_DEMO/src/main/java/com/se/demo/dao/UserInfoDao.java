package com.se.demo.dao;

import com.se.demo.entity.ExamInfo;
import com.se.demo.entity.ExameeInfo;
import com.se.demo.entity.ExamerInfo;
import com.se.demo.entity.AdminInfo;

import java.util.List;
import java.util.Map;

public interface UserInfoDao {
    List<ExamInfo> get_exam();
    void add_exam(Map<String, Object> map);
    void delete_exam(Map<String, Object> map);
    List<ExameeInfo> student_check(Map<String, Object> map);
    List<ExamerInfo> teacher_check(Map<String, Object> map);
    List<AdminInfo> admin_check(Map<String, Object> map);
    List<ExameeInfo> student_sign(Map<String, Object> map);
    List<ExamerInfo> teacher_sign(Map<String, Object> map);
    List<AdminInfo> admin_sign(Map<String, Object> map);
    int get_id(Map<String, Object> map);
    void push_sign(Map<String, Object> map);
}
