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

        <%if (identity.equals("ϵͳ����Ա")) { %>
        <div class="collapsed">
            <span>�����������</span>
            <a href="<%=basePath %>/admin/systemmanager/manage_coach.jsp" target="MainFrame">�������</a>
            <a href="<%=basePath %>/admin/systemmanager/add_coach.jsp?method=addcoach" target="MainFrame">���ӽ������</a>
        </div>

        <div class="collapsed">
            <span>������Ա����</span>
            <a href="<%=basePath %>/admin/systemmanager/manage_manager.jsp" target="MainFrame">������Ա</a>
            <a href="<%=basePath %>/admin/systemmanager/add_manager.jsp?method=addmanager" target="MainFrame">���ӹ�����Ա</a>
        </div>

        <div class="collapsed">
            <span>ϵͳ���ݹ���</span>
            <a href="<%=basePath %>/admin/systemmanager/backup.jsp" target="MainFrame">���ݱ��ݹ���</a>
            <a href="<%=basePath %>/admin/systemmanager/log.jsp?method=addcoach" target="MainFrame">ϵͳ��־����</a>
        </div>

        <%} else if (identity.equals("������Ա")) { %>
        <div class="collapsed">
            <span>������Ϣ����</span>
            <a href="<%=basePath %>/admin/systemmanager/modifypsw.jsp" target="MainFrame">�޸�����</a>
            <a href="<%=basePath %>/admin/manager/manager_info.jsp" target="MainFrame">������Ϣ</a>
        </div>

        <div class="collapsed">
            <span>�쿨��Ա����</span>
            <a href="<%=basePath %>/admin/manager/manage_card1.jsp" target="MainFrame">�쿨��Ա����</a>
            <a href="<%=basePath %>/admin/manager/search_card1.jsp" target="MainFrame">�쿨��Ա��ѯ</a>
        </div>

        <div class="collapsed">
            <span>˽�̿γ̹���</span>
            <a href="<%=basePath %>/admin/manager/manage_member1.jsp" target="MainFrame">˽�̿γ̹���</a>
            <a href="<%=basePath %>/admin/manager/search_member1.jsp" target="MainFrame">˽�̿γ̲�ѯ</a>
        </div>

        <div class="collapsed">
            <span>֪ͨ��Ϣ����</span>
            <a href="<%=basePath %>/admin/manager/add_notice.jsp?method=addnotice" target="MainFrame">����֪ͨ��Ϣ</a>
            <a href="<%=basePath %>/admin/manager/manage_notice.jsp" target="MainFrame">֪ͨ��Ϣ����</a>
        </div>

        <div class="collapsed">
            <span>�ļ���Ϣ����</span>
            <a href="<%=basePath %>/admin/manager/add_file.jsp?method=addfiles" target="MainFrame">�����ļ���Ϣ</a>
            <a href="<%=basePath %>/admin/manager/manage_file.jsp" target="MainFrame">�ļ���Ϣ����</a>
        </div>

        <div class="collapsed">
            <span>������Ϣ����</span>
            <a href="<%=basePath %>/admin/manager/manage_feedback1.jsp" target="MainFrame">������Ϣ����</a>
            <a href="<%=basePath %>/admin/manager/search_feedback.jsp" target="MainFrame">������Ϣ��ѯ</a>
        </div>

        <%} else if (identity.equals("�������")) { %>
        <div class="collapsed">
            <span>������Ϣ����</span>
            <a href="<%=basePath %>/admin/systemmanager/modifypsw.jsp" target="MainFrame">�޸�����</a>
            <a href="<%=basePath %>/admin/coach/coach_info.jsp" target="MainFrame">������Ϣ</a>
        </div>

        <div class="collapsed">
            <span>�쿨��Ա����</span>
            <a href="<%=basePath %>/admin/coach/add_card.jsp?method=addcards" target="MainFrame">�쿨��Ա���</a>
            <a href="<%=basePath %>/admin/coach/manage_card.jsp" target="MainFrame">�쿨��Ա����</a>
            <a href="<%=basePath %>/admin/coach/search_card.jsp" target="MainFrame">�쿨��Ա��ѯ</a>
        </div>

        <div class="collapsed">
            <span>˽�̿γ̹���</span>
            <a href="<%=basePath %>/admin/coach/add_member.jsp?method=addmembers" target="MainFrame">˽�̿γ����</a>
            <a href="<%=basePath %>/admin/coach/manage_member.jsp" target="MainFrame">˽�̿γ̹���</a>
            <a href="<%=basePath %>/admin/coach/search_member.jsp" target="MainFrame">˽�̿γ̲�ѯ</a>
        </div>

        <div class="collapsed">
            <span>֪ͨ�ļ�����</span>
            <a href="<%=basePath %>/admin/coach/notice.jsp" target="MainFrame">֪ͨ��Ϣ</a>
            <a href="<%=basePath %>/admin/coach/file.jsp" target="MainFrame">˽�̿γ̱�</a>
        </div>

        <div class="collapsed">
            <span>������Ϣ����</span>
            <a href="<%=basePath %>/admin/coach/add_feedback.jsp?method=addfeedback" target="MainFrame">�ύ������Ϣ</a>
            <a href="<%=basePath %>/admin/coach/manage_feedback.jsp" target="MainFrame">������Ϣ����</a>
        </div>

        <%} %>

        <div class="collapsed">
            <span>ע���˳�ϵͳ</span>
            <a onclick="if (confirm('ȷ��Ҫ�˳���')) return true; else return false;"
               href="<%=basePath %>AdminServlet?method=adminexit" target="_top">ע���˳�ϵͳ</a>
        </div>
    </div>
</div>
<div class="Switch"></div>

</body>
<%} %>
</html>
