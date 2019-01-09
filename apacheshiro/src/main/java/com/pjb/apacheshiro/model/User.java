package com.pjb.apacheshiro.model;

import lombok.Data;

import java.util.HashSet;
import java.util.Set;

@Data
public class User {
    private Integer uid;
    private String username;
    private String password;
    private Set<Role> roles = new HashSet<>();
}
