package com.util;

import java.sql.*;

public class DBO {

    private Connection conn;
    private Statement stmt;

    public DBO() {
    }

    /**
     * 打开数据库
     */
    public void open() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/luv?useUnicode=true&characterEncoding=gb2312", "root", "123");

            stmt = conn.createStatement();
            System.out.println("打开数据库连接");
        } catch (Exception ex) {
            System.err.println("打开数据库时出错: " + ex.getMessage());
        }
    }

    /**
     * 关闭数据库，将连接返还给连接池
     */
    public void close() {
        try {


            //	connMgr.freeConnection("java", conn);
            conn.close();
            System.out.println("释放连接");
        } catch (SQLException ex) {
            System.err.println("返还连接池出错: " + ex.getMessage());
        }
    }

    /**
     * 执行查询
     */
    public ResultSet executeQuery(String sql) throws SQLException {
        ResultSet rs = null;


        rs = stmt.executeQuery(sql);
        System.out.println("执行查询");
        return rs;
    }

    /**
     * 执行增删改
     */
    public int executeUpdate(String sql) throws SQLException {
        int ret = 0;


        ret = stmt.executeUpdate(sql);

        System.out.println("执行增删改");
        return ret;
    }
}
