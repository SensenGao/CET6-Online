package com.se.demo.dao;

import com.se.demo.entity.ExamPaper;
import com.se.demo.entity.SubjectiveQuestion;
import com.se.demo.entity.UserInfo;

import java.util.List;
import java.util.Map;

public interface dataDao {
    List<UserInfo> findUserInfo(Map<String, Object> map);
    void addSubQuestion(Map<String, Object> map);
    void addOptQuestion(Map<String, Object> map);
    List<SubjectiveQuestion> getSubQuestions();
    List<ExamPaper> getExamSub(Map<String, Object> map);
    List<SubjectiveQuestion> getSubById(Map<String, Object> map);
    void changeSubofExam(Map<String, Object> map);
}
