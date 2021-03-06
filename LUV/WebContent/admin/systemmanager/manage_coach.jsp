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
  <script type="module" src="<%=basePath%>/assets/pagescript/manage_coach.js"></script>
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
		response.sendRedirect(path+"index.jsp");
	}
	else{  
%>
<body>
<div class="right_cont">
  <div class="title_right"><strong>健身教练管理</strong></div>
  <div id="table_frame">
    <form action="" method="post" name="form">
      <table class="table table-bordered table-striped table-hover">
        <tbody>
        <tr id="tr1">
          <td width="150px"><strong>序号</strong></td>
          <td width="300px"><strong>登录帐号</strong></td>
          <td width="150px"><strong>姓名</strong></td>
          <td width="150px"><strong>性别</strong></td>
          <td width="150px"><strong>年龄</strong></td>
          <td width="300px"><strong>联系电话</strong></td>
          <td width="150px"><strong>创建时间</strong></td>
          <td width="100px"><strong>操作</strong></td>
        </tr>
        <%
          cb.setEVERYPAGENUM(8);
          int cou = cb.getMessageCount("select count(*) from admin where identity ='健身教练'");
          String page1 = request.getParameter("page");
          if (page1 == null) {
            page1 = "1";
          }
          session.setAttribute("busMessageCount", cou + "");
          session.setAttribute("busPage", page1);
          List pagelist1 = cb.getMessage(Integer.parseInt(page1), "select * from admin where identity ='健身教练' order by id desc", 9);
          session.setAttribute("qqq", pagelist1);
          int pageCount = cb.getPageCount();
          session.setAttribute("busPageCount", pageCount + "");
          List pagelist3 = (ArrayList) session.getAttribute("qqq");
          if (!pagelist3.isEmpty()) {
            for (int i = 0; i < pagelist3.size(); i++) {
              List pagelist2 = (ArrayList) pagelist3.get(i);
        %>
        <tr id="tr2">
          <td nowrap="nowrap"><%=i + 1 %>
          </td>
          <td nowrap="nowrap"><%=pagelist2.get(1).toString() %>
          </td>
          <td nowrap="nowrap"><%=pagelist2.get(3).toString() %>
          </td>
          <td nowrap="nowrap"><%=pagelist2.get(4).toString() %>
          </td>
          <td nowrap="nowrap"><%=pagelist2.get(5).toString() %>
          </td>
          <td nowrap="nowrap"><%=pagelist2.get(6).toString() %>
          </td>
          <td nowrap="nowrap"><%=pagelist2.get(7).toString() %>
          </td>
          <td nowrap="nowrap">
            <div id="modifySet">
              <a href="<%=basePath%>admin/systemmanager/add_coach.jsp?method=upcoach&id=<%=pagelist2.get(0).toString()%>"
                 id="modify">修改</a>
            </div>
            <div id="deleteSet">
              <a href="<%=basePath%>AdminServlet?method=delcoach&id=<%=pagelist2.get(0).toString()%>" id="delete">删除</a>
            </div>
          </td>
        </tr>
        <% }
        } %>
        <tr style="text-align: center">
          <td nowrap="nowrap" colspan="11">
            <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>"/>
            <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>"/>
            <a href="#" id="home">首页</a>&nbsp;&nbsp;&nbsp;
            <a href="#" id="pre">上一页</a>&nbsp;&nbsp;&nbsp;
            共&nbsp;<u>&nbsp;<%=session.getAttribute("busMessageCount").toString()%>&nbsp;</u>&nbsp;条记录，共计
            <u>&nbsp;<%=session.getAttribute("busPageCount").toString()%>&nbsp;</u>
            页，当前第&nbsp;<u>&nbsp;<%=session.getAttribute("busPage").toString()%>&nbsp;</u>&nbsp;页&nbsp;&nbsp;&nbsp;
            <a href="#" id="next">下一页</a>&nbsp;&nbsp;&nbsp;
            <a href="#" id="last">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;
            第&nbsp;<input style="width: 20px" name="busjump" type="text" class="span1"/>&nbsp;页
            <a href="#" id="jump">跳转</a>
          </td>
        </tr>
        </tbody>
      </table>
    </form>
  </div>
</div>
</body>
  <%} %>
