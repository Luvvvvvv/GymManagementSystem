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
  var BMI = {};
  BMI.getBMI = function (a, b) {
    var bmi = b / ((a / 100) * (a / 100));
    return bmi;
  };
  BMI.idealweight = function (a) {
    var x = (a - 100) * 0.9;
    return x;
  };

  function Cal(form) {
    var a = eval(form.height.value);
    var b = eval(form.weight.value);
    var bmiValue = BMI.getBMI(a, b);
    BMI.disp_alert(bmiValue);
    form.IW.value = BMI.idealweight(a);
    form.BMI.value = bmiValue;
  }

  BMI.disp_alert = function (bmi) {
    if (bmi < 18.5) {
      document.getElementById('conclusion').innerHTML = '你的体重太轻,要多吃点哟!';
    } else if (bmi >= 18.5 && bmi < 25) {
      document.getElementById('conclusion').innerHTML = '你的体重正常,要继续保持哟!';
    } else if (bmi >= 25 && bmi < 30) {
      document.getElementById('conclusion').innerHTML = '你的体重过重,要减肥了!';
    } else if (bmi > 30) {
      document.getElementById('conclusion').innerHTML = '马上开始减肥吧!';
    } else {
      document.getElementById('conclusion').innerHTML = '请输入身高和体重!';
    }
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
  <div class="title_right"><strong>BMI计算器</strong></div>
  <div style="width:60%; margin:auto;">
    <form action="<%=basePath %>admin/coach/search_card_info.jsp" method="post" name="form1">
      <table class="table table-bordered">
        <tr style="height: 28px;font-size: 14px">
          <td style="text-align: right; background-color: #f1f1f1; width: 40%">
            <img style="position: relative; width: 20px; left: -22px;"
                 src="<%=basePath %>/images/systemicon/height.jpg">
            身&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高(cm)：
          </td>
          <td>
            <input style="width: 50%" type="text" name="height" class="span3" required/>
          </td>
        </tr>
        <tr style="height: 28px;font-size: 14px">
          <td style="text-align: right; background-color: #f1f1f1; width: 40%">
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
            <input onclick="Cal(this.form)" type="button" value="开始计算" class="btn btn-info" style="width:100px;background: #6eacff"/>
          </td>
        </tr>
        <tr style="height: 28px;font-size: 14px">
          <td style="text-align: right; background-color: #f1f1f1; width: 40%">
            <img style="position: relative; width: 24px; left: -22px;"
                 src="<%=basePath %>/images/systemicon/ideaweight.jpg">
            理想&nbsp;体重(k&nbsp;g)：
          </td>
          <td>
            <input style="width: 50%" type="text" name="IW" class="span3"/>
          </td>
        </tr>
        <tr style="height: 28px;font-size: 14px">
          <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">
            <img style="position: relative; width: 24px; left: -22px;"
                 src="<%=basePath %>/images/systemicon/bmi.jpg">
            B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;M&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I：
          </td>
          <td>
            <input style="width: 50%" type="text" name="BMI" class="span3"/>
          </td>
        </tr>
        <tr style="height: 28px;font-size: 14px">
          <td style="text-align: right; background-color: #f1f1f1; width: 40%">
            <img style="position: relative; width: 26px; left: -22px;"
                 src="<%=basePath %>/images/systemicon/conclusion.jpg">
            结&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;论：
          </td>
          <td>
            <span id="conclusion" type="text" class="span3"
                  style="border: 3px solid #ff9e9e;width: 51%;height: 24px;margin-left: 0px;"></span>
          </td>
        </tr>
      </table>
    </form>
  </div>
</div>
</body>
  <%} %>
 
