package com.ljx.HomeworkSystem.repository;

import com.ljx.HomeworkSystem.entity.*;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MessageRepository {

    List<Message> listMessage(User user);

    Message findById(int id);

    void modifyMessage(Message message);
}
