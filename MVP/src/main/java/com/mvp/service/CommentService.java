package com.mvp.service;

import com.mvp.domain.CommentPageDTO;
import com.mvp.domain.CommentVO;
import com.mvp.domain.Criteria;
import com.mvp.mapper.CommentMapper;
import org.apache.ibatis.annotations.Param;

import javax.annotation.Resource;
import java.util.List;

public interface CommentService {

    //댓글 작성
    public int insert_comment(CommentVO commentVO); //register

    public CommentVO getC_no(int c_no);             //get
    //댓글 수정
    public int modify_comment(CommentVO commentVO); //modify
    //댓글 삭제
    //댓글 조회(목록)
    public List<CommentVO> comment_list(Criteria cri, int no); // get list

    public CommentPageDTO getListPage(Criteria cri, int no);

    public int count_comment(int no);

    int delete_comment(CommentVO commentVO);
}
