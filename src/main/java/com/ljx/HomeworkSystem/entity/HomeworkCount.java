package com.ljx.HomeworkSystem.entity;

import java.sql.Timestamp;

public class HomeworkCount {
    private int id;
    private int homework_id;
    private String homework_title;
    private String user_email;
    private String user_name;
    private Timestamp submit_time;
    private int homework_score = -1;
    private int homework_progress = -1;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getHomework_id() {
        return homework_id;
    }

    public void setHomework_id(int homework_id) {
        this.homework_id = homework_id;
    }

    public String getHomework_title() {
        return homework_title;
    }

    public void setHomework_title(String homework_title) {
        this.homework_title = homework_title;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public Timestamp getSubmit_time() {
        return submit_time;
    }

    public void setSubmit_time(Timestamp submit_time) {
        this.submit_time = submit_time;
    }

    public int getHomework_score() {
        return homework_score;
    }

    public void setHomework_score(int homework_score) {
        this.homework_score = homework_score;
    }

    public int getHomework_progress() {
        return homework_progress;
    }

    public void setHomework_progress(int homework_progress) {
        this.homework_progress = homework_progress;
    }
}
