package com.util;

/**
 * ���÷�����
 */

public final class Common {

    ////////////����
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