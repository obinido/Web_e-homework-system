package com.ljx.HomeworkSystem.service;

import com.ljx.HomeworkSystem.entity.Answer;
import com.ljx.HomeworkSystem.entity.Exercise;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface ExerciseService {
    String showExerciseList(HttpSession session, Model model, Integer knowledge_id);

    String showExercise(HttpSession session, Model model, Integer homework_id);

    String toAddExercise(Exercise exercise, HttpSession session, Model model, Integer id);

    String addExercise(Exercise exercise, HttpSession session, Model model);

    String toAddhwExercise(Exercise exercise, HttpSession session, Model model, Integer id);

    String addhwExercise(Exercise exercise, HttpSession session, Model model);

    String toModifyExercise(Integer id, HttpSession session, Model model);

    String modifyExercise(Exercise exercise, HttpSession session, Model model);

    String tryToSolveExercise(Answer answer, HttpSession session, Model model);

    String answerConclude(Integer id, HttpSession session, Model model);

    String subjectAnswerConclude(Integer id, HttpSession session, Model model);

    String reviewConclude(Integer id, HttpSession session, Model model);

    String toReviewAnswer(Integer id, HttpSession session, Model model);

    String reviewAnswer(Answer answer, HttpSession session, Model model);

    String answerDetail(Integer id, HttpSession session, Model model);
}
