package com.ljx.HomeworkSystem.repository;

import com.ljx.HomeworkSystem.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserRepository {
    List<User> login(User user);

    int register(User user);

    List<User> isUser(User user);
}
