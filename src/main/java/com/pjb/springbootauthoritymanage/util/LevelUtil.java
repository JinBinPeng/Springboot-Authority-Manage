package com.pjb.springbootauthoritymanage.util;

import org.apache.commons.lang3.StringUtils;

public class LevelUtil {
    private LevelUtil(){

    }
    private static final String SEPARATOR = ".";
    public static final String ROOT = "0";

    public static String calculateLevel(String parentLevel, int parentId) {
        if (StringUtils.isBlank(parentLevel)) {
            return ROOT;
        } else {
            return StringUtils.join(parentLevel, SEPARATOR, parentId);
        }
    }
}
