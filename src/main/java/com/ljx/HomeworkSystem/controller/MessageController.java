package com.ljx.HomeworkSystem.controller;

import com.ljx.HomeworkSystem.entity.Knowledge;
import com.ljx.HomeworkSystem.entity.User;
import com.ljx.HomeworkSystem.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/message")
public class MessageController {
    @Autowired
    private MessageService messageService;

    @RequestMapping("/list")
    public String messageList(HttpSession session, Model model) {
        return messageService.listMessage(session, model);
    }

    @RequestMapping("/toModify")
    public String toModifyExercise(Integer id, HttpSession session, Model model) {
        return messageService.markAsRead(session, model, id);
    }
}
