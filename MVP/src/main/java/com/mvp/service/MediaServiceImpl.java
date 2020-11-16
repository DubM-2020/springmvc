package com.mvp.service;

import com.mvp.domain.FileVO;
import com.mvp.domain.MediaVO;
import com.mvp.mapper.MediaMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Log4j
@Service
public class MediaServiceImpl implements MediaService {

    @Setter(onMethod_ = @Autowired)
    private MediaMapper mapper;

    @Override
    public List<Map<String, Object>> total_list() {
        log.info("total_list.......");
        return mapper.total_list();
    }

    @Override
    public List<Map<String, Object>> sing_list(String singer) {
        log.info("sing_list.......");
        return mapper.sing_list(singer);
    }

    @Override
    public List<MediaVO> video_type() {
        log.info("video_type...");
        return mapper.video_type();
    }

    @Transactional
    @Override
    public MediaVO watch(int no) {
        log.info("watch...");
        mapper.count(no);
        return mapper.watch(no);
    }

    @Override
    public FileVO fileName(int no) {
        log.info("fileName...");
        return mapper.fileName(no);
    }

    @Override
    public List<Map<String, Object>> relation_list(String category) {
        log.info("relation_list..");
        return mapper.relation_list(category);
    }

    @Override
    public MediaVO read(int no) {
        log.warn("serviceImpl Read.");
        return mapper.read(no);
    }

    @Override
    public void count(int no) {
        log.warn("count No:" + no);
        mapper.count(no);
    }

    @Override
    public List<Map<String, Object>> searchList(@Param("opt") String opt, @Param("keyword") String keyword) {
        log.warn("service opt : " + opt);
        log.warn("service keyword : " + keyword);

        return mapper.searchList(opt, keyword);
    }

    @Override
    public List<Map<String, Object>> allList() {
        return mapper.allList();
    }

    @Override
    public List<Map<String, Object>> start_list() {
        log.info("total_list.......");
        return mapper.start_list();
    }

    @Override
    public List<Map<String, Object>> category_list(String category) {
        log.info("media category....");
        Object temp = category;
        return mapper.category_list(temp);
    }

    @Override
    public List<Map<String, Object>> best_list(int opt) {
        return mapper.best_list(opt);
    }


    @Override
    public List<Map<String, Object>> scroll_list(int no) {
        log.info("scroll test service.....");
        return mapper.scroll_list(no);
    }

    @Override
    public List<Map<String, Object>> video_category(String category) {
        log.info("video category....");
        return mapper.video_category(category);
    }
    @Override
    public List<Map<String, Object>> topFiveVideo() {
        return mapper.topFiveVideo();
    }
    @Override
    public List<Map<String, Object>> topFiveAudio() {
        return mapper.topFiveAudio();
    }

    @Override
    public List<Map<String, Object>> video_list() {
        log.warn("video_list...");
        return mapper.video_list();
    }

}
