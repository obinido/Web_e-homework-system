package com.ljx.HomeworkSystem;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ResourceConfig implements WebMvcConfigurer {
    /* 资源访问路径隐射 */
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String path = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images\\";
        registry.addResourceHandler("/images/**").addResourceLocations("file:" + path);
    }

}