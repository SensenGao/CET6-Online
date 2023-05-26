package com.se.demo.service;

import com.se.demo.entity.UserInfo;

import java.util.List;

//访问通话日志业务层接口
public interface UserInfoService {
    //查询通话记录日志
    List<UserInfo> findUserInfo(String userId, String userPassword);
}
