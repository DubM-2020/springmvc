package com.mvp.service;

import com.mvp.domain.AudioVO;
import com.mvp.domain.FileAttachVO;
import com.mvp.domain.MediaVO;
import com.mvp.domain.MemberVO;
import com.mvp.mapper.AdminMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {

    @Setter(onMethod_ = {@Autowired})
    AdminMapper mapper;

    @Transactional
    @Override
    public void register(MediaVO dto, String singer) {
        mapper.register(dto);

        if(!dto.isType()) {
            AudioVO audio = new AudioVO();
            audio.setContent(dto.getContent());
            audio.setNo(dto.getNo());
            audio.setSinger(singer);
            mapper.audioContent(audio);
        }

        if (dto.getFileList() == null || dto.getFileList().size() <= 0) {
            return;
        }
        dto.getFileList().forEach(file -> {
            file.setNo(dto.getNo());
            mapper.insert(file);
        });

    }

    @Override
    public MediaVO getMedia(int no) {
        log.warn("get.");
        return mapper.read(no);
    }

    @Transactional
    @Override
    public boolean modify(MediaVO dto) {

        mapper.deleteAll(dto.getNo());

        boolean modifyResult = mapper.update(dto) == 1;

        if (modifyResult && dto.getFileList() != null) {
            dto.getFileList().forEach(file -> {
                file.setNo(dto.getNo());
                mapper.insert(file);
            });
        }
        log.warn("update : " + modifyResult);
        return modifyResult;
    }

    @Override
    public List<FileAttachVO> getFileList(int no) {
        return mapper.getFileList(no);
    }

    @Transactional
    @Override
    public boolean remove(int no) {
        log.warn("remove.");
        mapper.deleteAll(no);
        return mapper.delete(no) == 1;
    }

    @Override
    public List<MemberVO> getAllMember() {
        return mapper.getAllMember();
    }

    @Override
    public int userStatus(String id) {
        return mapper.userStatus(id);
    }

    @Override
    public int userConfig(Map<String,Object> map) {

        return mapper.userConfig(map);
    }

    @Override
    public int userDelete(String id) {
        return mapper.userDelete(id);
    }


}
