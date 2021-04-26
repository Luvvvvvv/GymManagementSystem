<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <link rel="stylesheet" href="<%=basePath %>assets/css/bootstrap.css"/>
  <link rel="stylesheet" href="<%=basePath %>assets/css/picstyle.css"/>
  <script type="text/javascript" src="<%=basePath %>assets/js/jquery1.9.0.min.js"></script>
  <script type="text/javascript" src="<%=basePath %>assets/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="<%=basePath %>assets/js/sdmenu.js"></script>
  <script type="text/javascript" src="<%=basePath %>assets/js/laydate.js"></script>
</head>
<script type="text/javascript">
  function check() {
    if (document.form1.oldpwd.value == "") {
      alert("请输入旧密码");
      document.form1.oldpwd.focus();
      return false;
    }
    if (document.form1.newpwd.value == "") {
      alert("请输入新密码");
      document.form1.newpwd.focus();
      return false;
    }
    if (document.form1.repwd.value == "") {
      alert("请确认密码");
      document.form1.repwd.focus();
      return false;
    }
    if (document.form1.repwd.value != document.form1.newpwd.value) {
      alert("两次输入的密码不相同，请确认密码");
      document.form1.repwd.focus();
      return false;
    }
  }

  function checkPasswords() {
    var pass1 = document.getElementById("newpwd");
    var pass2 = document.getElementById("repwd");

    if (pass2.value != pass1.value)
      pass2.setCustomValidity("两次输入的密码不匹配");
    else
      pass2.setCustomValidity("");
  }
</script>
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
  <div style="width:60%; margin:auto;">
    <form action="<%=basePath %>AdminServlet?method=uppwd" method="post" name="form1">
      <table class="table table-bordered">
        <tr style="height: 28px;font-size: 14px">
          <td style="text-align: right; background-color: #f1f1f1; width: 40%">
            <img style="position: relative; width: 24px; left: -21px;"
                 src="<%=basePath %>/images/systemicon/old.jpg">
            旧&nbsp;&nbsp;密&nbsp;&nbsp;码：
          </td>
          <td>
            <input style="width: 50%" type="password" name="oldpwd" class="span3" required/>
          </td>
        </tr>
        <tr style="height: 28px;font-size: 14px">
          <td style="text-align: right; background-color: #f1f1f1">
            <img style="position: relative; width: 25px; left: -21px;"
                 src="<%=basePath %>/images/systemicon/new.jpg">
            新&nbsp;&nbsp;密&nbsp;&nbsp;码：
          </td>
          <td>
            <input style="width: 50%" type="password" name="newpwd" id="newpwd" onchange="checkPasswords()"
                   class="span3" required/>
          </td>
        </tr>
        <tr style="height: 28px;font-size: 14px">
          <td style="text-align: right; background-color: #f1f1f1">
            <img style="position: relative; width: 21px; left: -20px;"
                 src="<%=basePath %>/images/systemicon/confirm.jpg">
            确认&nbsp;密码：
          </td>
          <td>
            <input style="width: 50%" type="password" name="repwd" id="repwd" onchange="checkPasswords()" class="span3"
                   required/>
          </td>
        </tr>
        <tr>
          <td class="text-center" colspan="2">
            <input type="submit" value="确定" class="btn btn-info" style="width:100px;background: #6eacff"/></td>
        </tr>
      </table>
    </form>
  </div>
</div>
</body>
  <%} %>
 
