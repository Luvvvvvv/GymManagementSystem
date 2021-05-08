<%@ page import="java.util.*,com.util.*" contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cb" class="com.bean.ComBean"/>
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
  <script type="text/javascript" src="<%=basePath %>/assets/function/cardcheck.js"></script>
  <script type="module" src="<%=basePath %>/assets/pagescript/search_card_info.js"></script>
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
  <div class="title_right"><strong>�쿨��Ա����</strong></div>
  <div id="table_frame">
    <form action="" method="post" name="form">
      <table class="table table-bordered">
        <tbody id="card">
        <tr id="tr1">
          <td width="80px"><strong>���</strong></td>
          <td width="80px"><strong>����</strong></td>
          <td width="150px"><strong>��ʼʱ��</strong></td>
          <td width="150px"><strong>����ʱ��</strong></td>
          <td width="150px"><strong>ǩ����ͬ����</strong></td>
          <td width="80px"><strong>�쿨������</strong></td>
          <td width="150px"><strong>����ʱ��</strong></td>
          <td width="80px"><strong>����</strong></td>
        </tr>
        <% String word = Common.toChineseAndTrim(request.getParameter("word"));
          cb.setEVERYPAGENUM(8);
          int cou = cb.getMessageCount("select count(*) from cards where name like '%" + word + "%' and users='" + username + "'");
          String page1 = request.getParameter("page");
          if (page1 == null) {
            page1 = "1";
          }
          session.setAttribute("busMessageCount", cou + "");
          session.setAttribute("busPage", page1);
          List pagelist1 = cb.getMessage(Integer.parseInt(page1), "select * from cards where name like '%" + word + "%' and users='" + username + "' order by id desc", 7);
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
          <td nowrap="nowrap"><%=pagelist2.get(2).toString() %>
          </td>
          <td nowrap="nowrap"><%=pagelist2.get(3).toString() %>
          </td>
          <td nowrap="nowrap" id="downloadSet">
            <a href="<%=basePath%>down.jsp?url=<%=pagelist2.get(4).toString()%>" id="download">����</a>
          </td>
          <td nowrap="nowrap"><%=pagelist2.get(5).toString() %>
          </td>
          <td nowrap="nowrap"><%=pagelist2.get(6).toString() %>
          </td>
          <td nowrap="nowrap">
            <div id="modifySet">
              <a href="<%=basePath%>admin/coach/add_card.jsp?method=upcards&id=<%=pagelist2.get(0).toString()%>"
                 id="modify">�޸�</a>
            </div>
            <div id="deleteSet">
              <a href="<%=basePath%>ComServlet?method=delcards&id=<%=pagelist2.get(0).toString()%>" id="delete">ɾ��</a>
            </div>
          </td>
        </tr>
        <% }
        } %>
        <tr style="text-align: center">
          <td nowrap="nowrap" colspan="20">
            <input type="hidden" name="word" value="<%=word%>"/>
            <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>"/>
            <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>"/>
            <a href="#" id="home">��ҳ</a>&nbsp;&nbsp;&nbsp;
            <a href="#" id="pre">��һҳ</a>&nbsp;&nbsp;&nbsp;
            ��&nbsp;<u>&nbsp;<%=session.getAttribute("busMessageCount").toString()%>&nbsp;</u>&nbsp;����¼������
            <u>&nbsp;<%=session.getAttribute("busPageCount").toString()%>&nbsp;</u>
            ҳ����ǰ��&nbsp;<u>&nbsp;<%=session.getAttribute("busPage").toString()%>&nbsp;</u>&nbsp;ҳ&nbsp;&nbsp;&nbsp;
            <a href="#" id="next">��һҳ</a>&nbsp;&nbsp;&nbsp;
            <a href="#" id="last">βҳ</a>&nbsp;&nbsp;&nbsp;&nbsp;
            ��&nbsp;<input style="width: 20px" name="busjump" type="text" class="span1"/>&nbsp;ҳ
            <a href="#" id="jump">��ת</a>&nbsp;&nbsp;&nbsp;
          </td>
        </tr>
        </tbody>
      </table>
    </form>
  </div>
</div>
<div id="alterBar">
  <div id="remind">
    <div class="remindBar">
      <div id="yellow"></div>
      <div class="remindText">ʣ����������7��</div>
    </div>
    <div class="remindBar">
      <div id="red"></div>
      <div class="remindText">�ѹ���</div>
    </div>
  </div>
  <div id="alert">
    <span id="alterCardText">����<strong style="color: red">С��7��</strong>��ʾ��</span>
    <div id="willBeOutdate">
    </div>
  </div>
  <div id="alterBar1">
    <div id="dateText">��ǰ������ʱ����</div>
    <div id="dateBar">
      <div id="yearNow"></div>
      <div id="dateNow"></div>
      <div id="timeNow"></div>
    </div>
  </div>
</div>
</body>
  <%} %>
