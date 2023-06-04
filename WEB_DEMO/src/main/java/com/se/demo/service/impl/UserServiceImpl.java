package com.se.demo.service.impl;

import com.se.demo.dao.dataDao;
import com.se.demo.entity.ExamPaper;
import com.se.demo.entity.SubjectiveQuestion;
import com.se.demo.entity.UserInfo;
import com.se.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private dataDao mydataDao;

    @Override
    public List<UserInfo> findUserInfo(String userId, String userPassword) {
        Map<String, Object> map = new HashMap<>();
        map.put("userId", userId);
        map.put("userPassword", userPassword);
        List<UserInfo> list = mydataDao.findUserInfo(map);

        return list;
    }

    @Override
    public void addSubQuestion(String Stem, String Answer) {
        Map<String, Object> map = new HashMap<>();
        map.put("Stem", Stem);
        map.put("Answer", Answer);
        mydataDao.addSubQuestion(map);
    }

    @Override
    public void addOptQuestion(String Stem, String Options, String Answer) {
        Map<String, Object> map = new HashMap<>();
        map.put("Stem", Stem);
        map.put("Options", Options);
        map.put("Answer", Answer);
        mydataDao.addOptQuestion(map);
    }

    @Override
    public List<SubjectiveQuestion> getSubQuestions() {
        List<SubjectiveQuestion> list = mydataDao.getSubQuestions();
//        if(list.isEmpty())
//        System.out.println(list.get(0).getSubjective_Stem());
//        System.out.println(list.get(0).getSubjective_Stem());
        return list;
    }

    @Override
    public List<ExamPaper> getExamSub(String ExamPaper_ID) {
        Map<String, Object> map = new HashMap<>();
        map.put("ExamPaper_ID", ExamPaper_ID);
        List<ExamPaper> list = mydataDao.getExamSub(map);
        return list;
    }

    @Override
    public List<SubjectiveQuestion> getSubById(int Subjective_ID) {
        Map<String, Object> map = new HashMap<>();
        map.put("Subjective_ID", Subjective_ID);
        List<SubjectiveQuestion> list = mydataDao.getSubById(map);
        return list;
    }

    @Override
    public void changeSubofExam(String examId, String newSub) {
        Map<String, Object> map = new HashMap<>();
        map.put("examId", examId);
        map.put("newSub", newSub);
        mydataDao.changeSubofExam(map);
    }

}

