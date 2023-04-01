package com.ljx.HomeworkSystem.service;

import com.ljx.HomeworkSystem.auxiliary.Auxiliary;
import com.ljx.HomeworkSystem.entity.*;
import com.ljx.HomeworkSystem.repository.HomeworkRepository;
import com.ljx.HomeworkSystem.repository.RecommendRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class HomeworkServiceImpl implements HomeworkService {
    @Autowired
    private HomeworkRepository homeworkRepository;
    @Autowired
    private RecommendRepository recommendRepository;

    @Override
    public String listSubject(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", session.getAttribute("user"));
        List<Subject> subjects = homeworkRepository.listSubject(user);
        for (Subject subject : subjects) {
            subject.setIntroduction(Auxiliary.modifyContent(subject.getIntroduction()));
        }
        model.addAttribute("user", session.getAttribute("user"));
        model.addAttribute("subjects", subjects);
        return "index";
    }

    @Override
    public String listHomework(HttpSession session, Model model, Integer id) {
        Subject subject = homeworkRepository.selectSubject(id);
        // List<Knowledge> homeworkList = homeworkRepository.listKnowledge(id);
        model.addAttribute("user", session.getAttribute("user"));
        model.addAttribute("subject", subject);
        // model.addAttribute("homeworkList", homeworkList);
        // model.addAttribute("currentKnowledgeID", -1);
        model.addAttribute("currentTitle", subject.getName());
        model.addAttribute("content", Auxiliary.modifyContent(subject.getIntroduction()));
        return "homework";
    }

    @Override
    public String showHomeworkDetail(HttpSession session, Model model, Integer id) {
        Homework homework = homeworkRepository.selectHomework(id);
        Subject subject = homeworkRepository.selectSubject(homework.getSubject_id());
        // List<Knowledge> homeworkList = homeworkRepository.listKnowledge(homework.getSubject_id());
        model.addAttribute("user", session.getAttribute("user"));
        model.addAttribute("subject", subject);
        // model.addAttribute("homeworkList", homeworkList);
        // model.addAttribute("currentKnowledgeID", id);
        model.addAttribute("currentTitle", homework.getTitle());
        model.addAttribute("content", Auxiliary.modifyContent(homework.getContent()));
        return "homework";
    }

    @Override
    public String toAddHomework(Integer id, HttpSession session, Model model, Homework homework) {
        Subject subject = homeworkRepository.selectSubject(id);
        List<Homework> homeworkList = homeworkRepository.listHomework(id);
        homework.setSubject_name(subject.getName());
        homework.setSubject_id(subject.getId());
        model.addAttribute("user", session.getAttribute("user"));
        model.addAttribute("homeworkList", homeworkList);
        model.addAttribute("subject", subject);
        return "addHomework";
    }

    @Override
    public String addSubject(Subject subject, HttpSession session, Model model) {
        if (homeworkRepository.isSubject(subject.getName()).size() > 0) {
            model.addAttribute("errorMessage", "课程已存在，请前往相关课程页面查看！");
            model.addAttribute("user", session.getAttribute("user"));
            return "addSubject";
        } else {
            homeworkRepository.addSubject(subject);
        }
        return "redirect:/homework/list";
    }

    @Override
    public String addHomework(Homework homework, HttpSession session, Model model) {
        Subject subject = homeworkRepository.selectSubjectByName(homework.getSubject_name());
        if (subject == null) {
            model.addAttribute("errorMessage", "课程不存在，请前往课程页面确认！");
            model.addAttribute("user", session.getAttribute("user"));
            return "addHomework";
        } else if (homeworkRepository.isHomework(subject.getId(), homework.getTitle()).size() > 0) {
            model.addAttribute("errorMessage", "作业已存在，请前往相关课程页面查看！");
            model.addAttribute("user", session.getAttribute("user"));
            return "addKnowledge";
        } else {
            homework.setSubject_id(subject.getId());
            homeworkRepository.addHomework(homework);
            Homework addedHomework = homeworkRepository.selectHomeworkByName(homework.getSubject_id(), homework.getTitle());
//            for (Integer dependent_id : homework.getDependency()) {
//                if (dependent_id != -1)
//                    homeworkRepository.addDependency(addedHomework.getId(), dependent_id);
//            }
        }
        return ("redirect:/subject/progress?id=" + (subject.getId()));
    }

    @Override
    public String toModifySubject(Integer id, HttpSession session, Model model) {
        Subject subject = homeworkRepository.selectSubject(id);
        // List<Knowledge> homeworkList = homeworkRepository.listKnowledge(id);
        model.addAttribute("user", session.getAttribute("user"));
        // model.addAttribute("homeworkList", homeworkList);
        // model.addAttribute("currentKnowledgeID", -1);
        model.addAttribute("originSubject", subject);
        return "modifySubject";
    }

    @Override
    public String toModifyHomework(Integer id, HttpSession session, Model model) {
        Homework homework = homeworkRepository.selectHomework(id);
        Subject subject = homeworkRepository.selectSubject(homework.getSubject_id());
        List<Homework> homeworkList = homeworkRepository.listHomework(homework.getSubject_id());
        model.addAttribute("user", session.getAttribute("user"));
        model.addAttribute("homeworkList", homeworkList);
        // model.addAttribute("currentKnowledgeID", id);
//        List<Integer> dependency = recommendRepository.getDependencies(homework);
//        homework.setDependency(dependency);
        model.addAttribute("originKnowledge", homework);
        model.addAttribute("originSubject", subject);
        return "modifyKnowledge";
    }

    @Override
    public String modifySubject(Subject subject, HttpSession session, Model model) {
        homeworkRepository.modifySubject(subject);
        return ("redirect:/homework/subject?id=" + (subject.getId()));
    }

    @Override
    public String modifyHomework(Homework homework, HttpSession session, Model model) {
        homeworkRepository.modifyHomework(homework);
//        homeworkRepository.dropDependency(homework.getId());
//        for (Integer dependent_id : homework.getDependency()) {
//            if (dependent_id != -1)
//                homeworkRepository.addDependency(homework.getId(), dependent_id);
//        }
        return ("redirect:/homework/detail?id=" + (homework.getId()));
    }

    @Override
    public String toAddImage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", user);
        model.addAttribute("imageList", homeworkRepository.listImageOfUser(user));
        return "image";
    }

    @Override
    public String addImage(Image image, HttpSession session, Model model, HttpServletRequest request) {
        User user = (User) session.getAttribute("user");
        MultipartFile myfile = image.getAddress();
        // 如果选择了上传文件，将文件上传到指定的目录images
        if (!myfile.isEmpty()) {
            // 上传文件路径（生产环境）
            // String path = request.getServletContext().getRealPath("/images/");
            // 获得上传文件原名
            // 上传文件路径（开发环境）
            String path = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images\\";
            // 获得上传文件原名
            String fileName = myfile.getOriginalFilename();
            // 对文件重命名
            String fileNewName = Auxiliary.getNewFileName(fileName);
            File filePath = new File(path + File.separator + fileNewName);
            // 如果文件目录不存在，创建目录
            if (!filePath.getParentFile().exists()) {
                filePath.getParentFile().mkdirs();
            }
            // 将上传文件保存到一个目标文件中
            try {
                myfile.transferTo(filePath);
            } catch (IOException e) {
                e.printStackTrace();
            }
            image.setNew_name(fileNewName);
            homeworkRepository.addImage(user, image);
        }
        return "redirect:/homework/toAddImage";
    }

    @Override
    public String deleteImage(Integer id, HttpSession session, Model model, HttpServletRequest request) {
        String path = request.getServletContext().getRealPath("/images/");
        Image image = homeworkRepository.selectImage(id);
        File filePath = new File(path + File.separator + image.getNew_name());
        filePath.delete();
        homeworkRepository.deleteImage(id);
        return "redirect:/homework/toAddImage";
    }
}
