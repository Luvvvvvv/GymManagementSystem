<%@ page import="java.util.*" contentType="text/html;charset=gb2312" %>
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
  <link rel="stylesheet" href="<%=basePath %>/assets/css/mainstyle.css"/>
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
	
	String admin=(String)session.getAttribute("user"); 
	if(admin==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
		String method=request.getParameter("method");  
		String id="";String title="";String pic="";String description=""; 
		if(method.equals("upfiles")){
			id=request.getParameter("id");
			List jlist = cb.get1Com("select * from files where id='"+id+"'",4);
			title=jlist.get(1).toString(); 
			pic=jlist.get(2).toString();  
			description=jlist.get(3).toString();  
		}
%>
<body>
<div class="right_cont">
  <div class="title_right"><strong>文件信息增加</strong></div>
  <div id="main_frame">
    <form action="<%=basePath %>UpServlet" method="post" name="form1" enctype="multipart/form-data">
      <table class="table table-bordered">
        <tr>
          <input type="hidden" name="method" value="<%=method%>"/>
          <input type="hidden" name="id" value="<%=id%>"/>
          <td class="td_frame">
            <img style="position: relative; width: 21px; left: -22px;"
                 src="<%=basePath %>/images/systemicon/filetitle.jpg">
            文件名称：
          </td>
          <td>
            <input type="text" name="title" class="span4" value="<%=title %>" required/>
          </td>
        </tr>
        <%if (method.equals("upfiles")) { %>
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 20px; left: -22px;"
                 src="<%=basePath %>/images/systemicon/uplode.jpg">
            上传文件：
          </td>
          <td>
            <input type=file name="pic" class="span4"/></td>
        </tr>
        <%} else { %>
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 20px; left: -21px;"
                 src="<%=basePath %>/images/systemicon/uplode.jpg">
            上传文件：
          </td>
          <td>
            <input type=file name="pic" class="span4" required/>
          </td>
        </tr>
        <%} %>
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 22px; left: -21px;"
                 src="<%=basePath %>/images/systemicon/file.jpg">
            文件说明：
          </td>
          <td>
            <textarea name="description" cols="100" class="span4" rows="5" required><%=description%></textarea>
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