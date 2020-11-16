package com.mvp.domain;

import lombok.Data;

import java.util.Date;

@Data
public class MemberVO {

    private String id;
    private String pwd;
    private String name;
    private String email;
    private String auth;
    private Date regDate;

    private int enabled;

}
