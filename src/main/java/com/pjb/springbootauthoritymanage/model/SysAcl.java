package com.pjb.springbootauthoritymanage.model;

import lombok.*;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = {"id"})
public class SysAcl {
    private Integer id;
    private String code;
    private String name;
    private Integer aclModuleId;
    private String url;
    private Integer type;
    private Integer status;
    private Integer seq;
    private String remark;
    private String operator;
    private Date operateTime;
    private String operateIp;

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
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