<%@ page import="java.util.*" pageEncoding="gb2312" %>
<jsp:useBean id="cb" class="com.bean.ComBean"/>
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
	
	String username=(String)session.getAttribute("user"); 
	if(username==null){
		response.sendRedirect(basePath+"index.jsp");
	}
	else{
		String method=request.getParameter("method");
		String id="";
		String usernam="";String password="";String realname="";String sex="";String age="";String tel="";
		if(method.equals("upmanager")){
			id=request.getParameter("id");
			List alist=cb.get1Com("select * from admin where id='"+id+"'",10);
			usernam=alist.get(1).toString();
			password=alist.get(2).toString();
			realname=alist.get(3).toString();
			sex=alist.get(4).toString();
			age=alist.get(5).toString();
			tel=alist.get(6).toString();
		}
%>
<body>
<div class="right_cont">
  <div class="title_right"><strong>管理人员添加</strong></div>
  <div id="main_frame">
    <form action="<%=basePath %>AdminServlet?method=<%=method%>&id=<%=id%>" method="post" name="form1">
      <table class="table table-bordered">
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 21px; top: 1px; left: -21px;"
                 src="<%=basePath %>/images/systemicon/username.jpg">
            登录帐号：
          </td>
          <td>
            <%if (method.equals("upmanager")) { %>
            <input style="width: 50%" type="text" name="username" class="span4" value="<%=usernam %>" readonly/>
            <%} else { %>
            <input style="width: 50%" type="text" class="span4" name="username" required/><% } %>
          </td>
        </tr>
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 20px; left: -22px;"
                 src="<%=basePath %>/images/systemicon/password.jpg">
            初始密码：
          </td>
          <td>
            <input style="width: 50%" type="password" name="password" class="span4" value="<%=password %>" required/>
          </td>
        </tr>
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 20px; left: -22px;"
                 src="<%=basePath %>/images/systemicon/name.jpg">
            姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：
          </td>
          <td>
            <input style="width: 50%" type="text" name="realname" class="span4" value="<%=realname %>" required/>
          </td>
        </tr>
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 20px; left: -22px;"
                 src="<%=basePath %>/images/systemicon/gender.png">
            性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
          </td>
          <td>
            <input type="radio" name="sex" class="span4" value="男" checked="checked"
                   style="width: 20px;margin-left: 28px;position: relative;top: -3px;"/>
            <b style="font-size:16px;position: relative;">男</b>
            <img style="position: relative;top:-2px;" src="<%=basePath %>/images/male.png"/>
            <input type="radio" name="sex" class="span4" value="女"
                   style="width: 20px;margin-left: 40px;position:relative;top: -3px"/>
            <b style="font-size:16px;position: relative;">女</b>
            <img style="position: relative;top:-2px;" src="<%=basePath %>/images/female.jpg"/>
          </td>
        </tr>
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 20px; top: -1px; left: -22px;"
                 src="<%=basePath %>/images/systemicon/age.jpg">
            年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：
          </td>
          <td><input style="width: 50%" type="number" name="age" class="span4"
                     min="16" max="50" value="<%=age %>" required/></td>
        </tr>
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 20px; top: -1px; left: -22px;"
                 src="<%=basePath %>/images/systemicon/phone.jpg">
            联系电话：
          </td>
          <td>
            <input style="width: 50%" type="text" name="tel" class="span4" value="<%=tel %>" pattern="[0-9]{11}"
                   title="请输入11位数字" oninput="value=value.replace(/[^\d]/g,'')" required/>
          </td>
        </tr>
        <tr>
          <td class="text-center" colspan="2">
            <input type="submit" value="确定" class="btn btn-info" id="confirm"/></td>
        </tr>
      </table>
    </form>
  </div>
</div>
</body>
<%} %>