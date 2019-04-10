<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<title>登录页面</title>

<link rel="apple-touch-icon" sizes="76x76"
	href="<%=basePath%>/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="<%=basePath%>/assets/img/favicon.png">

<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<!-- CSS Files -->
<link href="<%=basePath%>/assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=basePath%>/assets/css/now-ui-kit.css?v=1.1.0"
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="<%=basePath%>/assets/css/demo.css" rel="stylesheet" />

<script>
	// 判断是登录账号和密码是否为空
	function check() {
		var usercode = $("#loginName").val();
		var password = $("#loginPwd").val();
		if (usercode == "" || password == "") {
			$("#message").text("账号或密码不能为空！");
			return false;
		}
		return true;
	}
</script>
</head>

<body class="login-page sidebar-collapse">
	<div class="page-header" filter-color="orange">
		<div class="page-header-image"
			style="background-image: url(<%=basePath%>/assets/img/login.jpg)"></div>
		<div class="container">
			<div class="col-md-4 content-center">
				<div class="card card-login card-plain">
					<form class="form" method="" action="">
						<div class="header header-primary text-center">
							<div class="footer text-center">
								<%-- <img src="<%=basePath%>/assets/img/now-logo.png" alt=""> --%>
								<span>欢迎登录学员CRM管理系统</span>
							</div>
						</div>
						<div class="content">
							<div class="input-group form-group-no-border input-lg">
								<span class="input-group-addon"> <i
									class="now-ui-icons users_circle-08"></i>
								</span> <input type="text" class="form-control" placeholder="username"
									id="loginName" value="" name="loginName">
							</div>
							<div class="input-group form-group-no-border input-lg">
								<span class="input-group-addon"> <i
									class="now-ui-icons text_caps-small"></i>
								</span> <input type="password" placeholder="password" id="loginPwd"
									value="" name="loginPwd" class="form-control" />
							</div>
						</div>
						<div class="footer text-center">
							<a href="${pageContext.request.contextPath }/login.action"
								class="btn btn-primary btn-round btn-lg btn-block">Login</a>
						</div>
						<div class="pull-left">
							<h6>
								<a href="#pablo" class="link">Create Account</a>
							</h6>
						</div>
						<div class="pull-right">
							<h6>
								<a href="#pablo" class="link">Need Help?</a>
							</h6>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<!--   Core JS Files   -->
<script src="<%=basePath%>/assets/js/core/jquery.3.2.1.min.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/assets/js/core/popper.min.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/assets/js/core/bootstrap.min.js"
	type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="<%=basePath%>/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="<%=basePath%>/assets/js/plugins/nouislider.min.js"
	type="text/javascript"></script>
<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
<script src="<%=basePath%>/assets/js/plugins/bootstrap-datepicker.js"
	type="text/javascript"></script>
<!-- Share Library etc -->
<script src="<%=basePath%>/assets/js/plugins/jquery.sharrre.js"
	type="text/javascript"></script>
<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
<script src="<%=basePath%>/assets/js/now-ui-kit.js?v=1.1.0"
	type="text/javascript"></script>

</html>
