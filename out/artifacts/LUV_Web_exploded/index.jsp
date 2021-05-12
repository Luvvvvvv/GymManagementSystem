<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="head.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>LUV��������ϵͳ </title>
  <link rel="stylesheet" href="<%=basePath %>/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="<%=basePath %>/assets/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="<%=basePath %>/assets/css/style.css">
  <link rel="icon" href="<%=basePath %>/images/systemicon/bodylogo.jpg">
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
          <span class="li-text">&nbsp;&nbsp;��ӭ����ϵ:</span>
          <span class="li-social">
            <a id="wechat"><i class="fa fa-wechat"></i></a>
            <div class="qrcode">
              <span style="position: absolute;width: 0;height: 0;border: 10px solid transparent;border-bottom-color: white;top: -20px;left: 50px"></span>
              <img style="border: 3px solid white;border-radius: 8px;" src="<%=basePath %>/images/QRcode.png">
            </div>
            <span>�������ʾ��ά�룩</span>
            <a id="qq"><i class="fa fa-qq"></i></a>
            <div class="qrcode1">
              <span style="position: absolute; width: 0; height: 0; border: 10px solid transparent;
                            border-bottom-color: #ececec; top: -20px; left: 47px"></span>
              <img style="border: 3px solid white;border-radius: 8px;" src="<%=basePath %>/images/QRcode1.png">
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
    <div>
      <div id="days"></div>
      <div class="timeUnit">DAYS</div>
    </div>
    <div class="border"></div>
    <div>
      <div id="hours"></div>
      <div class="timeUnit">HOURS</div>
    </div>
    <div class="border"></div>
    <div>
      <div id="minutes"></div>
      <div class="timeUnit">MINUTES</div>
    </div>
    <div class="border"></div>
    <div>
      <div id="seconds"></div>
      <div class="timeUnit">SECONDS</div>
    </div>
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
              <i class="fa fa-eye" id="eye" style="position: relative;float: right;top: -25px;right: 10px"></i>
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

<script src="<%=basePath %>assets/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath %>assets/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath %>assets/js/jquery.backstretch.min.js"></script>
<script src="<%=basePath %>assets/function/mainpage.js"></script>

</body>
</html>