package com.se.demo.service;

import com.se.demo.entity.SubjectiveQuestion;
import com.se.demo.entity.UserInfo;

import java.util.List;
import java.util.Map;

//访问通话日志业务层接口
public interface UserService {
    //查询通话记录日志
    List<UserInfo> findUserInfo(String userId, String userPassword);
    void addSubQuestion(String Stem, String Answer);
}
