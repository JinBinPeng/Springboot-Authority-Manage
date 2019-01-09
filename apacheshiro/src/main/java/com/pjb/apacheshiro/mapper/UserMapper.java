package com.pjb.apacheshiro.mapper;


import com.pjb.apacheshiro.model.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    User findByUsername(@Param("username") String username);
}
