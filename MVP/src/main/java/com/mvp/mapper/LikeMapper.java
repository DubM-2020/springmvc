package com.mvp.mapper;


import com.mvp.domain.History_LikeVO;

import java.util.HashMap;

public interface LikeMapper {

    /* 게시판의 좋아요 번호가 있는지 카운트 */
    public int countByLike(HashMap hashMap);

    /* 좋아요 번호 등록 */
    public int create(HashMap hashMap);

    /* 좋아요 체크 여부 (0 -> 1) */
    public int like_check(HashMap hashMap);

    /* 좋아요 체크 여부 (1 -> 0)*/
    public int like_check_cancel(HashMap hashMap);

    /* 조회 */
    public History_LikeVO read(HashMap hashMap);

    /* 게시판의 좋아요 삭제 */
    public int deleteByNo(int media_no);

    /* 회원의 좋아요 삭제 */
    public String deleteById(String id);

    public void media_like_up(int media_no);

    public void media_like_down(int media_no);

    public Integer check_like(HashMap like_check);
}
