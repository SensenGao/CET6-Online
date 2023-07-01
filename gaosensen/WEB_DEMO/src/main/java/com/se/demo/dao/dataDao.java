package com.se.demo.dao;

import com.se.demo.entity.ExamPaper;
import com.se.demo.entity.SubjectiveQuestion;

import com.se.demo.entity.ExamInfo;
import com.se.demo.entity.ExameeInfo;
import com.se.demo.entity.ExamerInfo;
import com.se.demo.entity.AdminInfo;

import java.util.List;
import java.util.Map;

public interface dataDao {
    List<ExamInfo> get_exam();
    List<ExameeInfo> get_student();
    List<ExamerInfo> get_teacher();
    void add_exam(Map<String, Object> map);
    void up_exam(Map<String, Object> map);
    void up_user(Map<String, Object> map);
    void delete_exam(Map<String, Object> map);
    void delete_student(Map<String, Object> map);
    void delete_teacher(Map<String, Object> map);
    List<ExameeInfo> student_check(Map<String, Object> map);
    List<ExamerInfo> teacher_check(Map<String, Object> map);
    List<AdminInfo> admin_check(Map<String, Object> map);
    List<ExameeInfo> student_sign(Map<String, Object> map);
    List<ExamerInfo> teacher_sign(Map<String, Object> map);
    List<AdminInfo> admin_sign(Map<String, Object> map);
    int get_id(Map<String, Object> map);
    int get_id_exam(Map<String, Object> map);
    void push_sign(Map<String, Object> map);

    void addSubQuestion(Map<String, Object> map);
    void addOptQuestion(Map<String, Object> map);
    List<SubjectiveQuestion> getSubQuestions();
    List<ExamPaper> getExamSub(Map<String, Object> map);
    List<SubjectiveQuestion> getSubById(Map<String, Object> map);
    void changeSubofExam(Map<String, Object> map);
}
