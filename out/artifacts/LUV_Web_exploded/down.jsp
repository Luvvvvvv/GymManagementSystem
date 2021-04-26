<%@ page language="java" contentType="text/html;charset=gb2312" import="com.util.*" %>
<%
  String url = request.getParameter("url");
  SmartUpload su = new SmartUpload();
  su.initialize(pageContext);

  // 设定contentDisposition为null以禁止浏览器自动打开文件，
  su.setContentDisposition(null);
  // 下载文件
  url = Common.toChineseAndTrim(url);
  su.downloadFile(url);
%>