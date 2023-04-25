package com.ljx.HomeworkSystem.entity;

import javax.validation.constraints.NotBlank;
import java.sql.Timestamp;


public class Homework {
    private int id;
    private int subject_id;
    private String subject_name;
    @NotBlank
    private String title;
    private String content;
    private Timestamp create_time;
    private Timestamp deadline;
    private String create_time_string;
    private String deadline_string;
    private long rmt;


    private double progress;
    private boolean isDependent;

    public boolean isDependent() {
        return isDependent;
    }

    public long getRmt() {
        return rmt;
    }

    public void setRmt(long rmt) {
        this.rmt = rmt;
    }
    public void setDependent(boolean dependent) {
        isDependent = dependent;
    }

    public Timestamp getDeadline() {
        return deadline;
    }

    public void setDeadline(Timestamp deadline) {
        this.deadline = deadline;
    }

    public double getProgress() {
        return progress;
    }

    public void setProgress(double progress) {
        this.progress = progress;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSubject_name() {
        return subject_name;
    }

    public void setSubject_name(String subject_name) {
        this.subject_name = subject_name;
    }

    public Timestamp getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Timestamp create_time) {
        this.create_time = create_time;
    }

    public String getCreate_time_string() {
        return create_time_string;
    }

    public void setCreate_time_string(String create_time_string) {
        this.create_time_string = create_time_string;
    }

    public String getDeadline_string() {
        return deadline_string;
    }

    public void setDeadline_string(String deadline_string) {
        this.deadline_string = deadline_string;
    }
}
