package com.ljx.HomeworkSystem.repository;

import com.ljx.HomeworkSystem.entity.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.sql.Timestamp;
import java.util.List;

@Mapper
public interface HomeworkRepository {
    List<Subject> listSubject(User user);

    List<HomeworkCount> listHomeworkCount(HomeworkCount HomeworkCount);

    Subject selectSubject(Integer id);

    Subject selectSubjectByName(String name);

    List<Homework> listHomework(Integer id);

    Homework selectHomework(Integer id);

    Homework selectHomeworkByName(Integer subject_id, String name);

    List<Subject> isSubject(String name);

    List<Subject> isHomework(Integer subjectID, String title);

    int addSubject(Subject subject);

    int addHomework(Homework homework);

    int modifySubject(Subject subject);

    int modifyHomework(Homework homework);

//    int addDependency(Integer id, Integer dep_id);

//    void dropDependency(Integer id);

    List<Image> listImageOfUser(User user);

//    int addHomeworkCount(HomeworkCount count);
//
//    int updateSubmit_date(Timestamp date);
//
//    int updateHomeworkProgress();
//
//    int updateHomeworkScore();

    int addMap(Mapping mapping);

    int addImage(@Param("user") User user, @Param("image") Image image);

    int deleteImage(Integer id);

    Image selectImage(Integer id);

    List<HomeworkCount> listCount(Integer homework_id);
}
