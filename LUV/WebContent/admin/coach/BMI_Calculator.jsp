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
        } else if(bmi>30){
            document.getElementById('conclusion').innerHTML = '马上开始减肥吧!';
        }else{
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
    <div style="width:900px;margin:auto;">
        <form action="<%=basePath %>admin/coach/search_card_info.jsp" method="post" name="form1">
            <table class="table table-bordered">
                <tr>
                    <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">请输入你的身高（cm）：</td>
                    <td><input type="text" name="height" class="span3" required/></td>
                </tr>
                <tr>
                    <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">请输入你的体重（k g）：</td>
                    <td><input type="text" name="weight" class="span3" required/></td>
                </tr>
                <tr>
                    <td class="text-center" colspan="2">
                        <input onclick="Cal(this.form)" type="button" value="开始计算" class="btn btn-info"
                               style="width:100px;"/>
                    </td>
                </tr>
                <tr>
                    <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">理想体重（k g）：</td>
                    <td><input type="text" name="IW" class="span3"/></td>
                </tr>
                <tr>
                    <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">BMI：</td>
                    <td><input type="text" name="BMI" class="span3"/></td>
                </tr>
                <tr>
                    <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">结论：</td>
                    <td><span id="conclusion" type="text" class="span3"
                              style="border: 3px solid rgb(204, 204, 204);width: 209px;height: 24px;margin-left: 0px"></span>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
    <%} %>
 
