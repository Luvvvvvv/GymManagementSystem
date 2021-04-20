<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="head.jsp" %>
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

<%--<i class="fa fa-cny" style="position: absolute;width: 30px;height: 30px" id="arrow"></i>--%>

<%--Top Banner--%>
<nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
    <div class="container">
        <div class="logo-gym">
            <img src="images/logo.jpg">
        </div>
        <div class="collapse navbar-collapse" id="top-navbar-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#" id="GMS"><strong> LUV��������ϵͳ </strong></a>
                    <ul id="menuDown">
                        <li><a href="#">�������</a></li>
                        <li><a href="#">֧������</a></li>
                        <li><a href="#">��������</a></li>
                    </ul>
                    <span class="li-text">
								&nbsp;&nbsp;��ӭ����ϵ:
                    </span>
                    <span class="li-social">
                        <a id="wechat"><i class="fa fa-wechat"></i></a>
                        <div class="qrcode" style="position: absolute">
                            <span style="position: absolute; width: 0; height: 0; border: 10px solid transparent;
                            border-bottom-color: white; top: -20px; left: 50px"></span>
                            <img src="images/QRcode.jpg">
                        </div>
                        <span>�������ʾ��ά�룩</span>
                        <a id="qq"><i class="fa fa-qq"></i></a>
                        <div class="qrcode1" style="position: absolute">
                            <span style="position: absolute; width: 0; height: 0; border: 10px solid transparent;
                            border-bottom-color: #ececec; top: -20px; left: 47px"></span>
                            <img src="images/QRcode1.jpg">
                        </div>

                    </span>
                </li>
            </ul>
        </div>
    </div>
</nav>

<%--countDown--%>
<div id="countdown">
    <div id="ctitle">����ϵͳ��ʽ���߻��У�</div>
    <div id="times">
        <div id="days"></div>
        <div id="hours"></div>
        <div id="minutes"></div>
        <div id="seconds"></div>
    </div>
    <div id="timeunit">
        <div id="day">DAYS</div>
        <div id="hour">HOURS</div>
        <div id="minute">MINUTES</div>
        <div id="second">SECONDS</div>
    </div>
</div>

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
                        <i class="fa fa-users"></i>
                    </div>
                </div>
                <div class="form-bottom">
                    <form name="loginform" action="<%=basePath%>AdminServlet" method="post"
                          class="registration-form">
                        <div class="form-group">
                            <label class="sr-only" for="form-first-name">��¼�ʺţ�
                            </label><input type=hidden name=method value="one"/>
                            <input type="username" name="username" placeholder="�������ʺ�"
                                   class="form-first-name form-control" id="form-first-name" required/>
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="form-last-name">��¼���룺</label>
                            <input type="password" name="password" placeholder="����������"
                                   class="form-last-name form-control" id="form-last-name" required/>
                            <i class="fa fa-eye" id="eye"
                               style="position: relative;float: right;top: -25px;right: 10px"></i>
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