package com.mvp.service;

import com.mvp.domain.*;

import java.util.List;
import java.util.Map;

public interface AudioService {

    List<AudioVO> getList();

    List<MediaVO> mediaGetList();

    public AudioVO get(int no);

    public MediaVO mediaGet(int no);

    public FileVO getfile(int no);

    public FileVO getfile2(int no);

    public MemberVO checkId();

    public void play_check(HistoryVO history);

    public int play_delete(int h_no);

    List<Map<String, Object>> play_list();


}
