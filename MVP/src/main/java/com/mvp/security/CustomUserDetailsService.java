package com.mvp.security;

import com.mvp.service.MemberService;
import lombok.extern.log4j.Log4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Log4j
@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Inject
    private MemberService service;

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
        CustomUserDetails user = service.findById(id);

        log.warn(user);

        if(user == null) {
            log.warn("ID IS NOT FOUND");
            throw new UsernameNotFoundException(id + " is NOT FOUND");
        }

        log.warn("GET ID = " + id);
        log.warn("AUTH = " + user.getAuth());
        return user;
    }
}
