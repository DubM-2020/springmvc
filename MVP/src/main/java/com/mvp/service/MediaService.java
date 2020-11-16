package com.mvp.service;

import com.mvp.domain.FileVO;
import com.mvp.domain.MediaVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface MediaService {

    public List<Map<String, Object>> total_list();
    List<Map<String, Object>> sing_list(String singer);

    public List<MediaVO> video_type();
    public MediaVO watch(int no);
    public FileVO fileName(int no);
    List<Map<String, Object>> relation_list(String category);
    public MediaVO read(int no);
    public void count(int no);

    List<Map<String, Object>> searchList(String opt, String keyword);
    List<Map<String,Object>> allList();

    public List<Map<String, Object>> start_list();
    List<Map<String, Object>> category_list(String category);
    List<Map<String, Object>> best_list(int opt);
    public List<Map<String, Object>> scroll_list(int no);

    /* 11월02일 추가 */
    List<Map<String, Object>> video_category(String category);
    List<Map<String, Object>> topFiveVideo();
    List<Map<String, Object>> topFiveAudio();

    public List<Map<String, Object>> video_list();
}
