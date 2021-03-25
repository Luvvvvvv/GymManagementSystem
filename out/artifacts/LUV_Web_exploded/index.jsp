<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>LUV健身房管理系统 </title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/form-elements.css">
        <link rel="stylesheet" href="assets/css/style.css">


        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

    </head>

    <body>
<SCRIPT language=javascript>
function reg() {
	window.location="reg.jsp";
}
function lost() {
	window.location="lost.jsp";
}
</SCRIPT>
		<!-- Top menu -->
		<nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a href="#"><img src="images/img/logo.jpg" width="60px" height="60px"></a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="top-navbar-1">
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a href="#"><strong> LUV健身房管理系统  </strong></a> 
							<span class="li-text">
								&nbsp;&nbsp;欢迎您的联系: 
							</span> 
							<span class="li-social">
								<a href="#"><i class="fa fa-wechat"></i></a>
								<a href="#"><i class="fa fa-qq"></i></a>
								<a href="#"><i class="fa fa-instagram"></i></a>
								<a href="#"><i class="fa fa-twitter"></i></a>
							</span>
						</li>
					</ul>
				</div>
			</div>
		</nav>

        <!-- Top content -->
        <div class="top-content">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 text">
                        </div>
                        <div class="col-sm-4 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>欢迎登陆系统</h3>
                            		<p>请用正确的用户身份完成登陆：</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-gear"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form  name="loginform" action="<%=basePath%>AdminServlet" method="post" class="registration-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-first-name">登录帐号：</label><input type=hidden name=method value="one"/>
			                        	<input type="text" name="username" placeholder="请输入帐号" class="form-first-name form-control" id="form-first-name" required />
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-last-name">登录密码：</label>
			                        	<input type="text" name="password" placeholder="请输入密码" class="form-last-name form-control" id="form-last-name" required />
			                        </div>
			                        <div class="form-group">

			                        	<%--@declare id="form-email"--%><label class="sr-only" for="form-email">用户身份：</label>
											<input type="radio" name="sf" value="健身教练" checked="checked">  健身教练
											<input type="radio" name="sf" value="管理人员" >  管理人员
											<input type="radio" name="sf" value="系统管理员" >  系统管理员
			                        </div>
			                        <div align="center">
			                        	<button type="submit" value="点击登录" >登陆</button>
			                    	</div>
			                    </FORM>
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/retina-1.1.0.min.js"></script>
        <script src="assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>