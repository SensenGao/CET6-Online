package com.se.demo.service.impl;

import com.se.demo.entity.UserInfo;
import com.se.demo.dao.dataDao;
import com.se.demo.service.userService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class userServiceImpl implements userService {
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
    public void addUserInfo(String userId, String userPassword) {
        Map<String, Object> map = new HashMap<>();
        map.put("userId", userId);
        map.put("userPassword", userPassword);
        mydataDao.addUserInfo(map);
    }

    @Override
    public void addSubQuestion(String Stem, String Answer) {
        Map<String, Object> map = new HashMap<>();
        map.put("Stem", Stem);
        map.put("Answer", Answer);
        mydataDao.addSubQuestion(map);
    }
}

