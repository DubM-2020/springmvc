package com.mvp.mapper;

import com.mvp.domain.*;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface AudioMapper {

    List<AudioVO> getList();

    List<MediaVO> mediaGetList();

    public AudioVO read(int no);

    public MediaVO mediaRead(int no);

    public FileVO getfile(int no);

    public FileVO getfile2(int no);

    public MemberVO checkId();

    public void play_check(HistoryVO history);

    public int play_delete(int h_no);

    List<Map<String, Object>> play_list();
}
