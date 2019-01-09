package com.pjb.apacheshiro;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.pjb.apacheshiro.mapper")
public class ApacheshiroApplication {

    public static void main(String[] args) {
        SpringApplication.run(ApacheshiroApplication.class, args);
    }

}

