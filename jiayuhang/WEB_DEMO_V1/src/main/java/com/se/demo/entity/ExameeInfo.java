package com.se.demo.entity;

import java.io.Serializable;

public class ExameeInfo implements Serializable {
    private int Id;
    private String Name;
    private String Gender;
    private String Email;
    private String Tel;
    private String Password;

    public ExameeInfo(int id, String name, String gender, String email, String tel, String password) {
        Id = id;
        Name = name;
        Gender = gender;
        Email = email;
        Tel = tel;
        Password = password;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String gender) {
        Gender = gender;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getTel() {
        return Tel;
    }

    public void setTel(String tel) {
        Tel = tel;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }
}
