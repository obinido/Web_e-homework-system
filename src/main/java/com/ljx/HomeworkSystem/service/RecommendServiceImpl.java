package com.ljx.HomeworkSystem.service;

import com.ljx.HomeworkSystem.auxiliary.Auxiliary;
import com.ljx.HomeworkSystem.entity.*;
import com.ljx.HomeworkSystem.repository.ExerciseRepository;
import com.ljx.HomeworkSystem.repository.HomeworkRepository;
import com.ljx.HomeworkSystem.repository.KnowledgeRepository;
import com.ljx.HomeworkSystem.repository.RecommendRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import java.time.Instant;
import java.time.Duration;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

@Service
public class RecommendServiceImpl implements RecommendService {
    @Autowired
    private KnowledgeRepository knowledgeRepository;
    @Autowired
    private HomeworkRepository homeworkRepository;
    @Autowired
    private ExerciseRepository exerciseRepository;
    @Autowired
    private RecommendRepository recommendRepository;


    @Override
    public String listLearningSubject(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", session.getAttribute("user"));
        List<Subject> learningSubjects = recommendRepository.selectSubjectByUser(user);
        for (Subject subject : learningSubjects) {
            Integer count = recommendRepository.getSubjectNum(subject);
            int progress;
            if (count == 0) {
                progress = 100;
            } else {
                Integer sum;
                if (recommendRepository.getSubjectProgress(user, subject) == null) {
                    sum = 0;
                } else {
                    sum = recommendRepository.getSubjectProgress(user, subject);
                }
                progress = (int) (sum * 1.0 / count);
            }
            subject.setProgress(progress);
        }
        model.addAttribute("subjects", learningSubjects);
        return "homepage";
    }

    @Override
    public String knowledgeProgress(HttpSession session, Model model, Integer id) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", session.getAttribute("user"));
        Subject subject = knowledgeRepository.selectSubject(id);
        List<Knowledge> knowledgeList = knowledgeRepository.listKnowledge(id);
        for (Knowledge knowledge : knowledgeList) {
            Integer count = recommendRepository.getKnowledgeNum(knowledge);
            int progress;
            if (count == 0) {
                progress = 100;
            } else {
                Integer sum;
                if (recommendRepository.getKnowledgeProgress(user, knowledge) == null) {
                    sum = 0;
                } else {
                    sum = recommendRepository.getKnowledgeProgress(user, knowledge);
                }
                progress = (int) (sum * 1.0 / count);
            }
            knowledge.setProgress(progress);
        }
        model.addAttribute("subject", subject);
        model.addAttribute("knowledgeList", knowledgeList);
        // model.addAttribute("currentKnowledgeID", -1);
        model.addAttribute("currentTitle", subject.getName());
        return "subjectProgress";
    }

    @Override
