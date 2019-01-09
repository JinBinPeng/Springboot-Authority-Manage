package com.pjb.springbootauthoritymanage.model;

import lombok.*;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SysUser {
    private Integer id;
    private String username;
    private String telephone;
    private String mail;
    private String password;
    private Integer deptId;
    private Integer status;
    private String remark;
    private String operator;
    private Date operateTime;
    private String operateIp;

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }
    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }
    public void setMail(String mail) {
        this.mail = mail == null ? null : mail.trim();
    }
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
    public void setOperator(String operator) {
        this.operator = operator == null ? null : operator.trim();
    }
    public void setOperateIp(String operateIp) {
        this.operateIp = operateIp == null ? null : operateIp.trim();
    }
}