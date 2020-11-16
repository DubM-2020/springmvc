package com.mvp.controller;

import com.mvp.domain.CommentPageDTO;
import com.mvp.domain.CommentVO;
import com.mvp.domain.Criteria;
import com.mvp.service.CommentService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/comment/*")
@Log4j
@AllArgsConstructor
public class CommentController {

    private CommentService service;

    @PreAuthorize("isAuthenticated()")
    @PostMapping(value ="/new",
            consumes = "application/json",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> create(@RequestBody CommentVO commentVO){
        int insertCount = service.insert_comment(commentVO);

        return insertCount == 1
                ? new ResponseEntity<String>("success", HttpStatus.OK)
                : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
    @GetMapping(value="/pages/{no}/{page}",
            produces = {
                    MediaType.APPLICATION_ATOM_XML_VALUE,
                MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<CommentPageDTO> comment_list(
            @PathVariable("page") int page,
            @PathVariable("no") int no){

        Criteria cri = new Criteria(page,10);

        return new ResponseEntity<>(service.getListPage(cri, no), HttpStatus.OK);
    }

    @GetMapping(value="/{c_no}",
            produces = {MediaType.APPLICATION_XML_VALUE,
                    MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<CommentVO> getC_no(@PathVariable("c_no") int c_no){
        log.info("get c_no"+c_no);
        return new ResponseEntity<CommentVO>(service.getC_no(c_no),HttpStatus.OK);
    }

    @PreAuthorize("principal.username == #commentVO.writer")
    @DeleteMapping(value="/{c_no}")
    public ResponseEntity<String> delete_comment(@RequestBody CommentVO commentVO, @PathVariable("c_no") int c_no){
        log.info("delete comment:"+c_no);
        log.info("writer:"+commentVO.getWriter());
        return service.delete_comment(commentVO) == 1
                ? new ResponseEntity<String>("success",HttpStatus.OK)
                : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @PreAuthorize("principal.username == #commentVO.writer")
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
            value="/{c_no}",
            consumes ="application/json",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> modify_comment(
            @RequestBody CommentVO commentVO,
            @PathVariable("c_no") int c_no){
        commentVO.setC_no(c_no);
        log.info("c_no:"+c_no);
        log.info("modify"+commentVO);

        return service.modify_comment(commentVO)==1
                ? new ResponseEntity<String>("success",HttpStatus.OK)
                : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
    }




}
