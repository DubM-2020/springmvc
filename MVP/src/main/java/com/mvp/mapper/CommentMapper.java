package com.mvp.mapper;

import com.mvp.domain.CommentVO;
import com.mvp.domain.Criteria;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentMapper {
    //댓글 개수
    public int count_comment(int no);
    //댓글 작성
    public int insert_comment(CommentVO commentVO);     //insert
    //댓글 조회
    public List<CommentVO> comment_list(Criteria cri, int no);

    public CommentVO lookup_comment(int c_no);  //read
    //댓글 삭제
    int delete_comment(CommentVO commentVO);
    //댓글 수정
    public int modify_comment(CommentVO commentVO); //update
    //댓글 목록 페이징
    public List<CommentVO> ListPaging(@Param("cri")Criteria cri, @Param("no") int no);


}
