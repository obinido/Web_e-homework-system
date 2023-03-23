package com.ljx.HomeworkSystem.repository;

import com.ljx.HomeworkSystem.entity.Answer;
import com.ljx.HomeworkSystem.entity.Exercise;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ExerciseRepository {

    Exercise selectExerciseByID(Integer id);

    List<Exercise> selectExercise(Integer knowledge_id);

    int addExercise(Exercise exercise);

    int modifyExercise(Exercise exercise);

    int recordSolutionHistory(Answer answer);

    List<Answer> selectAnswerByUser(@Param("email") String email, @Param("id") Integer id);

    List<Answer> selectAnswerByUserAndSubject(@Param("email") String email, @Param("id") Integer id);

    Answer selectAnswerByID(Integer id);

    List<Answer> selectAnswerByExerciseID(Integer id);

    int modifyAnswer(Answer answer);
}
