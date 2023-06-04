package com.se.demo.entity;

import java.io.Serializable;

public class ExamInfo implements Serializable {
    private String id;
    private String name;
    private String date;
    private String c_num;//选择题
    private String c_id;
    private String s_num;//客观题
    private String s_id;

    public ExamInfo(String id, String name, String date, String c_num, String c_id, String s_num, String s_id) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.c_num = c_num;
        this.c_id = c_id;
        this.s_num = s_num;
        this.s_id = s_id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getC_num() {
        return c_num;
    }

    public void setC_num(String c_num) {
        this.c_num = c_num;
    }

    public String getC_id() {
        return c_id;
    }

    public void setC_id(String c_id) {
        this.c_id = c_id;
    }

    public String getS_num() {
        return s_num;
    }

    public void setS_num(String s_num) {
        this.s_num = s_num;
    }

    public String getS_id() {
        return s_id;
    }

    public void setS_id(String s_id) {
        this.s_id = s_id;
    }
}
