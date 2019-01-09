package com.pjb.springsecurity;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;


@Component
public class MyUserService implements UserDetailsService{
    @Override
    public UserDetails loadUserByUsername(String username) {
        return null;
    }
}
