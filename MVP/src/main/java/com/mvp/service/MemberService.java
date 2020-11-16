package com.mvp.service;

import com.mvp.domain.MemberVO;
import com.mvp.security.CustomUserDetails;

public interface MemberService {

    public void register(MemberVO vo);

    public CustomUserDetails findById(String id);

    public boolean modify(MemberVO vo);

    public int idCheck(String id);

}
