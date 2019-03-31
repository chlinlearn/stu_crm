<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE HTML>
<html>
<head>
<title>登录页面</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/css/style.css"
	type=text/css rel=stylesheet>
<link href="${pageContext.request.contextPath}/css/boot-crm.css"
	type=text/css rel=stylesheet>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
<script>
	// 判断是登录账号和密码是否为空
	function check() {
		var loginName = $("#loginName").val();
		var loginPwd = $("#loginPwd").val();
		if (loginName == "" || loginPwd == "") {
			$("#message").text("账号或密码不能为空！");
			return false;
		}
		return true;
	}
</script>
</head>
<body leftMargin=0 topMargin=0 marginwidth="0" marginheight="0"
	background="<%=basePath %>/images/bg4.jpg">
	<div ALIGN="center">
		<table border="0" width="440px" cellspacing="0" cellpadding="0"
			id="table1">
			<tr>
				<td height="193"></td>
			</tr>
			<tr>
				<td class="login_msg" width="400" align="center">
					<!-- margin:0px auto; 控制当前标签居中 -->
					<fieldset style="width: auto; margin: 0px auto;">
						<legend>
							<font style="font-size: 25px" face="宋体"> 欢迎使用学员 CRM 管理系统 </font>
						</legend>
						<font color="red" size="4"> <%-- 提示信息--%> <span
							id="message">${msg}</span>
						</font>
						<%-- 提交后的位置：/WEB-INF/jsp/customer.jsp--%>
						<form action="${pageContext.request.contextPath }/login.action"
							method="post" onsubmit="return check()">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> <br /> 账&nbsp;号：<input
								id="loginName" type="text" name="loginName" /> <br /> <br />
							密&nbsp;码：<input id="loginPwd" type="password" name="loginPwd" />
							<br /> <br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<center>
								<input type="submit" value="登录" />&nbsp;&nbsp; <input
									type="reset" value="重置" />
							</center>
						</form>
					</fieldset>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>