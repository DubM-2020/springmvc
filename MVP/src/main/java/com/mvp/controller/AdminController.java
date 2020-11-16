package com.mvp.controller;

import com.mvp.domain.FileAttachVO;
import com.mvp.domain.MediaVO;
import com.mvp.domain.MemberVO;
import com.mvp.service.AdminService;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

@Controller
@AllArgsConstructor
@Log4j
public class AdminController {

    AdminService service;

    @PostMapping("/uploadAction")
    public String insert(MediaVO dto, @Param("singer") String singer) {

        log.warn(singer);
        log.warn(dto.isType());
        service.register(dto, singer);

        return "redirect:/mvp/admin/home";
    }

    @GetMapping("/mvp/admin/modify")
    public void get(@RequestParam("no") int no, Model model) {
        log.warn("get == " + no);
        model.addAttribute("media", service.getMedia(no));
    }

    @PostMapping("/update")
    public String modify(MediaVO dto, RedirectAttributes rttr) {
        log.warn("update date = " + dto);
        if (service.modify(dto)) {
            rttr.addFlashAttribute("result", "success");
        }
        return "redirect:/mvp/admin/home";
    }

    @GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<List<FileAttachVO>> getFileList(int no) {
        return new ResponseEntity<>(service.getFileList(no), HttpStatus.OK);
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("no") int no, RedirectAttributes rttr) {

        log.info("remove.." + no);

        List<FileAttachVO> fileList = service.getFileList(no);

        if (service.remove(no)) {
            deleteFiles(fileList);
            rttr.addFlashAttribute("result", "success");
        }
        return "redirect:/mvp/admin/home";
    }

    private void deleteFiles(List<FileAttachVO> fileList) {
        log.warn("delete1");
        if (fileList == null || fileList.size() == 0) {
            return;
        }

        log.warn("delete2");
        log.info(fileList);

        fileList.forEach(attach -> {
            try {
                Path file = Paths.get(
                        "C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());

                Files.deleteIfExists(file);

                if (Files.probeContentType(file).startsWith("image")) {

                    Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\_" + attach.getUuid() + "_"
                            + attach.getFileName());

                    Files.delete(thumbNail);
                }

            } catch (Exception e) {
                log.error("delete file error" + e.getMessage());
            }
            log.warn("delete3");
        });
    }

    @GetMapping("/mvp/admin/manage")
    public String manage(Model model) {
        List<MemberVO> vo = service.getAllMember();
        model.addAttribute("user", vo);

        return "/mvp/admin/management";
    }

    @PostMapping("/mvp/admin/config")
    @ResponseBody
    public int config(@RequestParam Map<String, Object> map) {
        String id = (String) map.put("data", "data");
        map.remove("data");
        int value = service.userStatus(id);

        if (value == 1)
            value = 0;
        else
            value = 1;

        map.put("id", id);
        map.put("value", value);

        log.warn(map);

        return service.userConfig(map);
    }

    @PostMapping("/mvp/admin/delete")
    @ResponseBody
    public int userDelete(@RequestParam Map<String,Object> map) {
        String id = (String) map.put("data", "data");
        log.warn(id);
        return service.userDelete(id);
    }
}
