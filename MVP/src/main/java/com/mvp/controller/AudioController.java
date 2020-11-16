package com.mvp.controller;


import com.mvp.domain.HistoryVO;
import com.mvp.service.AudioService;
import com.mvp.service.LikeService;
import com.mvp.service.MediaService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Log4j
@RequestMapping("/audio/*")
@AllArgsConstructor
public class AudioController {


    private AudioService audioService;
    private MediaService mediaService;
    private LikeService like_service;

    @GetMapping("/music_list")
    public void list(Model model) {
        List<Map<String, Object>> list = mediaService.start_list();
        System.out.println("리스트 개수: " + list.size());
        model.addAttribute("list", list);
    }


    @GetMapping("/test2")
    public void test2() {

        log.info("test2");
    }


    @GetMapping("/music")
    private void music(@RequestParam("no") int no, String singer, Model model, Principal principa) {

        model.addAttribute("audio", audioService.get(no));
        model.addAttribute("media", audioService.mediaGet(no));
        model.addAttribute("file", audioService.getfile(no));
        model.addAttribute("file2", audioService.getfile2(no));
        log.warn("singer ===========" + singer);
        List<Map<String, Object>> singList = mediaService.sing_list(singer);
        model.addAttribute("singList", singList);

        log.info("/music");

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

    @PostMapping("/music")
    public String play_check(@RequestParam("audio_no") int no,
                             @RequestParam("singer") String singer,
                             HttpServletRequest request,
                             HistoryVO history,
                             RedirectAttributes rttr, Model model) {

        String[] temp = request.getParameterValues("noList");
        String array = Arrays.toString(temp);
        String[] tempz = array.split(",|[\\[\\]]");

        if(tempz.length == 0) {
            audioService.play_check(history);
        }else{
            for (int i = 1; i < tempz.length; i++) {
                int num = Integer.parseInt(tempz[i]);
                history.setAudio_no(num);
                audioService.play_check(history);
            }
        }

        rttr.addAttribute("singer", singer);

        return "redirect:/audio/music?no=" + no;
    }

    @GetMapping("/music_player")
    public void music_player(Model model) {

        List<Map<String, Object>> p_list = audioService.play_list();
        model.addAttribute("p_list", p_list);

        System.out.println("리스트 개수: " + p_list.size());

    }

    @DeleteMapping(value = "/music_player/{h_no}" , produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> remove(@PathVariable("h_no") int h_no){

        log.info("delete" + h_no);

        return audioService.play_delete(h_no) == 1
                ?new ResponseEntity<>("success", HttpStatus.OK)
                :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

    }

    @PostMapping("/testscrolldown")
    public @ResponseBody
    List<Map<String, Object>> scrollControl(@RequestBody String no){

        JSONObject obj = JSONObject.fromObject(no);

        int noToStart = obj.getInt("no");
        noToStart+=1;

        List<Map<String, Object>> scrollList=mediaService.scroll_list(noToStart);

        return scrollList;
    }

    @GetMapping("/category")
    public void categoryList(@RequestParam("category") String category, Model model){
        System.out.println("category: "+category);
        String str=category.toUpperCase();


        //List<Map<String, Object>> cat_list=mediaService.category_list(category);
        model.addAttribute("list",mediaService.category_list(str));

    }

}
