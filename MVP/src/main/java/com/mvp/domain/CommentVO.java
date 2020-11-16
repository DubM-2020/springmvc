package com.mvp.domain;

import lombok.Data;

import java.sql.Date;

@Data
public class CommentVO {
    private int c_no;
    private int no;
    private String reply;
    private String writer;
    private Date c_date;
    private Date updateDate;
}
