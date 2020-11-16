package com.mvp.mapper;

import com.mvp.domain.FileVO;
import com.mvp.domain.MediaVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface MediaMapper {

    List<Map<String, Object>> total_list();
    List<Map<String, Object>> sing_list(String singer);

    public List<MediaVO> video_type();
    public MediaVO watch(int no);
    public FileVO fileName(int no);
    List<Map<String,Object>> relation_list(Object category);
    public MediaVO read(int no);
    public void count(int no);

    List<Map<String, Object>> allList();
    List<Map<String,Object>> searchList(@Param("opt") String opt, @Param("keyword") String keyword);

    List<Map<String, Object>> start_list();
    List<Map<String, Object>> scroll_list(int no);
    List<Map<String, Object>> best_list(int no);
    List<Map<String, Object>> category_list(Object category);

    /* 11월02일 추가 */
    List<Map<String, Object>> video_category(String category);
    List<Map<String, Object>> topFiveVideo();
    List<Map<String, Object>> topFiveAudio();

    List<Map<String, Object>> video_list();
}