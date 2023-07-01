package com.se.demo.entity;

public class ObjectiveQuestion {
    private String Choice_ID;
    private String Examiner_ID;
    private String Choice_Stem;
    private String Choice_Options;
    private String Choice_Answer;

    public ObjectiveQuestion(String choice_ID,
                             String examiner_ID,
                             String choice_Stem,
                             String choice_Options,
                             String choice_Answer) {
        Choice_ID = choice_ID;
        Examiner_ID = examiner_ID;
        Choice_Stem = choice_Stem;
        Choice_Options = choice_Options;
        Choice_Answer = choice_Answer;
    }

    public ObjectiveQuestion() {
    }

    public void setExaminer_ID(String examiner_ID) {
        Examiner_ID = examiner_ID;
    }

    public void setChoice_Stem(String choice_Stem) {
        Choice_Stem = choice_Stem;
    }

    public void setChoice_Answer(String choice_Answer) {
        Choice_Answer = choice_Answer;
    }

    public String getExaminer_ID() {
        return Examiner_ID;
    }

    public String getChoice_Stem() {
        return Choice_Stem;
    }

    public String getChoice_Answer() {
        return Choice_Answer;
    }

    public String getChoice_ID() {
        return Choice_ID;
    }

    public void setChoice_ID(String choice_ID) {
        Choice_ID = choice_ID;
    }

    public String getChoice_Options() {
        return Choice_Options;
    }

    public void setChoice_Options(String choice_Options) {
        Choice_Options = choice_Options;
    }
}
