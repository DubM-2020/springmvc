package com.mvp.service;

import com.mvp.domain.CommentPageDTO;
import com.mvp.domain.CommentVO;
import com.mvp.domain.Criteria;
import com.mvp.mapper.CommentMapper;
import com.mvp.mapper.MediaMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.xml.stream.events.Comment;
import java.util.List;

@Service
@Log4j
public class CommentServiceImpl implements CommentService{

    @Setter(onMethod_ = @Autowired)
    private CommentMapper mapper;

    @Setter(onMethod_=@Autowired)
    private MediaMapper mediaMapper;

    @Override
    public int insert_comment(CommentVO commentVO) {
        log.info("insertComment..."+commentVO);
        return mapper.insert_comment(commentVO);        //insert
    }
    @Override
    public CommentVO getC_no(int c_no) {
        log.info("get c_no..."+c_no);
        return mapper.lookup_comment(c_no);             //read
    }

    @Override
    public int modify_comment(CommentVO commentVO) {       //update
        log.info("modify comment..."+commentVO);
        return mapper.modify_comment(commentVO);
    }

    @Override
    public int delete_comment(CommentVO commentVO) {                   //remove
        log.info("remove comment..."+commentVO);
        return mapper.delete_comment(commentVO);
    }

    @Override
    public List<CommentVO> comment_list(Criteria cri,int no) {
        return mapper.ListPaging(cri, no);
    }

    @Override
    public CommentPageDTO getListPage(Criteria cri, int no) {

        return new CommentPageDTO(
                mapper.count_comment(no),
                mapper.ListPaging(cri,no)
        );
    }
    @Override
    public int count_comment(int no) {
        return 0;
    }


}
