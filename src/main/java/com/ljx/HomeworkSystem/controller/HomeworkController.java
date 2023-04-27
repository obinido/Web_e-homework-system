package com.ljx.HomeworkSystem.controller;

import com.ljx.HomeworkSystem.entity.Image;
import com.ljx.HomeworkSystem.entity.Homework;
import com.ljx.HomeworkSystem.entity.Subject;
import com.ljx.HomeworkSystem.entity.User;
import com.ljx.HomeworkSystem.service.HomeworkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/homework")
public class HomeworkController extends AuthorityController {
    @Autowired
    private HomeworkService homeworkService;

    @RequestMapping("/list")
    public String homeworkList(HttpSession session, Model model) {
        return homeworkService.listSubject(session, model);
    }

    @RequestMapping("/subject")
    public String subjectDetail(HttpSession session, Model model, Integer id) {
        return homeworkService.listHomework(session, model, id);
    }

    @RequestMapping("/subject/toAdd")
    public String toAddSubject(@ModelAttribute("subject") Subject subject, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user.getUsertype() == 1) {
            model.addAttribute("errorMessage", "您没有权限！");
            return "errorPage";
        }
        model.addAttribute("user", user);
        return "addSubject";
    }

    @RequestMapping("/detail/toAdd")
    public String toAddHomework(@ModelAttribute("homework") Homework homework, HttpSession session, Model model, Integer id) {
        User user = (User) session.getAttribute("user");
        if (user.getUsertype() == 1) {
            model.addAttribute("errorMessage", "您没有权限！");
            return "errorPage";
        }
        return homeworkService.toAddHomework(id, session, model, homework);
    }

    @RequestMapping("/subject/toModify")
    public String toModifySubject(Integer id, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user.getUsertype() == 1) {
            model.addAttribute("errorMessage", "您没有权限！");
            return "errorPage";
        }
        model.addAttribute("user", user);
        return homeworkService.toModifySubject(id, session, model);
    }

    @RequestMapping("/detail/toModify")
    public String toModifyHomework(Integer id, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user.getUsertype() == 1) {
            model.addAttribute("errorMessage", "您没有权限！");
            return "errorPage";
        }
        model.addAttribute("user", user);
        return homeworkService.toModifyHomework(id, session, model);
    }

    @RequestMapping("/subject/add")
    public String addSubject(@ModelAttribute("subject") @Validated Subject subject, BindingResult rs, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user.getUsertype() == 1) {
            model.addAttribute("errorMessage", "您没有权限！");
            return "errorPage";
        }
        if (rs.hasErrors()) // 验证失败
        {
            return "addSubject";
        }
        return homeworkService.addSubject(subject, session, model);
    }

    @RequestMapping("/detail/add")
    public String addHomework(@ModelAttribute("homework") @Validated Homework homework, BindingResult rs, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user.getUsertype() == 1) {
            model.addAttribute("errorMessage", "您没有权限！");
            return "errorPage";
        }
        if (rs.hasErrors()) // 验证失败
        {
            return "addHomework";
        }
        return homeworkService.addHomework(homework, session, model);
    }

    @RequestMapping("/subject/modify")
    public String modifySubject(@ModelAttribute("originSubject") @Validated Subject subject, BindingResult rs, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user.getUsertype() == 1) {
            model.addAttribute("errorMessage", "您没有权限！");
            return "errorPage";
        }
        if (rs.hasErrors()) // 验证失败
        {
            return this.toModifySubject(subject.getId(), session, model);
        }
        return homeworkService.modifySubject(subject, session, model);
    }

    @RequestMapping("/detail/modify")
    public String modifyHomework(@ModelAttribute("originHomework") @Validated Homework homework, BindingResult rs, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user.getUsertype() == 1) {
            model.addAttribute("errorMessage", "您没有权限！");
            return "errorPage";
        }
        return homeworkService.modifyHomework(homework, session, model);
    }

    @RequestMapping("/detail")
    public String homeworkDetail(HttpSession session, Model model, Integer id) {
        return homeworkService.showHomeworkDetail(session, model, id);
    }

    @RequestMapping("/toAddImage")
    public String toAddImage(@ModelAttribute("image") Image image, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user.getUsertype() == 1) {
            model.addAttribute("errorMessage", "您没有权限！");
            return "errorPage";
        }
        return homeworkService.toAddImage(session, model);
    }

    @RequestMapping("/addImage")
    public String addImage(@ModelAttribute("image") Image image, HttpSession session, Model model, HttpServletRequest request) {
        User user = (User) session.getAttribute("user");
        if (user.getUsertype() == 1) {
            model.addAttribute("errorMessage", "您没有权限！");
            return "errorPage";
        }
        return homeworkService.addImage(image, session, model, request);
    }

    @RequestMapping("/deleteImage")
    public String deleteImage(Integer id, HttpSession session, Model model, HttpServletRequest request) {
        User user = (User) session.getAttribute("user");
        if (user.getUsertype() == 1) {
            model.addAttribute("errorMessage", "您没有权限！");
            return "errorPage";
        }
        return homeworkService.deleteImage(id, session, model, request);
    }

    @RequestMapping("/count")
    public String homeworkCount(HttpSession session, Model model, Integer id) {
        User user = (User) session.getAttribute("user");
        if (user.getUsertype() == 1) {
            model.addAttribute("errorMessage", "您没有权限！");
            return "errorPage";
        }
        return homeworkService.showCount(id, session, model);
    }
}
