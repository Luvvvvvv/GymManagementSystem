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
  <script type="text/javascript" src="<%=basePath %>/assets/function/BMI_Calculator.js"></script>
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
  <div class="title_right"><strong>BMI计算器</strong></div>
  <div id="main_frame">
    <form action="<%=basePath %>admin/coach/search_card_info.jsp" method="post" name="form1">
      <table class="table table-bordered">
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 20px; left: -22px;"
                 src="<%=basePath %>/images/systemicon/height.jpg">
            身&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高(cm)：
          </td>
          <td>
            <input style="width: 50%" type="text" name="height" class="span3" required/>
          </td>
        </tr>
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 20px; left: -22px;"
                 src="<%=basePath %>/images/systemicon/weight.jpg">
            体&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;重(k&nbsp;g)：
          </td>
          <td>
            <input style="width: 50%" type="text" name="weight" class="span3" required/>
          </td>
        </tr>
        <tr>
          <td class="text-center" colspan="2">
            <input onclick="Cal(this.form)" type="button" value="开始计算" class="btn btn-info" id="confirm"/>
          </td>
        </tr>
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 24px; left: -22px;"
                 src="<%=basePath %>/images/systemicon/ideaweight.jpg">
            理想&nbsp;体重(k&nbsp;g)：
          </td>
          <td>
            <input style="width: 50%" type="text" name="IW" class="span3"/>
          </td>
        </tr>
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 24px; left: -22px;"
                 src="<%=basePath %>/images/systemicon/bmi.jpg">
            B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;M&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I：
          </td>
          <td>
            <input style="width: 50%" type="text" name="BMI" class="span3"/>
          </td>
        </tr>
        <tr>
          <td class="td_frame">
            <img style="position: relative; width: 26px; left: -22px;"
                 src="<%=basePath %>/images/systemicon/conclusion.jpg">
            结&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;论：
          </td>
          <td>
            <span id="conclusion" type="text" class="span3"></span>
          </td>
        </tr>
      </table>
    </form>
  </div>
</div>
</body>
  <%} %>
 
