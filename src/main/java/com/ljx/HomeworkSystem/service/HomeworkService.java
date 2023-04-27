package com.ljx.HomeworkSystem.service;

import com.ljx.HomeworkSystem.entity.Homework;
import com.ljx.HomeworkSystem.entity.Image;
import com.ljx.HomeworkSystem.entity.Subject;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface HomeworkService {
    String listSubject(HttpSession session, Model model);

    String listHomework(HttpSession session, Model model, Integer id);

    String showHomeworkDetail(HttpSession session, Model model, Integer id);

    String addSubject(Subject subject, HttpSession session, Model model);

    String addHomework(Homework homework, HttpSession session, Model model);

    String toAddHomework(Integer id, HttpSession session, Model model, Homework homework);

    String toModifySubject(Integer id, HttpSession session, Model model);

    String toModifyHomework(Integer id, HttpSession session, Model model);

    String modifySubject(Subject subject, HttpSession session, Model model);

    String modifyHomework(Homework homework, HttpSession session, Model model);

    String toAddImage(HttpSession session, Model model);

    String addImage(Image image, HttpSession session, Model model, HttpServletRequest request);

    String deleteImage(Integer id, HttpSession session, Model model, HttpServletRequest request);

    String showCount(Integer id, HttpSession session, Model model);
}
