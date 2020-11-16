package com.mvp.service;

import com.mvp.domain.*;
import com.mvp.mapper.AudioMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Log4j
@Service
public class AudioServiceImpl implements AudioService{

    @Setter(onMethod_ = @Autowired)
    private AudioMapper mapper;

    @Override
    public List<AudioVO> getList() {
        log.info("getList.....");
        return mapper.getList();
    }

    @Override
    public List<MediaVO> mediaGetList() {
        log.info("mediaGetList.....");
        return mapper.mediaGetList();
    }

    @Override
    public AudioVO get(int no) {
        log.info("get......" + no);
        return mapper.read(no);
    }

    @Override
    public MediaVO mediaGet(int no) {
        log.info("get......" + no);
        return mapper.mediaRead(no);
    }

    @Override
    public FileVO getfile(int no) {
        log.info("getfile...........");
        return mapper.getfile(no);
    }

    @Override
    public FileVO getfile2(int no) {
        log.info("getfile2...........");
        return mapper.getfile2(no);
    }

    @Override
    public MemberVO checkId() {
        log.info("checkId.........");
        return mapper.checkId();
    }

    @Override
    public void play_check(HistoryVO history) {
        log.info("play_check.........");
        mapper.play_check(history);
    }

    @Override
    public int play_delete(int h_no) {
        log.info("play_delete...........");
        return mapper.play_delete(h_no);
    }

    @Override
    public List<Map<String, Object>> play_list() {
        log.info("play_list.........");
        return mapper.play_list();
    }


}
