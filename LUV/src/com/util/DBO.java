package com.util;

import java.sql.*;

public class DBO {

  private Connection conn;
  private Statement stmt;

  public DBO() {
  }

  public void open() {
    try {
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/luv?useUnicode=true&characterEncoding=gb2312", "root", "123");

      stmt = conn.createStatement();
      System.out.println("�����ݿ�����");
    } catch (Exception ex) {
      System.err.println("�����ݿ�ʱ����: " + ex.getMessage());
    }
  }

  public void close() {
    try {
      conn.close();
      System.out.println("�ͷ�����");
    } catch (SQLException ex) {
      System.err.println("�������ӳس���: " + ex.getMessage());
    }
  }

  public ResultSet executeQuery(String sql) throws SQLException {
    ResultSet rs = null;

    rs = stmt.executeQuery(sql);
    System.out.println("ִ�в�ѯ");
    return rs;
  }

  public int executeUpdate(String sql) throws SQLException {
    int ret = 0;

    ret = stmt.executeUpdate(sql);

    System.out.println("ִ����ɾ��");
    return ret;
  }
}
