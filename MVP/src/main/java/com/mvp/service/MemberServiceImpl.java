package com.mvp.service;

import com.mvp.domain.MemberVO;
import com.mvp.mapper.MemberMapper;
import com.mvp.security.CustomUserDetails;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {

    @Setter(onMethod_ = @Autowired)
    private MemberMapper mapper;

    private PasswordEncoder encoder = getPasswordEncoder();

    @Override
    public void register(MemberVO vo) {
        log.warn("BEFORE PW ENCODING : " + vo.getPwd());
        String encPW = encoder.encode(vo.getPwd());
        vo.setPwd(encPW);
        log.warn("AFTER PW ENCODING : " + vo.getPwd());

        log.warn("service-register : " + vo);
        mapper.register(vo);
    }

    @Override
    public CustomUserDetails findById(String id) {
        return mapper.findById(id);
    }

    @Override
    public boolean modify(MemberVO vo) {

        log.warn("MODIFY BEFORE PW ENCODING : " + vo.getPwd());
        String encPW = encoder.encode(vo.getPwd());
        vo.setPwd(encPW);
        log.warn("MODIFY AFTER PW ENCODING : " + vo.getPwd());

        log.warn("service - modify : " + vo);

        return mapper.update(vo) == 1;
    }

    @Override
    public int idCheck(String id) {
        log.warn("service idCheck.."+id);
       return mapper.idCheck(id);
    }

    @Bean
    public PasswordEncoder getPasswordEncoder() {
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder;
    }
}
