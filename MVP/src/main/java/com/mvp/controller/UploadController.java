package com.mvp.controller;


import com.mvp.domain.FileVO;
import com.mvp.service.AdminService;
import com.mvp.service.MediaService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@AllArgsConstructor
@Log4j
public class UploadController {

    AdminService service;
    MediaService mService;

    @GetMapping("/mvp/admin/home")
    public String home(Model model) {

        List<Map<String,Object>> list;
        list = mService.allList();

        model.addAttribute("list",list);

        return "/mvp/admin/home";
    }

    @GetMapping("/mvp/admin/upload")
    public String upload() {
        return "/mvp/admin/upload";
    }

    @PostMapping(value = "/upload",produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<List<FileVO>> upload(MultipartFile[] uploadFile) {
        log.warn("ajax Upload.");

        List<FileVO> list = new ArrayList<>();

        String uploadFolder = "D:\\upload";
        String uploadFolderPath = getFolder();
        File uploadPath = new File(uploadFolder, uploadFolderPath);

        if (!uploadPath.exists()) {
            uploadPath.mkdirs();
        }

        for (MultipartFile file : uploadFile) {
            FileVO dto = new FileVO();

            String uploadFileName = file.getOriginalFilename();
            dto.setFileName(uploadFileName);

            UUID uuid = UUID.randomUUID();

            uploadFileName = uuid.toString() + "_" + uploadFileName;

            try {

                dto.setUuid(uuid.toString());
                dto.setUploadPath(uploadFolderPath);
                File saveFile = new File(uploadPath, uploadFileName);

                if (checkImageType(saveFile)) {
                    String uploadImageFolder = uploadFolder+"\\image";
                    uploadPath = new File(uploadImageFolder,uploadFolderPath);

                    if (!uploadPath.exists()) {
                        uploadPath.mkdirs();
                    }

                    saveFile = new File(uploadPath, uploadFileName);
                    dto.setImage(true);
                }

                file.transferTo(saveFile);

                list.add(dto);
            } catch (Exception e) {
                log.error(e.getMessage());
            }
        }

        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    @ResponseBody
    public ResponseEntity<Resource> downloadFile(String fileName) {

        Resource resource = new FileSystemResource("D:\\upload\\" + fileName);

        String resourceName = resource.getFilename();
        HttpHeaders headers = new HttpHeaders();

        try{
            headers.add("Content-Disposition","attachment; filename="
            + new String(resourceName.getBytes("UTF-8"),"ISO-8859-1"));
        }catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
    }

    @GetMapping("/display")
    @ResponseBody
    public ResponseEntity<byte[]> getFile(String fileName) {

        log.warn("fileName: " + fileName);

        File file = new File("D:\\upload\\image\\" + fileName);

        log.info("file: " + file);

        ResponseEntity<byte[]> result = null;

        try {
            HttpHeaders header = new HttpHeaders();

            header.add("Content-Type", Files.probeContentType(file.toPath()));
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return result;
    }

    @PostMapping("/deleteFile")
    @ResponseBody
    public ResponseEntity<String> deleteFile(String fileName, String type) {

        log.warn("deleted File = " + fileName);

        File file;

        try {
            file = new File("d:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

            file.delete();

            if (type.equals("image")) {
                file = new File("d:\\upload\\image" + URLDecoder.decode(fileName, "UTF-8"));

                file.delete();
            }

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }

    private String getFolder() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = sdf.format(date);

        return str.replace("-", File.separator);
    }

    private boolean checkImageType(File file) {

        try {
            String contentType = Files.probeContentType(file.toPath());

            return contentType.startsWith("image");

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return false;
    }
}
