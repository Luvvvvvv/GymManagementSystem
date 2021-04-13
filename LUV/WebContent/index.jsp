<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LUV��������ϵͳ </title>

    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/form-elements.css">
    <link rel="stylesheet" href="assets/css/style.css">

</head>

<body>
<script language=javascript>
    function reg() {
        window.location = "reg.jsp";
    }

    function lost() {
        window.location = "lost.jsp";
    }
</script>
<%--Top Banner--%>
<nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
    <div class="container">
        <div class="logo-gym">
            <img src="images/img/logo.jpg">
        </div>
        <div class="collapse navbar-collapse" id="top-navbar-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#"><strong> LUV��������ϵͳ </strong></a>
                    <span class="li-text">
								&nbsp;&nbsp;��ӭ����ϵ:
                    </span>
                    <span class="li-social">
                        <a id="wechat"><i class="fa fa-wechat"></i></a>
                        <img class="qrcode" src="images/img/QRcode.jpg">
                        <span>�������ʾ��ά�룩</span>
                        <a id="qq"><i class="fa fa-qq"></i></a>
                         <img class="qrcode1" src="images/img/QRcode1.jpg">
                    </span>
                </li>
            </ul>
        </div>
    </div>
</nav>

<%--Log In--%>

<div class="inner-bg">
    <div class="container">
        <div class="row">
            <div class="col-sm-8 text"></div>
            <div class="col-sm-4 form-box">
                <div class="form-top">
                    <div class="form-top-left">
                        <h3>��ӭ��½ϵͳ</h3>
                        <p>������ȷ���û������ɵ�½��</p>
                    </div>
                    <div class="form-top-right">
                        <i class="fa fa-gear"></i>
                    </div>
                </div>
                <div class="form-bottom">
                    <form name="loginform" action="<%=basePath%>AdminServlet" method="post"
                          class="registration-form">
                        <div class="form-group">
                            <label class="sr-only" for="form-first-name">��¼�ʺţ�
                            </label><input type=hidden name=method value="one"/>
                            <input type="text" name="username" placeholder="�������ʺ�"
                                   class="form-first-name form-control" id="form-first-name" required/>
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="form-last-name">��¼���룺</label>
                            <input type="text" name="password" placeholder="����������"
                                   class="form-last-name form-control" id="form-last-name" required/>
                        </div>
                        <div class="form-group">
                            <label class="sr-only">�û���ݣ�</label>
                            <input type="radio" name="identity" value="�������" checked="checked"> �������
                            <input type="radio" name="identity" value="������Ա"> ������Ա
                            <input type="radio" name="identity" value="ϵͳ����Ա"> ϵͳ����Ա
                        </div>
                        <div class="login">
                            <button type="submit" value="�����¼">��½</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="assets/js/jquery-1.11.1.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/jquery.backstretch.min.js"></script>
<script src="assets/js/retina-1.1.0.min.js"></script>
<script src="assets/js/scripts.js"></script>

</body>
</html>