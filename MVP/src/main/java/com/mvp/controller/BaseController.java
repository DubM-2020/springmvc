package com.mvp.controller;

import com.mvp.service.MediaService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@Log4j
@RequestMapping("/mvp/*")
@AllArgsConstructor
public class BaseController {

    private MediaService service;

    @GetMapping("/home")
    public void home() {
        log.info("home.");
    }

    @GetMapping("/sign")
    public void sign(HttpServletRequest request) {
        String referrer = request.getHeader("Referer");
        request.getSession().setAttribute("prevPage", referrer);
        log.info("sign.");
    }

    @GetMapping("/best")
    public void bestList(@RequestParam int sort, Model model) throws Exception {
        log.info("best.");
        List<Map<String, Object>> list = service.best_list(sort);  //디폴트 음악 조회수
        System.out.println("리스트 개수: " + list.size());
        model.addAttribute("list", list);
    }

    @GetMapping("/hot")
    public void hotList(Model model){
        log.info("hot List");
        List<Map<String, Object>> alist = service.topFiveAudio();
        List<Map<String, Object>> vlist = service.topFiveVideo();
        log.warn("리스트:"+alist.size()+"//"+vlist.size());
        model.addAttribute("alist", alist);
        model.addAttribute("vlist",vlist);
    }
}
