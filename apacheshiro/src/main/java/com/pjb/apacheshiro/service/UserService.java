package com.pjb.apacheshiro.service;

import com.pjb.apacheshiro.model.User;


public interface UserService {
    User findByUsername(String username);
}
