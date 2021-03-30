<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=basePath %>/images/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=basePath %>/images/css/css.css"/>
    <script type="text/javascript" src="<%=basePath %>/images/js/jquery1.9.0.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>/images/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>/images/js/sdmenu.js"></script>
    <script type="text/javascript" src="<%=basePath %>/images/js/laydate/laydate.js"></script>


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
		String id="";String name="";String content="";String objective="";String number="";String pic="";
		if(method.equals("upmembers")){
			id=request.getParameter("id");
			List jlist = cb.get1Com("select * from members where id='"+id+"'",8);
			name=jlist.get(1).toString();
			content=jlist.get(2).toString();
			objective=jlist.get(3).toString();
			number=jlist.get(4).toString();
			pic=jlist.get(5).toString();
		}	  
%>
<body>
<div class="right_cont">
    <div class="title_right"><strong>私教课程管理</strong></div>
    <div style="width:900px;margin:auto;">
        <form action="<%=basePath %>UpServlet" method="post" name="form1" enctype="multipart/form-data">
            <table class="table table-bordered">
                <tr><input type="hidden" name="method" value="<%=method%>"/>
                    <input type="hidden" name="id" value="<%=id%>"/>
                    <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">学员姓名：</td>
                    <td><input type="text" name="name" class="span4" value="<%=name %>"/></td>
                </tr>
                <tr>
                    <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">课程内容：</td>
                    <td><input type="text" name="content" class="span4" value="<%=content %>" required/></td>
                </tr>
                <tr>
                    <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">课程目标：</td>
                    <td><input type="text" name="objective" class="span4" value="<%=objective %>" required/></td>
                </tr>

                <tr>
                    <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">课程节数：</td>
                    <td><input type="text" name="number" class="span2" value="<%=number %>" required/></td>
                </tr>
                <%if (method.equals("upmembers")) { %>
                <tr>
                    <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">上传私教合同：</td>
                    <td><input type=file name="pic" class="span4"/></td>
                </tr>
                <%} else { %>
                <tr>
                    <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">上传私教合同：</td>
                    <td><input type=file name="pic" class="span4" required/></td>
                </tr>
                <%} %>
                <tr>
                    <td class="text-center" colspan="2"><input type="submit" value="确定" class="btn btn-info  "
                                                               style="width:100px;"/></td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
    <%} %>