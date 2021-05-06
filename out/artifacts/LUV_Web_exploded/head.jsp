<%@ page  contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cb" class="com.bean.ComBean"/>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=GBK">
  <meta charset="gb2312">
  <script>
    window.onerror = function () {
      return true;
    }
  </script>
</head>
<body>
<%
  String message = (String) request.getAttribute("message");
  if (message == null) {
    message = "";
  }
  if (!message.trim().equals("")) {
    out.println("<script language='javascript'>");
    out.println("alert('" + message + "');");
    out.println("</script>");
  }
  request.removeAttribute("message");
%>