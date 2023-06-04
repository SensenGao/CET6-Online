package com.se.demo.service;

import com.se.demo.entity.ExamPaper;
import com.se.demo.entity.SubjectiveQuestion;
import com.se.demo.entity.UserInfo;

import java.util.List;

public interface UserService {
    List<UserInfo> findUserInfo(String userId, String userPassword);
    void addSubQuestion(String Stem, String Answer);
    void addOptQuestion(String Stem, String Options, String Answer);
    List<SubjectiveQuestion> getSubQuestions();
    List<ExamPaper> getExamSub(String ExamPaper_ID);
    List<SubjectiveQuestion> getSubById(int Subjective_ID);
    void changeSubofExam(String examId, String newSub);
}
