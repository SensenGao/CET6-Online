package com.se.demo.service.impl;

import com.se.demo.dao.UserInfoDao;
import com.se.demo.entity.UserInfo;
import com.se.demo.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class UserInfoServiceImpl implements UserInfoService {
    @Autowired
    private UserInfoDao userInfoDao;

    @Override
    public List<UserInfo> findUserInfo(String userId, String userPassword) {
        Map<String, Object> map = new HashMap<>();
        map.put("userId", userId);
        map.put("userPassword", userPassword);
        List<UserInfo> list = userInfoDao.findUserInfo(map);

        return list;
    }
}
