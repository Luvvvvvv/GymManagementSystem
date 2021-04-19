<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=basePath %>/assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=basePath %>/assets/css/picstyle.css"/>
    <script type="text/javascript" src="<%=basePath %>/assets/js/jquery1.9.0.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>/assets/js/sdmenu.js"></script>
    <script type="text/javascript" src="<%=basePath %>/assets/js/laydate.js"></script>
</head>
<%
    String username = (String) session.getAttribute("user");
    String identity = (String) session.getAttribute("identity");
    if (username == null) {
        response.sendRedirect(path + "index.jsp");
    } else {
%>
<body>
<div class="left">

    <script type="text/javascript">
        var myMenu;
        window.onload = function () {
            myMenu = new SDMenu("my_menu");
            myMenu.init();
        };
    </script>

    <div id="my_menu" class="sdmenu">

        <%if (identity.equals("系统管理员")) { %>
        <div class="collapsed">
            <span>健身教练管理</span>
            <a href="<%=basePath %>/admin/systemmanager/manage_coach.jsp" target="MainFrame">健身教练</a>
            <a href="<%=basePath %>/admin/systemmanager/add_coach.jsp?method=addcoach" target="MainFrame">增加健身教练</a>
        </div>

        <div class="collapsed">
            <span>管理人员管理</span>
            <a href="<%=basePath %>/admin/systemmanager/manage_manager.jsp" target="MainFrame">管理人员</a>
            <a href="<%=basePath %>/admin/systemmanager/add_manager.jsp?method=addmanager" target="MainFrame">增加管理人员</a>
        </div>

        <div class="collapsed">
            <span>系统数据管理</span>
            <a href="<%=basePath %>/admin/systemmanager/backup.jsp" target="MainFrame">数据备份管理</a>
            <a href="<%=basePath %>/admin/systemmanager/log.jsp?method=addcoach" target="MainFrame">系统日志管理</a>
        </div>

        <%} else if (identity.equals("管理人员")) { %>
        <div class="collapsed">
            <span>个人信息管理</span>
            <a href="<%=basePath %>/admin/systemmanager/modifypsw.jsp" target="MainFrame">修改密码</a>
            <a href="<%=basePath %>/admin/manager/manager_info.jsp" target="MainFrame">个人信息</a>
        </div>

        <div class="collapsed">
            <span>办卡人员管理</span>
            <a href="<%=basePath %>/admin/manager/manage_card1.jsp" target="MainFrame">办卡人员管理</a>
            <a href="<%=basePath %>/admin/manager/search_card1.jsp" target="MainFrame">办卡人员查询</a>
        </div>

        <div class="collapsed">
            <span>私教课程管理</span>
            <a href="<%=basePath %>/admin/manager/manage_member1.jsp" target="MainFrame">私教课程管理</a>
            <a href="<%=basePath %>/admin/manager/search_member1.jsp" target="MainFrame">私教课程查询</a>
        </div>

        <div class="collapsed">
            <span>通知信息管理</span>
            <a href="<%=basePath %>/admin/manager/add_notice.jsp?method=addnotice" target="MainFrame">增加通知信息</a>
            <a href="<%=basePath %>/admin/manager/manage_notice.jsp" target="MainFrame">通知信息管理</a>
        </div>

        <div class="collapsed">
            <span>文件信息管理</span>
            <a href="<%=basePath %>/admin/manager/add_file.jsp?method=addfiles" target="MainFrame">增加文件信息</a>
            <a href="<%=basePath %>/admin/manager/manage_file.jsp" target="MainFrame">文件信息管理</a>
        </div>

        <div class="collapsed">
            <span>反馈信息管理</span>
            <a href="<%=basePath %>/admin/manager/manage_feedback1.jsp" target="MainFrame">反馈信息管理</a>
            <a href="<%=basePath %>/admin/manager/search_feedback.jsp" target="MainFrame">反馈信息查询</a>
        </div>

        <%} else if (identity.equals("健身教练")) { %>
        <div class="collapsed">
            <span>个人信息管理</span>
            <a href="<%=basePath %>/admin/systemmanager/modifypsw.jsp" target="MainFrame">修改密码</a>
            <a href="<%=basePath %>/admin/coach/coach_info.jsp" target="MainFrame">个人信息</a>
        </div>

        <div class="collapsed">
            <span>办卡人员管理</span>
            <a href="<%=basePath %>/admin/coach/add_card.jsp?method=addcards" target="MainFrame">办卡人员添加</a>
            <a href="<%=basePath %>/admin/coach/manage_card.jsp" target="MainFrame">办卡人员管理</a>
            <a href="<%=basePath %>/admin/coach/search_card.jsp" target="MainFrame">办卡人员查询</a>
        </div>

        <div class="collapsed">
            <span>私教课程管理</span>
            <a href="<%=basePath %>/admin/coach/add_member.jsp?method=addmembers" target="MainFrame">私教课程添加</a>
            <a href="<%=basePath %>/admin/coach/manage_member.jsp" target="MainFrame">私教课程管理</a>
            <a href="<%=basePath %>/admin/coach/search_member.jsp" target="MainFrame">私教课程查询</a>
        </div>

        <div class="collapsed">
            <span>通知文件管理</span>
            <a href="<%=basePath %>/admin/coach/notice.jsp" target="MainFrame">通知信息</a>
            <a href="<%=basePath %>/admin/coach/file.jsp" target="MainFrame">私教课程表</a>
        </div>

        <div class="collapsed">
            <span>反馈信息管理</span>
            <a href="<%=basePath %>/admin/coach/add_feedback.jsp?method=addfeedback" target="MainFrame">提交反馈信息</a>
            <a href="<%=basePath %>/admin/coach/manage_feedback.jsp" target="MainFrame">反馈信息管理</a>
        </div>

        <%} %>

        <div class="collapsed">
            <span>注销退出系统</span>
            <a onclick="if (confirm('确定要退出吗？')) return true; else return false;"
               href="<%=basePath %>AdminServlet?method=adminexit" target="_top">注销退出系统</a>
        </div>
    </div>
</div>
<div class="Switch"></div>

</body>
<%} %>
</html>
