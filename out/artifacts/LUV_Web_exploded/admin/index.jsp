<%@ page contentType="text/html;charset=gb2312" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
  <meta http-equiv=Content-Type content="text/html; charset=gb2312">
</head>
  <%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/index.jsp");
	}
	else{ 		
%>
<frameset border=0 frameSpacing=0 rows="83, *" frameBorder=0>
  <frame name=header src="<%=basePath %>/admin/iframe/top.jsp" frameBorder=0 noResize scrolling=no>
  <frameset cols="225, *">
    <frame name=menu src="<%=basePath %>/admin/iframe/left.jsp" frameBorder=0 noResize>
    <frame name=MainFrame src="<%=basePath %>/admin/iframe/main.jsp" frameBorder=0 noResize scrolling=yes>
  </frameset>
</frameset>
  <%} %>
