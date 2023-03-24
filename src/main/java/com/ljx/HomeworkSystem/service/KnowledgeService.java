package com.ljx.HomeworkSystem.service;

import com.ljx.HomeworkSystem.entity.Image;
import com.ljx.HomeworkSystem.entity.Knowledge;
import com.ljx.HomeworkSystem.entity.Mapping;
import com.ljx.HomeworkSystem.entity.Subject;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface KnowledgeService {
    String listSubject(HttpSession session, Model model);

    String listKnowledge(HttpSession session, Model model, Integer id);

    String showKnowledgeDetail(HttpSession session, Model model, Integer id);

    String addSubject(Subject subject, HttpSession session, Model model);

    String addKnowledge(Knowledge knowledge, HttpSession session, Model model);

    String toAddKnowledge(Integer id, HttpSession session, Model model, Knowledge knowledge);

    String toAddMap(HttpSession session, Model model);

    String addMap(Mapping mapping, HttpSession session, Model model);

    String toModifySubject(Integer id, HttpSession session, Model model);

    String toModifyKnowledge(Integer id, HttpSession session, Model model);

    String modifySubject(Subject subject, HttpSession session, Model model);

    String modifyKnowledge(Knowledge knowledge, HttpSession session, Model model);

    String toAddImage(HttpSession session, Model model);

    String addImage(Image image, HttpSession session, Model model, HttpServletRequest request);

    String deleteImage(Integer id, HttpSession session, Model model, HttpServletRequest request);
}
