package com.mvp.domain;

import lombok.Data;

@Data
public class FileAttachVO {

    private String fileName;
    private String uuid;
    private String uploadPath;
    private boolean image;

    private int no;
}
