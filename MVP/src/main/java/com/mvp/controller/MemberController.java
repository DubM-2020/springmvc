package com.mvp.controller;

import com.mvp.domain.MemberVO;
import com.mvp.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Member;

@Controller
@Log4j
@AllArgsConstructor
public class MemberController {

    private MemberService service;

    @PostMapping("/signUp")
    public String signUp(MemberVO vo) {
        log.warn("register : " + vo);

        service.register(vo);

        return "redirect:/mvp/sign";
    }

    @GetMapping("/mvp/member/modify")
    public void modifyForm() { }

    @PostMapping("/modifyAction")
    public String modify(MemberVO vo,RedirectAttributes rttr) {

        if (service.modify(vo)) {
            rttr.addFlashAttribute("result", "success");
        }

        return "redirect:/mvp/member/modify";
    }

    @GetMapping("/idCheck")
    @ResponseBody
    public int idCheck(@RequestParam("id") String id){
        log.warn("controller idCheck."+id);
        return service.idCheck(id);
    }

}
