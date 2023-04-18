package com.ljx.HomeworkSystem.controller;

import com.ljx.HomeworkSystem.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

}
