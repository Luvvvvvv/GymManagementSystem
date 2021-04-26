<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
  String admin = (String) session.getAttribute("user");
  String identity = (String) session.getAttribute("identity");
%>
<link rel="stylesheet" href="<%=basePath %>assets/css/bootstrap.css"/>
<link rel="stylesheet" href="<%=basePath %>assets/css/picstyle.css"/>
<script type="text/javascript" src="<%=basePath %>assets/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=basePath %>assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>assets/js/sdmenu.js"></script>
<script type="text/javascript" src="<%=basePath %>assets/js/laydate.js"></script>
<div class="header">
  <div class="header-right">
    <img src="<%=basePath %>/images/user.jpg">
    <b style="font-size: 16px;position: relative;top: 3px;">
      &nbsp;用户：<%=admin %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </b>
    <img src="<%=basePath %>/images/identity.jpg">
    <b style="font-size: 16px;position: relative;top: 3px;">
      &nbsp;身份：<%=identity %>
    </b>
    <a href="<%=basePath%>index.jsp" target="_top"></a>
    <img style="position: absolute; left: 20px; top: 5px;" src="${pageContext.request.contextPath}/images/bodylogo.png">
    <img src="<%=basePath %>/images/signout.jpg">
    <a onclick="if (confirm('确定要退出吗？')) return true; else return false;"
       href="<%=basePath %>AdminServlet?method=adminexit" target="_top">
      <b style="font-size: 16px;position: relative;top: 3px;
        border: 2px solid #707070;border-radius: 30px;padding: 2px 5px 2px 5px;">
        注销退出
      </b>
    </a>
  </div>
  <img src="<%=basePath %>/images/top_down.jpg" style="width: 100%;height: 9px;position: relative;top: 12px">
</div>

