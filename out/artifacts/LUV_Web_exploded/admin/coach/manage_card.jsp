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
</head>
<script language="javascript">
  function top2() {
    form3.action = "<%=basePath%>admin/coach/manage_card.jsp?page=1";
    form3.submit();
  }

  function last2() {
    if (form3.pageCount.value == 0) {
      form3.action = "<%=basePath%>admin/coach/manage_card.jsp?page=1";
      form3.submit();
    } else {
      form3.action = "<%=basePath%>admin/coach/manage_card.jsp?page=" + form3.pageCount.value;
      form3.submit();
    }
  }

  function pre2() {
    var page = parseInt(form3.page.value);
    if (page <= 1) {
      alert("已至第一页");
    } else {
      form3.action = "<%=basePath%>admin/coach/manage_card.jsp?page=" + (page - 1);
      form3.submit();
    }
  }

  function next2() {
    var page = parseInt(form3.page.value);
    var pageCount = parseInt(form3.pageCount.value);
    if (page >= pageCount) {
      alert("已至最后一页");
    } else {
      form3.action = "<%=basePath%>admin/coach/manage_card.jsp?page=" + (page + 1);
      form3.submit();
    }
  }

  function bjump2() {
    var pageCount = parseInt(form3.pageCount.value);
    if (fIsNumber(form3.busjump.value, "1234567890") != 1) {
      alert("跳转文本框中只能输入数字!");
      form3.busjump.select();
      form3.busjump.focus();
      return false;
    }
    if (form3.busjump.value > pageCount) {
      if (pageCount == 0) {
        form3.action = "<%=basePath%>admin/coach/manage_card.jsp?page=1";
        form3.submit();
      } else {
        form3.action = "<%=basePath%>admin/coach/manage_card.jsp?page=" + pageCount;
        form3.submit();
      }
    } else if (form3.busjump.value <= pageCount) {
      var page = parseInt(form3.busjump.value);
      if (page == 0) {
        page = 1;
        form3.action = "<%=basePath%>admin/coach/manage_card.jsp?page=" + page;
        form3.submit();
      } else {
        form3.action = "<%=basePath%>admin/coach/manage_card.jsp?page=" + page;
        form3.submit();
      }

    }

  }

  function fIsNumber(sV, sR) {
    var sTmp;
    if (sV.length == 0) {
      return (false);
    }
    for (var i = 0; i < sV.length; i++) {
      sTmp = sV.substring(i, i + 1);
      if (sR.indexOf(sTmp, 0) == -1) {
        return (false);
      }
    }
    return (true);
  }

  function del() {
    pageform.submit();
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
	
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{  
%>
<body>
<div class="right_cont">
  <div class="title_right"><strong>办卡人员管理</strong></div>
  <div style="width:95%; margin:auto;">
    <form action="" method="post" name="form3">
      <table class="table table-bordered table-striped table-hover">
        <tbody id="card">
        <tr style="text-align: center;height: 40px;font-size: 16px;">
          <td width="80px"><strong>序号</strong></td>
          <td width="80px"><strong>姓名</strong></td>
          <td width="150px"><strong>开始时间</strong></td>
          <td width="150px"><strong>结束时间</strong></td>
          <td width="150px"><strong>签卡合同下载</strong></td>
          <td width="80px"><strong>办卡负责人</strong></td>
          <td width="150px"><strong>申请时间</strong></td>
          <td width="80px"><strong>操作</strong></td>
        </tr>
        <%
          cb.setEVERYPAGENUM(8);
          int cou = cb.getMessageCount("select count(*) from cards where users='" + username + "'");
          String page1 = request.getParameter("page");
          if (page1 == null) {
            page1 = "1";
          }
          session.setAttribute("busMessageCount", cou + "");
          session.setAttribute("busPage", page1);
          List pagelist1 = cb.getMessage(Integer.parseInt(page1), "select * from cards where users='" + username + "' order by id desc", 7);
          session.setAttribute("qqq", pagelist1);
          int pageCount = cb.getPageCount();
          session.setAttribute("busPageCount", pageCount + "");
          List pagelist3 = (ArrayList) session.getAttribute("qqq");
          if (!pagelist3.isEmpty()) {
            for (int i = 0; i < pagelist3.size(); i++) {
              List pagelist2 = (ArrayList) pagelist3.get(i);
        %>
        <tr style="text-align: center;height: 28px;font-size: 14px;">
          <td nowrap="nowrap"><%=i + 1 %>
          </td>
          <td nowrap="nowrap"><%=pagelist2.get(1).toString() %>
          </td>
          <td nowrap="nowrap"><%=pagelist2.get(2).toString() %>
          </td>
          <td nowrap="nowrap" id="endTime"><%=pagelist2.get(3).toString() %>
          </td>
          <td nowrap="nowrap"><a href="<%=basePath%>down.jsp?url=<%=pagelist2.get(4).toString()%>">下载</a>
          </td>
          <td nowrap="nowrap"><%=pagelist2.get(5).toString() %>
          </td>
          <td nowrap="nowrap"><%=pagelist2.get(6).toString() %>
          </td>
          <td nowrap="nowrap">
            <a href="<%=basePath%>admin/coach/add_card.jsp?method=upcards&id=<%=pagelist2.get(0).toString()%>">修改</a>
            <a href="<%=basePath%>ComServlet?method=delcards&id=<%=pagelist2.get(0).toString()%>">删除</a>
          </td>
        </tr>
        <% }
        } %>
        <tr style="text-align: center">
          <td nowrap="nowrap" colspan="11">
            <input type="hidden" name="pageCount"
                   value="<%= session.getAttribute("busPageCount").toString()%>"/>
            <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>"/>
            <a href="#" onClick="top2()">首页</a>&nbsp;&nbsp;&nbsp;
            <a href="#" onClick="pre2()">上一页</a>&nbsp;&nbsp;&nbsp;
            共&nbsp;<u>&nbsp;<%=session.getAttribute("busMessageCount").toString()%>&nbsp;</u>&nbsp;条记录，共计
            <u>&nbsp;<%=session.getAttribute("busPageCount").toString()%>&nbsp;</u>
            页，当前第&nbsp;<u>&nbsp;<%=session.getAttribute("busPage").toString()%>&nbsp;</u>&nbsp;页&nbsp;&nbsp;&nbsp;
            <a href="#" onClick="next2()">下一页</a>&nbsp;&nbsp;&nbsp;
            <a href="#" onClick="last2()">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;
            第&nbsp;<input style="width: 20px" name="busjump" type="text" class="span1"/>&nbsp;页
            <a href="#" onClick="bjump2()">跳转</a>
          </td>
        </tr>
        </tbody>
      </table>
    </form>
  </div>
</div>

<div style="width: 500px; position: relative;left: 580px;">
  <div style="position: absolute; left: -342px">
    <span style="font-size: 20px;">当前日期与时间:</span>
    <div id="timeNow"
         style=" border: 3px solid grey;font-size: 15px;position: absolute;
         display: inline-block;padding: 10px;width: 120px;margin-left: 12px;border-radius: 20px;background: antiquewhite;">
    </div>
  </div>
  <span style="font-size: 20px;">健身卡<strong style="color: red">小于7天</strong>提示：</span>
  <div id="willBeOutdate"
       style=" border: 3px solid grey;font-size: 15px;position: absolute;display: inline-block;padding: 10px;border-radius: 20px;background: antiquewhite;">
  </div>
</div>

<script type="text/javascript">
  $(function () {
    var nowTime = new Date();
    var nowTimes = nowTime.getTime().valueOf()
    var timeArr = [];

    $('#card tr').each(function () {
      var endTime = $(this).children('td').eq(3).text();
      var endTimes = Date.parse(endTime);
      var timeLeft = endTimes - nowTimes;
      var timeLeftday = parseInt(timeLeft / 1000 / 60 / 60 / 24);
      timeArr.push(timeLeftday);
    });
    var arrLength = timeArr.length - 1;
    var time = timeArr.slice(1, arrLength);
    for (var i = 0; i < time.length; i++) {
      if (time[i] < 7) {
        console.log((i + 1) + '号健身卡,' + '剩余' + time[i] + '天');
        document.getElementById('willBeOutdate').innerHTML += (i + 1) + '号健身卡&nbsp;&nbsp;-----------------&nbsp;&nbsp;' + '剩余' + time[i] + '天<br>';
      }
    }

    function dateFormat(fmt, date) {
      let ret;
      const opt = {
        "Y+": date.getFullYear().toString(),        // 年
        "m+": (date.getMonth() + 1).toString(),     // 月
        "d+": date.getDate().toString(),            // 日
        "H+": date.getHours().toString(),           // 时
        "M+": date.getMinutes().toString(),         // 分
        "S+": date.getSeconds().toString()          // 秒
      };
      for (let k in opt) {
        ret = new RegExp("(" + k + ")").exec(fmt);
        if (ret) {
          fmt = fmt.replace(ret[1], (ret[1].length == 1) ? (opt[k]) : (opt[k].padStart(ret[1].length, "0")))
        }
        ;
      }
      ;
      return fmt;
    }

    setInterval(function () {
      var date = new Date();
      var now = dateFormat('YYYY年mm月dd日' + 'HH:MM:SS', date)
      var txt = document.getElementById('timeNow');
      txt.innerHTML = now;
    }, 1000);

  });
</script>
</body>
  <%} %>
