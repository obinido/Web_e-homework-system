package com.ljx.HomeworkSystem.service;

import com.ljx.HomeworkSystem.entity.User;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface UserService {
    String login(User user, HttpSession session, Model model);

    String register(User user, HttpSession session, Model model);

    String isUser(User user);
}
