package com.se.demo.service;

import com.se.demo.entity.ExamPaper;
import com.se.demo.entity.SubjectiveQuestion;

import com.se.demo.entity.ExamInfo;
import com.se.demo.entity.ExameeInfo;
import com.se.demo.entity.ExamerInfo;
import com.se.demo.entity.AdminInfo;

import java.util.List;

public interface UserService {
    void addSubQuestion(String Stem, String Answer);
    void addOptQuestion(String Stem, String Options, String Answer);
    List<SubjectiveQuestion> getSubQuestions();
    List<ExamPaper> getExamSub(String ExamPaper_ID);
    List<SubjectiveQuestion> getSubById(int Subjective_ID);
    void changeSubofExam(String examId, String newSub);

    List<ExamInfo> get_exam();
    List<ExameeInfo> get_student();
    List<ExamerInfo> get_teacher();
    void add_exam (String name,String date);
    void add_teacher (String name,String gender,String email,String tel,String password);
    void add_student (String name,String gender,String email,String tel,String password);
    void up_exam (String id,String temp,String kind);
    void up_user (String id,String temp,String kind,String ku);
    void delete_exam (String Id);
    void delete_student (String Id);
    void delete_teacher (String Id);
    int student_check(String userId,String userPassword);
    int teacher_check(String userId,String userPassword);
    int admin_check(String userId,String userPassword);
    int sign(String role,String name,String password,String gender,String tel,String email);
}
