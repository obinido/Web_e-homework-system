package com.ljx.HomeworkSystem.repository;

import com.ljx.HomeworkSystem.entity.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RecommendRepository {
    List<Subject> selectSubjectByUser(User user);

    Integer getSubjectProgress(@Param("user") User user, @Param("subject") Subject subject);

    Integer getSubjectNum(@Param("subject") Subject subject);

    Integer getKnowledgeProgress(@Param("user") User user, @Param("knowledge") Knowledge knowledge);

    Integer getHomeworkProgress(@Param("user") User user, @Param("homework") Homework homework);

    Integer getHomeworkDeadline(@Param("user") User user, @Param("homework") Homework homework);

    Integer getKnowledgeNum(@Param("knowledge") Knowledge knowledge);

    Integer getHomeworkNum(@Param("homework") Homework homework);

    List<Integer> getDependencies(Knowledge knowledge);

//    List<Integer> getDependencies(Homework homework);

    List<Exercise> getRecommendedExercise(@Param("user") User user, @Param("knowledge") Knowledge knowledge, @Param("limit") Integer limit);

}
