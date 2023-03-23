package com.ljx.HomeworkSystem.controller;

import com.ljx.HomeworkSystem.NoLoginException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpSession;

@Controller
public class AuthorityController {
    /**
     * 登录权限控制，处理方法执行前执行该方法
     */
    @ModelAttribute
    public void isLogin(HttpSession session) throws NoLoginException {
        if (session.getAttribute("user") == null) {
            throw new NoLoginException("用户未登录！");
        }
    }
}
