package com.mvp.domain;

import lombok.Data;

import java.util.List;

@Data
public class MediaVO {

    private int no;
    private String title;
    private String content;
    private String category;
    private int count;
    private int m_like;
    private boolean type;

    private List<FileAttachVO> fileList;
}
