package com.ljx.HomeworkSystem.entity;

import java.sql.Timestamp;

public class Message {
    private int id;
    private String content;
    private String send_out_name;
    private String receive_email;
    private Timestamp send_time;
    private int isRead;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSend_out_name() {
        return send_out_name;
    }

    public void setSend_out_name(String send_out_name) {
        this.send_out_name = send_out_name;
    }

    public String getReceive_email() {
        return receive_email;
    }

    public void setReceive_email(String receive_email) {
        this.receive_email = receive_email;
    }

    public Timestamp getSend_time() {
        return send_time;
    }

    public void setSend_time(Timestamp send_time) {
        this.send_time = send_time;
    }

    public int getIsRead() {
        return isRead;
    }

    public void setIsRead(int isRead) {
        this.isRead = isRead;
    }
}
