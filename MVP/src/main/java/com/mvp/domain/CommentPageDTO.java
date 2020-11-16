package com.mvp.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

import java.util.List;

@Data
@AllArgsConstructor
@Getter
public class CommentPageDTO {
    private int commentCnt;
    private List<CommentVO> list;
}
