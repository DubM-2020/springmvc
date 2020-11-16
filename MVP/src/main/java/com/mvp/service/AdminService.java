package com.mvp.service;

import com.mvp.domain.FileAttachVO;
import com.mvp.domain.MediaVO;
import com.mvp.domain.MemberVO;

import java.util.List;
import java.util.Map;

public interface AdminService {

    public void register(MediaVO dto, String singer);

    public MediaVO getMedia(int no);

    public boolean modify(MediaVO dto);

    public List<FileAttachVO> getFileList(int no);

    public boolean remove(int no);

    public List<MemberVO> getAllMember();

    public int userStatus(String id);

    public int userConfig(Map<String,Object> map);

    public int userDelete(String id);
}
