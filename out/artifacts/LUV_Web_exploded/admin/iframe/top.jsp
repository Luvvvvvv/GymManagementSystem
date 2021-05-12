<%@ page contentType="text/html;charset=gb2312" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
  String admin = (String) session.getAttribute("user");
  String identity = (String) session.getAttribute("identity");
%>
<link rel="stylesheet" href="<%=basePath %>/assets/css/bootstrap.css"/>
<link rel="stylesheet" href="<%=basePath %>/assets/css/mainstyle.css"/>
<script type="text/javascript" src="<%=basePath %>/assets/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/assets/function/top.js"></script>
<div class="header">
  <div class="audioSet">
    <img id="music" src="<%=basePath %>/images/audio/unmuted.png">
    <img id="next_music" src="<%=basePath%>/images/audio/nextMusic.jpg">
    <audio id="audio" src="<%=basePath %>/audio/Visions.mp3" autoplay loop></audio>
    <div id="volumeSet">
      <button id="plus"><strong>+</strong></button>
      <button id="subtract"><strong>-</strong></button>
    </div>
  </div>
  <div class="header-right">
    <img src="<%=basePath %>/images/user.jpg">
    <b>&nbsp;用户：<%=admin %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
    <img src="<%=basePath %>/images/identity.jpg">
    <b>&nbsp;身份：<%=identity %>
    </b>
    <a href="<%=basePath%>index.jsp" target="_top"></a>
    <img id="body_logo" src="<%=basePath%>/images/bodylogo.jpg">
    <img src="<%=basePath %>/images/signout.jpg">
    <a onclick="if (confirm('确定要退出吗？')) return true; else return false;"
       href="<%=basePath %>AdminServlet?method=adminexit" target="_top">
      <b id="exit">
        注销退出
      </b>
    </a>
  </div>
  <div id="top_bar"></div>
  <%--  <img src="<%=basePath %>/images/top_down.jpg" style="width: 100%;height: 9px;position: relative;top: 12px">--%>
</div>
