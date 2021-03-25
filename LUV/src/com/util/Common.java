package com.util;

/**
 * 常用方法类
 */

public final class Common {

    ////////////汉化
    public static String toChineseAndTrim(String str) {

        if (str == null) {
            str = "";
        }
        try {
            byte b[] = str.getBytes("iso-8859-1");
            str = new String(b);
            str = str.trim();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return str;
    }
}