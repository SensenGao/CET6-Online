package com.se.demo.entity;

public class SubjectiveQuestion {
    private int Subjective_ID;
    private String Examiner_ID;
    private String Subjective_Stem;
    private String Subjective_Answer;

    public SubjectiveQuestion(int Subjective_ID,
                              String Examiner_ID,
                              String Subjective_Stem,
                              String Subjective_Answer) {
        this.Subjective_ID = Subjective_ID;
        this.Examiner_ID = Examiner_ID;
        this.Subjective_Stem = Subjective_Stem;
        this.Subjective_Answer = Subjective_Answer;
    }

    public void setSubjective_ID(int subjective_ID) {
        Subjective_ID = subjective_ID;
    }

    public void setExaminer_ID(String examiner_ID) {
        Examiner_ID = examiner_ID;
    }

    public void setSubjective_Stem(String subjective_Stem) {
        Subjective_Stem = subjective_Stem;
    }

    public void setSubjective_Answer(String subjective_Answer) {
        Subjective_Answer = subjective_Answer;
    }

    public int getSubjective_ID() {
        return Subjective_ID;
    }

    public String getSubjective_string_ID() {
        return String.valueOf(Subjective_ID);
    }

    public String getExaminer_ID() {
        return Examiner_ID;
    }

    public String getSubjective_Stem() {
        return Subjective_Stem;
    }

    public String getSubjective_Stem20() {
        return Subjective_Stem.substring(0, 10).concat("...");
    }

    public String getSubjective_Answer() {
        return Subjective_Answer;
    }
}