//    public String homeworkProgress(HttpSession session, Model model, Integer id) {
//        User user = (User) session.getAttribute("user");
//        model.addAttribute("user", session.getAttribute("user"));
//        Subject subject = homeworkRepository.selectSubject(id);
//        List<Homework> homeworkList = homeworkRepository.listHomework(id);
//        for (Homework homework : homeworkList) {
//            Integer count = recommendRepository.getHomeworkNum(homework);
//            int progress;
//            if (count == 0) {
//                progress = 100;
//            } else {
//                Integer sum;
//                if (recommendRepository.getHomeworkProgress(user, homework) == null) {
//                    sum = 0;
//                } else {
//                    sum = recommendRepository.getHomeworkProgress(user, homework);
//                }
//                progress = (int) (sum * 1.0 / count);
//            }
//            homework.setProgress(progress);
//        }
//        model.addAttribute("subject", subject);
//        model.addAttribute("homeworkList", homeworkList);
//        // model.addAttribute("currentKnowledgeID", -1);
//        model.addAttribute("currentTitle", subject.getName());
//        return "homeworkProgress";
//    }

    public String homeworkProgress(HttpSession session, Model model, Integer id) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", session.getAttribute("user"));
        Subject subject = homeworkRepository.selectSubject(id);
        List<Homework> homeworkList = homeworkRepository.listHomework(id);
        for (Homework homework : homeworkList) {
//            Integer count = recommendRepository.getHomeworkDeadline(homework);
            Timestamp create_time=homework.getCreate_time();
            Timestamp deadline=homework.getDeadline();
            Instant ctins = create_time.toInstant();
            Instant ddlins = deadline.toInstant();
            Instant now = Instant.now();
            Duration pt=Duration.between(ctins,ddlins);//初始剩余时间
            Duration rmt=Duration.between(now,ddlins);//剩余时间
            int progress=(int)(100*rmt.getSeconds()/pt.getSeconds());
//            if (count == 0) {
//                progress = 100;
//            } else {
//                Integer sum;
//                if (recommendRepository.getHomeworkProgress(user, homework) == null) {
//                    sum = 0;
//                } else {
//                    sum = recommendRepository.getHomeworkProgress(user, homework);
//                }
//                progress = (int) (sum * 1.0 / count);
//            }
            homework.setProgress(progress);
            homework.setRmt(rmt.toMillis());
        }
        model.addAttribute("subject", subject);
        model.addAttribute("homeworkList", homeworkList);
        // model.addAttribute("currentKnowledgeID", -1);
        model.addAttribute("currentTitle", subject.getName());
        return "homeworkProgress";
    }



    @Override
    public String exerciseRecommend(HttpSession session, Model model, Integer id) {
        Integer recommendNum = 15;
        double progressLimit = 75;
        Integer scoreLimit = 85;
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", session.getAttribute("user"));
        Subject subject = knowledgeRepository.selectSubject(id);
        List<Exercise> exerciseList = new LinkedList<Exercise>();
        List<Knowledge> knowledgeList = knowledgeRepository.listKnowledge(id);
        for (Knowledge knowledge : knowledgeList) {
            Integer count = recommendRepository.getKnowledgeNum(knowledge);
            int progress;
            if (count == 0) {
                progress = 100;
            } else {
                Integer sum;
                if (recommendRepository.getKnowledgeProgress(user, knowledge) == null) {
                    sum = 0;
                } else {
                    sum = recommendRepository.getKnowledgeProgress(user, knowledge);
                }
                progress = (int) (sum * 1.0 / count);
            }
            knowledge.setProgress(progress);

            if (knowledge.getProgress() == 0) {
                List<Integer> dependencies = recommendRepository.getDependencies(knowledge);
                boolean isDependent = false;
                for (Integer knowledge_id : dependencies) {
                    Knowledge dependentKnowledge = knowledgeRepository.selectKnowledge(knowledge_id);
                    Integer countK = recommendRepository.getKnowledgeNum(dependentKnowledge);
                    double progressK;
                    if (countK == 0) {
                        progressK = 100;
                        continue;
                    } else {
                        Integer sum;
                        if (recommendRepository.getKnowledgeProgress(user, dependentKnowledge) == null) {
                            sum = 0;
                            isDependent = true;
                            break;
                        } else {
                            sum = recommendRepository.getKnowledgeProgress(user, dependentKnowledge);
                        }
                        progressK = sum * 1.0 / countK;
                    }
                    // System.out.println(progressK);
                    isDependent = (isDependent || (progressK < progressLimit));
                }
                knowledge.setDependent(isDependent);
                if (!isDependent) {
                    exerciseList.addAll(exerciseRepository.selectExercise(knowledge.getId()));
                }
            } else {
                exerciseList.addAll(recommendRepository.getRecommendedExercise(user, knowledge, scoreLimit));
            }
        }
        int deleteNum = exerciseList.size() - recommendNum;
        for (int i = 0; i < deleteNum; i++) {
            exerciseList.remove(ThreadLocalRandom.current().nextInt(0, exerciseList.size()));
        }
        for (Exercise exercise : exerciseList) {
            if (exercise.getType() == 1) {
                Map<String, Object> result = Auxiliary.modifyRatioExercise(exercise.getContent());
                String modifiedContent = (String) result.get("modified_str");
                Integer opt_num = (Integer) result.get("opt_num");
                exercise.setContent(modifiedContent);
                exercise.setOptNum(opt_num);
            }
            exercise.setContent(Auxiliary.modifyContent(exercise.getContent()));
            exercise.setAnswer(Auxiliary.modifyContent(exercise.getAnswer()));
            exercise.setKnowledge_name(knowledgeRepository.selectKnowledge(exercise.getKnowledge_id()).getTitle());
        }
        model.addAttribute("exercises", exerciseList);
        model.addAttribute("subject", subject);
        // model.addAttribute("knowledgeList", knowledgeList);
        // model.addAttribute("currentKnowledgeID", -1);
        model.addAttribute("currentTitle", subject.getName());
        return "exercise";
    }
}
