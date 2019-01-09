package com.pjb.springbootauthoritymanage;

import com.pjb.springbootauthoritymanage.config.LoginFilter;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
@MapperScan("com.pjb.springbootauthoritymanage.mapper")
public class SpringbootAuthorityManageApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringbootAuthorityManageApplication.class, args);
    }
    @Bean
    public FilterRegistrationBean<LoginFilter> loginFilter(){
        FilterRegistrationBean<LoginFilter> registrationBean=new FilterRegistrationBean<>(new LoginFilter());
        registrationBean.addUrlPatterns("/sys/*");
        registrationBean.addUrlPatterns("/admin/*");
        return registrationBean;
    }
}

