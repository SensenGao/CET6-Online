package com.se.demo.entity;

import java.io.Serializable;

public class UserInfo implements Serializable {
    private String userId;
    private String userPassword;
    private String name;
    private String gender;

    public UserInfo() {
    }

    public UserInfo(String userId, String userPassword, String userName, String gender) {
        this.userId = userId;
        this.userPassword = userPassword;
        this.name = userName;
        this.gender = gender;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() { return name; }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
