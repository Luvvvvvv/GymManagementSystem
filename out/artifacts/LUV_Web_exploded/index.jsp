<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="head.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>LUV健身房管理系统 </title>
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
          <a href="#" id="GMS"><strong> LUV健身房管理系统 </strong></a>
          <ul id="menuDown">
            <li><a href="#">意见建议</a></li>
            <li><a href="#">支持我们</a></li>
            <li><a href="#">加入我们</a></li>
          </ul>
          <span class="li-text">&nbsp;&nbsp;欢迎您联系:</span>
          <span class="li-social">
            <a id="wechat"><i class="fa fa-wechat"></i></a>
            <div class="qrcode">
              <span style="position: absolute;width: 0;height: 0;border: 10px solid transparent;border-bottom-color: white;top: -20px;left: 50px"></span>
              <img style="border: 3px solid white;border-radius: 8px;" src="<%=basePath %>/images/QRcode.png">
            </div>
            <span>（点击显示二维码）</span>
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
  <div id="ctitle">距离系统正式上线还有：</div>
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
            <h3>欢迎登陆系统</h3>
            <p>请用正确的用户身份完成登陆：</p>
          </div>
          <div class="form-top-right">
            <i class="fa fa-users"></i>
          </div>
        </div>
        <div class="form-bottom">
          <form name="loginform" action="<%=basePath%>AdminServlet" method="post"
                class="registration-form">
            <div class="form-group">
              <label class="sr-only" for="form-first-name">登录帐号：
              </label><input type=hidden name=method value="one"/>
              <input type="username" name="username" placeholder="请输入帐号"
                     class="form-first-name form-control" id="form-first-name" required/>
            </div>
            <div class="form-group">
              <label class="sr-only" for="form-last-name">登录密码：</label>
              <input type="password" name="password" placeholder="请输入密码"
                     class="form-last-name form-control" id="form-last-name" required/>
              <i class="fa fa-eye" id="eye" style="position: relative;float: right;top: -25px;right: 10px"></i>
            </div>
            <div class="form-group">
              <label class="sr-only">用户身份：</label>
              <input type="radio" name="identity" value="健身教练" checked="checked"> 健身教练
              <input type="radio" name="identity" value="管理人员"> 管理人员
              <input type="radio" name="identity" value="系统管理员"> 系统管理员
            </div>
            <div class="login">
              <button type="submit" value="点击登录">登陆</button>
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