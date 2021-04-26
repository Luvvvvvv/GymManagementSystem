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
  <link rel="stylesheet" href="<%=basePath %>assets/css/bootstrap.css"/>
  <link rel="stylesheet" href="<%=basePath %>assets/css/picstyle.css"/>
  <script type="text/javascript" src="<%=basePath %>assets/js/jquery1.9.0.min.js"></script>
  <script type="text/javascript" src="<%=basePath %>assets/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="<%=basePath %>assets/js/sdmenu.js"></script>
  <script type="text/javascript" src="<%=basePath %>assets/js/laydate.js"></script>
  <script type="text/javascript" src="http://localhost:8080/LUV_Web_exploded/assets/js/echarts.js"></script>
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
  <div class="title_right"><strong>健身卡办卡时长饼状图</strong></div>
  <div style="width:100%;margin:auto;display: none">
    <form action="" method="post" name="form3">
      <table class="table table-bordered table-striped table-hover">
        <tbody id="card">
        <%
          cb.setEVERYPAGENUM(1000);
          int cou = cb.getMessageCount("select count(*) from cards ");
          String page1 = request.getParameter("page");
          if (page1 == null) {
            page1 = "1";
          }
          session.setAttribute("busMessageCount", cou + "");
          session.setAttribute("busPage", page1);
          List pagelist1 = cb.getMessage(Integer.parseInt(page1), "select * from cards order by id desc", 7);
          session.setAttribute("qqq", pagelist1);
          int pageCount = cb.getPageCount();
          session.setAttribute("busPageCount", pageCount + "");
          List pagelist3 = (ArrayList) session.getAttribute("qqq");
          if (!pagelist3.isEmpty()) {
            for (int i = 0; i < pagelist3.size(); i++) {
              List pagelist2 = (ArrayList) pagelist3.get(i);
        %>
        <tr align="center">
          <td nowrap="nowrap" class="endTime"><%=pagelist2.get(3).toString() %>
          </td>
          <td nowrap="nowrap"><%=pagelist2.get(6).toString() %>
          </td>
        </tr>
        <% }
        } %>
        </tbody>
      </table>
    </form>
  </div>
</div>
<div id="pieChart" style="width:550px;height: 550px;top:-25px;left:390px"></div>
<script type="text/javascript">

  var dayArr = [];
  var dayBelowThreeMonthArr = [];
  var dayoneYear = [];
  var dayTwoYear = [];
  var dayAboveTwoYearArr = [];
  $(function () {
    $('#card tr').each(function () {
      var endTime = $(this).children('td').eq(0).text();
      var applyTime = $(this).children('td').eq(1).text();
      var endTimes = Date.parse(endTime);
      var applyTimes = Date.parse(applyTime);
      var leftTimes = endTimes - applyTimes;
      var leftDays = parseInt(leftTimes / 1000 / 60 / 60 / 24);
      dayArr.push(leftDays);
    });

    for (var i = 0; i < dayArr.length; i++) {
      if (dayArr[i] >= 0 && dayArr[i] <= 90) {
        dayBelowThreeMonthArr.push(dayArr[i]);
      }
    }
    for (var i = 0; i < dayArr.length; i++) {
      if (dayArr[i] > 90 && dayArr[i] <= 365) {
        dayoneYear.push(dayArr[i]);
      }
    }
    for (var i = 0; i < dayArr.length; i++) {
      if (dayArr[i] > 365 && dayArr[i] <= 730) {
        dayTwoYear.push(dayArr[i]);
      }
    }
    for (var i = 0; i < dayArr.length; i++) {
      if (dayArr[i] >= 730) {
        dayAboveTwoYearArr.push(dayArr[i]);
      }
    }

    // 饼状图
    var chartDom = document.getElementById('pieChart');
    var myChart = echarts.init(chartDom);
    var option;

    option = {
      tooltip: {
        trigger: 'item'
      },
      legend: {
        top: '5%',
        left: 'center'
      },
      series: [{
        name: '健身卡办卡时长',
        type: 'pie',
        radius: ['40%', '70%'],
        avoidLabelOverlap: false,
        itemStyle: {
          borderRadius: 10,
          borderColor: '#fff',
          borderWidth: 2
        },
        label: {
          show: false,
          position: 'center'
        },
        emphasis: {
          label: {
            show: true,
            fontSize: '40',
            fontWeight: 'bold'
          }
        },
        labelLine: {
          show: false
        },
        data: [
          {
            value: dayBelowThreeMonthArr.length,
            name: '3个月以下'
          },
          {
            value: dayoneYear.length,
            name: '3个月~1年'
          },
          {
            value: dayTwoYear.length,
            name: '1年~2年'
          },
          {
            value: dayAboveTwoYearArr.length,
            name: '2年以上'
          },
        ]
      }]
    };
    myChart.setOption(option);
  });

</script>
</body>
  <%} %>
