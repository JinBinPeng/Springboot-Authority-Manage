package com.pjb.springbootauthoritymanage.config;


import com.pjb.springbootauthoritymanage.model.SysUser;

import javax.servlet.http.HttpServletRequest;

public class RequestHolder {
    private RequestHolder(){

    }
    private static final ThreadLocal<SysUser> userHolder = new ThreadLocal<>();
    private static final ThreadLocal<HttpServletRequest> requestThreadLocal = new ThreadLocal<>();

    public static void add(SysUser sysUser) {
        userHolder.set(sysUser);
    }

    public static void add(HttpServletRequest request) {
        requestThreadLocal.set(request);
    }

    public static SysUser getCurrentUser() {
        return userHolder.get();
    }

    public static HttpServletRequest getCurrentRequest() {
        return requestThreadLocal.get();
    }

    public static void remove() {
        userHolder.remove();
        requestThreadLocal.remove();
    }
}
