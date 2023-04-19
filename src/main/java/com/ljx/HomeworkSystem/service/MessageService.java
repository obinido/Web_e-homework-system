package com.ljx.HomeworkSystem.service;

import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface MessageService {
    String listMessage(HttpSession session, Model model);
    String markAsRead(HttpSession session, Model model, int messageId);
}
