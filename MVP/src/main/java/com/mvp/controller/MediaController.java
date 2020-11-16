package com.mvp.controller;

import com.mvp.service.LikeService;
import com.mvp.service.MediaService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Log4j
@AllArgsConstructor
public class MediaController {

    private MediaService service;
    private LikeService like_service;

    @GetMapping("/video/video_list")
    public void video_list(Model model){
        log.warn("video_list");
        model.addAttribute("vlist", service.video_type());

        log.warn("video_list");
        List<Map<String, Object>> video = service.video_list();
        System.out.println("리스트 개수: " + video.size());
        model.addAttribute("video", video);

    }
    @GetMapping("/video/watch")
    public void watch(@RequestParam("no") int no, String category , Model model, Principal principa){
        log.warn("watch...");
        log.warn("cate"+category);
        List<Map<String, Object>> relation = service.relation_list(category);
        model.addAttribute("relation",service.relation_list(category));
        log.warn(model);
        model.addAttribute("list", service.watch(no));
        log.warn(model);
        model.addAttribute("file",service.fileName(no));
        HashMap like_check = new HashMap<>();

        like_check.put("no", no);

        if(principa == null){
            like_check.put("id", "id");
        }else {
            like_check.put("id", principa.getName());
        }

        Integer num = like_service.check_like(like_check);
        model.addAttribute("like", num);
    }
    @GetMapping("/video/category")
    public void video_category(@RequestParam("category") String category,Model model){
        System.out.println("category: "+category);
        String str = category.toUpperCase();

        model.addAttribute("list", service.video_category(str));
        log.warn(model);
    }


    @GetMapping("/search")
    public String search(@RequestParam("baseOpt") String opt,
                         @RequestParam("keyword") String keyword,
                         Model model){
        log.warn(opt);
        log.warn(keyword);

        List<Map<String,Object>> list;
        list = service.searchList(opt,keyword);
        log.warn("list = "+list);

        model.addAttribute("list",list);

        return "/mvp/search";
    }
}
