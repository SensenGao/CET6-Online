package com.se.demo.entity;

public class ExamPaper {
    private String ExamPaper_ID;
    private String ExamDate;
    private String Choice_Num;
    private String Choice_IDs;
    private String Subjective_IDs;
    private String Subjective_Num;

    public ExamPaper(String examPaper_ID, String examDate, String choice_Num, String choice_IDs, String subjective_IDs, String subjective_Num) {
        ExamPaper_ID = examPaper_ID;
        ExamDate = examDate;
        Choice_Num = choice_Num;
        Choice_IDs = choice_IDs;
        Subjective_IDs = subjective_IDs;
        Subjective_Num = subjective_Num;
    }

    public String getExamPaper_ID() {
        return ExamPaper_ID;
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

    public void setExamPaper_ID(String examPaper_ID) {
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
