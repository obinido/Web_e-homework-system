package com.ljx.HomeworkSystem.service;

import com.ljx.HomeworkSystem.entity.Image;
import com.ljx.HomeworkSystem.entity.Knowledge;
import com.ljx.HomeworkSystem.entity.Mapping;
import com.ljx.HomeworkSystem.entity.Subject;
import com.ljx.HomeworkSystem.entity.Message;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface MessageService {
    String listMessage(HttpSession session, Model model);

}
