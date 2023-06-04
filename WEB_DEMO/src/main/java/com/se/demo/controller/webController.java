package com.se.demo.controller;

//通话日志控制层

import com.se.demo.entity.ExamInfo;
import com.se.demo.entity.ExamPaper;
import com.se.demo.entity.SubjectiveQuestion;
import com.se.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/CET6/")
public class webController {
    @Autowired //控制层调用业务层
    private UserService userService;


    @RequestMapping("login.do")
    public String login(){

        return "login";
    }

    @RequestMapping("student.do")
    public String student(Model model,
                          @RequestParam(name = "userId", defaultValue = "")String userId,
                          @RequestParam(name = "userPassword", defaultValue = "")String userPassword){
        model.addAttribute("name", "aaa");
        model.addAttribute("gender", "gender");
        return "student";
    }


    @RequestMapping("admin.do")
    public String admin(Model model){
        List<ExamInfo> list = new ArrayList<>();
        list.add(new ExamInfo("0", "1", "2"));
        list.add(new ExamInfo("0", "1", "2"));
        model.addAttribute("examList", list);
        return "admin";
    }

    @RequestMapping("teacher.do")
    public String teacher(Model model){

        return "teacher";
    }

    @RequestMapping("enter_subjective_questions.do")
    public String enter_subjective_questions(Model model,
                                             @RequestParam(name = "question", defaultValue = "")String question,
                                             @RequestParam(name = "answer", defaultValue = "")String answer){
        if(question.length() >= 1 && answer.length() >= 1) {
            userService.addSubQuestion(question, answer);
            model.addAttribute("question", "");
            model.addAttribute("answer", "");
        }
        return "enter_subjective_questions";
    }

    @RequestMapping("enter_objective_questions.do")
    public String enter_objective_questions(Model model,
                                             @RequestParam(name = "question", defaultValue = "")String question,
                                            @RequestParam(name = "option1", defaultValue = "")String option1,
                                            @RequestParam(name = "option2", defaultValue = "")String option2,
                                            @RequestParam(name = "option3", defaultValue = "")String option3,
                                            @RequestParam(name = "option4", defaultValue = "")String option4,
                                             @RequestParam(name = "answer", defaultValue = "")String answer){
        if(question.length() >= 1 && answer.length() >= 1) {
            String options = option1 + "@@" + option2 + "@@" + option3 + "@@" + option4;
            //System.out.println(options);
            userService.addOptQuestion(question, options, answer);
        }
        return "enter_objective_questions";
    }

    @RequestMapping("viewBankAndSelectQuestion.do")
    public String viewBankAndSelectQuestion(Model model,
                                            @RequestParam(name = "examId", defaultValue = "")String examId,
                                            @RequestParam(name = "newSub", defaultValue = "")String newSub) {
        List<SubjectiveQuestion> subSrclist  = userService.getSubQuestions();
        model.addAttribute("subQuestionList", subSrclist);


        if(examId.length() >= 1) {
            List<ExamPaper> subSequence  = userService.getExamSub(examId);
            if(subSequence.isEmpty()) {
                List<SubjectiveQuestion> examSublist = new ArrayList<>();
                model.addAttribute("examSublist", examSublist);
            } else {
//                System.out.println(subSequence.get(0).getSubjective_IDs());
                if(newSub.length() >= 1) { //插入新的主观题;
                    subSequence.get(0).setSubjective_IDs(subSequence.get(0).getSubjective_IDs() + "@@" + newSub);
//                    System.out.println("添加了新题");
                }
//                System.out.println(subSequence.get(0).getSubjective_IDs());
                List<Integer> Ids = new ArrayList<>();
                String[] tokens = subSequence.get(0).getSubjective_IDs().split("@@");
                for (String token : tokens) {
                    try {
//                        System.out.println(token);
                        int number = Integer.parseInt(token.trim());
                        Ids.add(number);
//                        System.out.println(number);
                    } catch (NumberFormatException e) {
                        System.err.println("无法解析为数字: " + token); // 处理非数字的情况，可以选择忽略或进行其他处理
                    }
                }
                List<SubjectiveQuestion> examSublist = new ArrayList<>();
                for(int id: Ids) {
                    List<SubjectiveQuestion> examSub  = userService.getSubById(id);
                    examSublist.add(examSub.get(0));
                }
                model.addAttribute("examId", examId);
                model.addAttribute("examSublist", examSublist);
                if(newSub.length() >= 1) {
                    userService.changeSubofExam(examId, subSequence.get(0).getSubjective_IDs());
                }
            }
        }
        return "viewBankAndSelectQuestion";
    }

    @RequestMapping("grade_subjective.do")
    public String grade_subjective(Model model,
                                   @RequestParam(name = "display", defaultValue = "none")String display,
                                   @RequestParam(name = "scores", defaultValue = "-")String scores,
                                   @RequestParam(name = "exam_id", defaultValue = "")String exam_id,
                                   @RequestParam(name = "student_id", defaultValue = "")String student_id) {

        if(exam_id.length() >= 1 && student_id.length() >= 1) {
            List<ExamPaper> subSequence  = userService.getExamSub(exam_id);
            if(subSequence.isEmpty()) {
                List<SubjectiveQuestion> examSublist = new ArrayList<>();
                model.addAttribute("examSublist", examSublist);
            } else {
                List<Integer> Ids = new ArrayList<>();
                String[] tokens = subSequence.get(0).getSubjective_IDs().split("@@");
                for (String token : tokens) {
                    try {
                        int number = Integer.parseInt(token.trim());
                        Ids.add(number);
                    } catch (NumberFormatException e) {
                        System.err.println("无法解析为数字: " + token); // 处理非数字的情况，可以选择忽略或进行其他处理
                    }
                }
                List<SubjectiveQuestion> subAnswerList = new ArrayList<>();
                for(int id: Ids) {
                    List<SubjectiveQuestion> examSub  = userService.getSubById(id);
                    subAnswerList.add(examSub.get(0));
                }
                model.addAttribute("subAnswerList", subAnswerList);
            }
        }
        model.addAttribute("subScores", scores); //统计主观题总分;
        model.addAttribute("display", display);
        return "grade_subjective";
    }

    @RequestMapping("test.do")
    public String test(Model model,
                       @RequestParam(name = "display", defaultValue = "none")String display,
                       @RequestParam(name = "examId", defaultValue = "")String examId,
                       @RequestParam(name = "subAnswer", defaultValue = "")String subAnswer,
                       @RequestParam(name = "subId", defaultValue = "")String subId){

        model.addAttribute("display", display);
        model.addAttribute("examId", examId);
        return "test";
    }

}
