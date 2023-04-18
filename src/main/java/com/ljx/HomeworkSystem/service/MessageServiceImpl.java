package com.ljx.HomeworkSystem.service;

import com.ljx.HomeworkSystem.auxiliary.Auxiliary;
import com.ljx.HomeworkSystem.entity.Message;
import com.ljx.HomeworkSystem.entity.User;
import com.ljx.HomeworkSystem.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageRepository messageRepository;

    @Override
    public String listMessage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", session.getAttribute("user"));
        List<Message> messages = messageRepository.listMessage(user);
        for (Message message : messages) {
            message.setContent(Auxiliary.modifyContent(message.getContent()));
        }
        model.addAttribute("messages", messages);
        return "message";
    }
}
