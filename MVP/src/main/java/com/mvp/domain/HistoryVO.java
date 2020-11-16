package com.mvp.domain;

import lombok.Data;

import java.util.List;

@Data
public class HistoryVO {
    private int h_no;
    private int audio_no;
    private int[] noList;
    private String id;
    private String pmp3;
}
