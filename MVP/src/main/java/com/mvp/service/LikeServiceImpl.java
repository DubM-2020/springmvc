package com.mvp.service;

import com.mvp.domain.CommentPageDTO;
import com.mvp.domain.History_LikeVO;
import com.mvp.mapper.LikeMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;

@Service
@Log4j
public class LikeServiceImpl implements LikeService{

    @Setter(onMethod_ = @Autowired)
    private LikeMapper mapper;

    @Override
    public int countByLike(HashMap hashMap) {
        log.warn("countByLike = "+hashMap);
        return mapper.countByLike(hashMap);
    }

    @Override
    public int create(HashMap hashMap) {
        log.warn(hashMap);
        return mapper.create(hashMap);
    }

    @Override
    @Transactional
    public int like_check(HashMap hashMap) {
        log.warn(hashMap);
        return mapper.like_check(hashMap);
    }

    @Override
    @Transactional
    public int like_check_cancel(HashMap hashMap) {
        log.warn(hashMap);
        return mapper.like_check_cancel(hashMap);
    }

    @Override
    public History_LikeVO read(HashMap hashMap) {
        log.warn(hashMap.get("id"));
        log.warn(hashMap.get("media_no"));

        log.warn(hashMap);
        return mapper.read(hashMap);
    }

    @Override
    public int deleteByNo(int media_no) {
        log.warn(media_no);
        return mapper.deleteByNo(media_no);
    }

    @Override
    public String deleteById(String id) {
        log.warn(id);
        return mapper.deleteById(id);
    }

    @Override
    @Transactional
    public void media_like_up(int media_no) {
        mapper.media_like_up(media_no);
    }

    @Override
    @Transactional
    public void media_like_down(int media_no) {
        mapper.media_like_down(media_no);
    }

    @Override
    public Integer check_like(HashMap like_check) {
        return mapper.check_like(like_check);
    }
}
