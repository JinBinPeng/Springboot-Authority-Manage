package com.pjb.apacheshiro.service;

import com.pjb.apacheshiro.mapper.UserMapper;
import com.pjb.apacheshiro.model.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public User findByUsername(String username) {
        return userMapper.findByUsername(username);
    }
}
