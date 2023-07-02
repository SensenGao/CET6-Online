package com.se.demo.service.impl;

import com.se.demo.dao.dataDao;
import com.se.demo.entity.ExamPaper;
import com.se.demo.entity.SubjectiveQuestion;
import com.se.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.se.demo.entity.ExamInfo;
import com.se.demo.entity.ExameeInfo;
import com.se.demo.entity.ExamerInfo;
import com.se.demo.entity.AdminInfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private dataDao mydataDao;

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
        //        if(list.isEmpty())
//        System.out.println(list.get(0).getSubjective_Stem());
//        System.out.println(list.get(0).getSubjective_Stem());
        return mydataDao.getSubQuestions();
    }

    @Override
    public List<ExamPaper> getExamSub(String ExamPaper_ID) {
        int id  = Integer.parseInt(ExamPaper_ID);
        System.out.println(id);
        Map<String, Object> map = new HashMap<>();
        map.put("ExamPaper_ID", id);
        return mydataDao.getExamSub(map);
    }

    @Override
    public List<SubjectiveQuestion> getSubById(int Subjective_ID) {
        Map<String, Object> map = new HashMap<>();
        map.put("Subjective_ID", Subjective_ID);
        return mydataDao.getSubById(map);
    }

    @Override
    public void changeSubofExam(String examId, String newSub) {
        Map<String, Object> map = new HashMap<>();
        map.put("examId", examId);
        map.put("newSub", newSub);
        mydataDao.changeSubofExam(map);
    }

    @Override
    public List<ExamInfo> get_exam() {
        List<ExamInfo> list = mydataDao.get_exam();
        return list;
    }

    @Override
    public List<ExameeInfo> get_student() {
        List<ExameeInfo> list = mydataDao.get_student();
        return list;
    }

    @Override
    public List<ExamerInfo> get_teacher() {
        List<ExamerInfo> list = mydataDao.get_teacher();
        return list;
    }

    @Override
    public void add_exam(String name,String date) {
        Map<String, Object> map = new HashMap<>();
        int id =mydataDao.get_id_exam(map) + 1;
        map.put("id",id);
        map.put("name", name);
        map.put("date", date);
        mydataDao.add_exam(map);
    }

    @Override
    public void add_teacher(String name,String gender,String email,String tel,String password) {
        Map<String, Object> map = new HashMap<>();
        map.put("name", name);
        map.put("tel", tel);
        map.put("email", email);
        map.put("role","examiner");
        map.put("password",password);
        map.put("gender",gender);
        int id = mydataDao.get_id(map) + 1;
        map.put("id",id);
        mydataDao.push_sign(map);
    }

    @Override
    public void add_student(String name,String gender,String email,String tel,String password) {
        Map<String, Object> map = new HashMap<>();
        map.put("name", name);
        map.put("tel", tel);
        map.put("email", email);
        map.put("role","examinee");
        map.put("password",password);
        map.put("gender",gender);
        int id = mydataDao.get_id(map) + 1;
        map.put("id",id);
        mydataDao.push_sign(map);
    }

    @Override
    public void up_exam(String id,String temp,String kind) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("temp", temp);
        map.put("kind", kind);
        mydataDao.up_exam(map);
    }

    @Override
    public void up_user (String id,String temp,String kind,String ku) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("temp", temp);
        map.put("kind", kind);
        map.put("ku", ku);
        mydataDao.up_user(map);
    }

    @Override
    public void delete_exam(String Id) {
        Map<String, Object> map = new HashMap<>();
        int id = Integer.parseInt(Id);
        map.put("Id", id);
        mydataDao.delete_exam(map);
    }

    @Override
    public void delete_student(String Id) {
        Map<String, Object> map = new HashMap<>();
        int id = Integer.parseInt(Id);
        map.put("Id", id);
        mydataDao.delete_student(map);
    }

    @Override
    public void delete_teacher(String Id) {
        Map<String, Object> map = new HashMap<>();
        int id = Integer.parseInt(Id);
        map.put("Id", id);
        mydataDao.delete_teacher(map);
    }

    @Override
    public int student_check(String userId,String userPassword){
        Map<String, Object> map = new HashMap<>();
        int temp = Integer.parseInt(userId);

        map.put("userId", temp);
        map.put("userPassword", userPassword);
        List<ExameeInfo> list = mydataDao.student_check(map);
        if(list.isEmpty()){return 1;}
        return 2;
    }
    public int teacher_check(String userId,String userPassword){
        Map<String, Object> map = new HashMap<>();
        int temp = Integer.parseInt(userId);
        map.put("userId", temp);
        map.put("userPassword", userPassword);
        List<ExamerInfo> list = mydataDao.teacher_check(map);
        if(list.isEmpty()){return 1;}
        return 3;
    }
    public int admin_check(String userId,String userPassword){
        Map<String, Object> map = new HashMap<>();
        int temp = Integer.parseInt(userId);
        map.put("userId", temp);
        map.put("userPassword", userPassword);
        List<AdminInfo> list = mydataDao.admin_check(map);
        if(list.isEmpty()){return 1;}
        return 4;
    }

    @Override
    public int sign(String role,String name,String password,String gender,String tel,String email){
        Map<String, Object> map = new HashMap<>();
        map.put("name", name);
        map.put("tel", tel);
        map.put("email", email);
        int flag=1;
        switch (role) {
            case "student" : {
                role="examinee";
                System.out.println("/n text ");
                List<ExameeInfo> list = mydataDao.student_sign(map);
                if(list.isEmpty()){flag=2;}
                break;
            }
            case "teacher" : {
                role="examiner";
                List<ExamerInfo> list = mydataDao.teacher_sign(map);
                if(list.isEmpty()){flag=2;}
                break;
            }
            case "admin" : {
                role="manager";
                List<AdminInfo> list = mydataDao.admin_sign(map);
                if(list.isEmpty()){flag=2;}
                break;
            }
            default : {break;}
        }
        map.put("role",role);
        map.put("password",password);
        map.put("gender",gender);
        if(flag == 2){
            int temp = mydataDao.get_id(map) + 1;
            map.put("id",temp);
            mydataDao.push_sign(map);
        }
        return flag;
    }

}

