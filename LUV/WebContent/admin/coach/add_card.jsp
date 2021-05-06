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
	
	String admin=(String)session.getAttribute("user"); 
	if(admin==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
		String method=request.getParameter("method");  
		String id="";String name=""; String start="";String end="";String pic="";
		if(method.equals("upcards")){
			id=request.getParameter("id");
			List jlist = cb.get1Com("select * from cards where id='"+id+"'",7);
			name=jlist.get(1).toString();
			start=jlist.get(2).toString();
			end=jlist.get(3).toString();
			pic=jlist.get(4).toString();
		}	  
%>
<body>
<div class="right_cont">
  <div class="title_right"><strong>�쿨��Ա���</strong></div>
  <div id="main_frame">
    <form action="<%=basePath %>UpServlet" method="post" name="form1" enctype="multipart/form-data">
      <table class="table table-bordered">
        <tr>
          <input type="hidden" name="method" value="<%=method%>"/>
          <input type="hidden" name="id" value="<%=id%>"/>
          <td class="td_frame">
            <img style="position: relative; width: 21px; top: 1px; left: -21px;"
                 src="<%=basePath %>/images/systemicon/name.jpg">
            ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����
          </td>
          <td>
            <input style="width: 35%" type="text" name="name" class="span4" value="<%=name %>"/>
          </td>
        </tr>
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 21px; top: 1px; left: -21px;"
                 src="<%=basePath %>/images/systemicon/start.jpg">
            ��ʼʱ�䣺
          </td>
          <td>
            <input style="width: 35%" type="date" name="start" class="span2" value="<%=start %>" required/>
          </td>
        </tr>
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 24px; left: -20px;"
                 src="<%=basePath %>/images/systemicon/end.jpg">
            ����ʱ�䣺
          </td>
          <td>
            <input style="width: 35%" type="date" name="end" class="span2" value="<%=end %>" required/>
          </td>
        </tr>
        <%if (method.equals("upcards")) { %>
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 21px; left: -20px;"
                 src="<%=basePath %>/images/systemicon/uplode.jpg">
            �ϴ���ͬ��
          </td>
          <td>
            <input type=file name="pic" class="span4"/></td>
        </tr>
        <%} else { %>
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 21px; left: -20px;"
                 src="<%=basePath %>/images/systemicon/uplode.jpg">
            �ϴ���ͬ��
          </td>
          <td>
            <input type=file name="pic" class="span4" required/>
          </td>
        </tr>
        <%} %>
        <tr>
          <td class="text-center" colspan="2">
            <input type="submit" value="ȷ��" class="btn btn-info" id="confirm"/>
          </td>
        </tr>
      </table>
    </form>
  </div>
</div>
</body>
<%} %>