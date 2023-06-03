package com.se.demo.dao;

import com.se.demo.entity.UserInfo;

import java.util.List;
import java.util.Map;

public interface dataDao {
    List<UserInfo> findUserInfo(Map<String, Object> map);
    void addSubQuestion(Map<String, Object> map);
}
