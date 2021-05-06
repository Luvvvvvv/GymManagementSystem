<%@ page contentType="text/html;charset=gb2312" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <link rel="stylesheet" href="<%=basePath %>/assets/css/bootstrap.css"/>
  <link rel="stylesheet" href="<%=basePath %>/assets/css/picstyle.css"/>
  <script type="text/javascript" src="<%=basePath %>/assets/js/jquery1.9.0.min.js"></script>
  <script type="text/javascript" src="<%=basePath %>/assets/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="<%=basePath %>/assets/function/modifypsw.js"></script>
</head>
  <%
String message = (String)request.getAttribute("message");
	if(message == null){
			message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>
  <%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(basePath+"/error.jsp");
	}
	else{ 
%>
<body>
<div class="right_cont">
  <div class="title_right"><strong>密码信息管理</strong></div>
  <div id="main_frame">
    <form action="<%=basePath %>AdminServlet?method=uppwd" method="post" name="form1">
      <table class="table table-bordered">
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 24px; left: -21px;"
                 src="<%=basePath %>/images/systemicon/old.jpg">
            旧&nbsp;&nbsp;密&nbsp;&nbsp;码：
          </td>
          <td>
            <input style="width: 50%" type="password" name="oldpwd" class="span3" required/>
          </td>
        </tr>
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 25px; left: -21px;"
                 src="<%=basePath %>/images/systemicon/new.jpg">
            新&nbsp;&nbsp;密&nbsp;&nbsp;码：
          </td>
          <td>
            <input style="width: 50%" type="password" name="newpwd" id="newpwd"
                   onchange="checkPasswords()" class="span3" required/>
          </td>
        </tr>
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 21px; left: -20px;"
                 src="<%=basePath %>/images/systemicon/confirm.jpg">
            确认&nbsp;密码：
          </td>
          <td>
            <input style="width: 50%" type="password" name="repwd" id="repwd"
                   onchange="checkPasswords()" class="span3" required/>
          </td>
        </tr>
        <tr>
          <td class="text-center" colspan="2">
            <input type="submit" value="确定" class="btn btn-info" id="confirm"/>
          </td>
        </tr>
      </table>
    </form>
  </div>
</div>
</body>
  <%} %>
 
