package com.se.demo.entity;

public class ExamPaper {
    private int ExamPaper_ID;
    private String ExamName;
    private String ExamDate;
    private String Choice_Num;
    private String Choice_IDs;

    private String Subjective_Num;
    private String Subjective_IDs;

    public ExamPaper(int examPaper_ID, String examName, String examDate, String choice_Num, String choice_IDs, String subjective_Num, String subjective_IDs) {
        ExamPaper_ID = examPaper_ID;
        ExamName = examName;
        ExamDate = examDate;
        Choice_Num = choice_Num;
        Choice_IDs = choice_IDs;
        Subjective_IDs = subjective_IDs;
        Subjective_Num = subjective_Num;
    }

    public int getExamPaper_ID() {
        return ExamPaper_ID;
    }

    public void setExamName(String examName) {
        ExamName = examName;
    }

    public String getExamName() {
        return ExamName;
    }

    public String getExamDate() {
        return ExamDate;
    }

    public String getChoice_Num() {
        return Choice_Num;
    }

    public String getChoice_IDs() {
        return Choice_IDs;
    }

    public String getSubjective_IDs() {
        return Subjective_IDs;
    }

    public String getSubjective_Num() {
        return Subjective_Num;
    }

    public void setExamPaper_ID(int examPaper_ID) {
        ExamPaper_ID = examPaper_ID;
    }

    public void setExamDate(String examDate) {
        ExamDate = examDate;
    }

    public void setChoice_Num(String choice_Num) {
        Choice_Num = choice_Num;
    }

    public void setChoice_IDs(String choice_IDs) {
        Choice_IDs = choice_IDs;
    }

    public void setSubjective_IDs(String subjective_IDs) {
        Subjective_IDs = subjective_IDs;
    }

    public void setSubjective_Num(String subjective_Num) {
        Subjective_Num = subjective_Num;
    }
}
