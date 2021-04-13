<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <meta charset="gb2312">
    <meta name="robots" content="index, follow">
    <meta name="googlebot" content="index, follow">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <link rel="stylesheet" href="<%=basePath%>images/style.css?v=0310" media="all" id="base">

    <script language="javascript" src="<%=basePath%>images/jquery-1.7.1.min.js"></script>
    <script language="javascript" src="<%=basePath%>images/jquery.main.js"></script>
    <script language="javascript" src="<%=basePath%>images/slides.min.jquery.js"></script>
    <script language="javascript" src="<%=basePath%>images/jquery.KinSlideshow.js?v=0123"></script>
    <script>
        window.onerror = function () {
            return true;
        }
    </script>
    <script>
        $(function () {
            var adli = $('.ad-thumbs-list');
            if (adli.length == 1) {
                var adw = $('.ad-thumbs-list img').length * 86;
                $('.ad-thumbs-list').width(adw);
            }
        });
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