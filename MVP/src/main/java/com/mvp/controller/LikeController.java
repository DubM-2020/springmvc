package com.mvp.controller;

import com.mvp.domain.History_LikeVO;
import com.mvp.domain.MediaVO;
import com.mvp.service.LikeService;
import com.mvp.service.MediaService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;

@Controller
@Log4j
@AllArgsConstructor
public class LikeController {

    private LikeService service;
    private MediaService mediaService;

    @ResponseBody
    @RequestMapping(value = "/history_like/like", method = RequestMethod.POST,
            produces = "text/plain;charset=UTF-8")
    public String like(Model model, int media_no, String id){
        log.warn("FIRST SEARCH : "+mediaService.read(media_no));

        model.addAttribute("id",id);
        log.warn("id="+id);
        JSONObject obj = new JSONObject();

        ArrayList<String> msgs = new ArrayList<>();
        HashMap<String,Object> hashMap = new HashMap<>();
        hashMap.put("media_no",media_no);
        hashMap.put("id",id);

        if(service.countByLike(hashMap) == 0){
            service.create(hashMap);
        }

        History_LikeVO likeVO = service.read(hashMap); //

        MediaVO mediaVO = mediaService.read(media_no);

        int like_cnt = mediaVO.getM_like(); //게시판의 좋아요 카운트
        int like_check = likeVO.getLike_check(); //좋아요 체크 값
        /*if(service.countByLike(hashMap) == 0){
            service.create(hashMap);
        }*/
        if(like_check == 0){
            msgs.add("좋아요!");
            service.media_like_up(media_no);
            service.like_check(hashMap);
            like_check++;
            like_cnt++;
        } else {
            msgs.add("좋아요 취소");
            service.media_like_down(media_no);
            service.like_check_cancel(hashMap);
            like_check--;
            like_cnt--;
        }

        obj.put("media_no", media_no);
        obj.put("like_check",like_check);
        obj.put("like_cnt",like_cnt);
        obj.put("msg",msgs);
        obj.put("id",id);

        return obj.toJSONString();

    }
}
