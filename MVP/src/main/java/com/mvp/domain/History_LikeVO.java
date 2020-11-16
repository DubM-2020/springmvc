package com.mvp.domain;

import lombok.Data;

@Data
public class History_LikeVO {

    private int like_no;         //like
    private String id;           //member_id
    private int media_no;        //media table (no)
    private Integer like_check;      //like check

}
