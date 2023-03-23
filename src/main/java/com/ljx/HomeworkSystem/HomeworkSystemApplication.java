package com.ljx.HomeworkSystem;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
// 配置扫描MyBatis接口的包路径
@MapperScan(basePackages = {"com.ljx.HomeworkSystem.repository"})
public class HomeworkSystemApplication {
    public static void main(String[] args) {
        SpringApplication.run(HomeworkSystemApplication.class, args);
    }
}
