package com.se.demo.entity;

import java.io.Serializable;

public class SubjectiveQuestion {
    private String Subjective_ID;
    private String Examinee_ID;
    private String Subjective_Stem;
    private String Subjective_Answer;

    public SubjectiveQuestion(String subjective_ID,
                              String examinee_ID,
                              String subjective_Stem,
                              String subjective_Answer) {
        Subjective_ID = subjective_ID;
        Examinee_ID = examinee_ID;
        Subjective_Stem = subjective_Stem;
        Subjective_Answer = subjective_Answer;
    }

    public SubjectiveQuestion() {
    }

    public void setSubjective_ID(String subjective_ID) {
        Subjective_ID = subjective_ID;
    }

    public void setExaminee_ID(String examinee_ID) {
        Examinee_ID = examinee_ID;
    }

    public void setSubjective_Stem(String subjective_Stem) {
        Subjective_Stem = subjective_Stem;
    }

    public void setSubjective_Answer(String subjective_Answer) {
        Subjective_Answer = subjective_Answer;
    }

    public String getSubjective_ID() {
        return Subjective_ID;
    }

    public String getExaminee_ID() {
        return Examinee_ID;
    }

    public String getSubjective_Stem() {
        return Subjective_Stem;
    }

    public String getSubjective_Answer() {
        return Subjective_Answer;
    }
}
