<%@ page language="java" contentType="text/html;charset=gb2312" import="com.util.*" %>
<%
  String url = request.getParameter("url");
  SmartUpload su = new SmartUpload();
  su.initialize(pageContext);

  // �趨contentDispositionΪnull�Խ�ֹ������Զ����ļ���
  su.setContentDisposition(null);
  // �����ļ�
  url = Common.toChineseAndTrim(url);
  su.downloadFile(url);
%>