package com.pjb.springbootauthoritymanage.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SysLog {
    private Integer id;
    private Integer type;
    private Integer targetId;
    private String operator;
    private Date operateTime;
    private String operateIp;
    private Integer status;

    public void setOperator(String operator) {
        this.operator = operator == null ? null : operator.trim();
    }
    public void setOperateIp(String operateIp) {
        this.operateIp = operateIp == null ? null : operateIp.trim();
    }
}