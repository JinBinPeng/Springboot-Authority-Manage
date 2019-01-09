package com.pjb.springbootauthoritymanage.model;

import lombok.*;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SysDept {
    private Integer id;
    private String name;
    private Integer parentId;
    private String level;
    private Integer seq;
    private String remark;
    private String operator;
    private Date operateTime;
    private String operateIp;

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
    public void setLevel(String level) {
        this.level = level == null ? null : level.trim();
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