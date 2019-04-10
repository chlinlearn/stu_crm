<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学员关系管理系统CRM</title>
<!-- 引入css样式文件 -->
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="<%=basePath%>/css/metisMenu.min.css" rel="stylesheet">
<!-- DataTables CSS -->
<link href="<%=basePath%>/css/dataTables.bootstrap.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="<%=basePath%>/css/sb-admin-2.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="<%=basePath%>/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>/css/boot-crm.css" rel="stylesheet"
	type="text/css">
<style>
.panel-group {
	max-height: 770px;
	overflow: auto;
}

.leftMenu {
	margin: 10px;
	margin-top: 5px;
}

.panel-heading {
	background-color: #337ab7;
	border-color: #2e6da4;
	font-size: 14px;
	padding-left: 20px;
	height: 36px;
	line-height: 36px;
	color: white;
	position: relative;
	cursor: pointer;
} /*转成手形图标*/
.panel-heading span {
	position: absolute;
	right: 10px;
	top: 12px;
}

.menu-item-left {
	padding: 2px;
	background: transparent;
	border: 1px solid transparent;
	border-radius: 6px;
}

.menu-item-left:hover {
	background: #C4E3F3;
	border: 1px solid #1E90FF;
}
</style>
</head>
<body>
	<div id="wrapper">
		<!-- 导航栏部分 -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<a class="navbar-brand" href="">学员关系管理系统（CRM） v2.0</a>
			</div>
			<!-- 导航栏右侧图标部分 -->
			<!-- 导航栏右侧图标部分 -->
			<ul class="nav navbar-top-links navbar-right">
				<!-- 邮件通知 start -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="department/list.action#"> <i
						class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-messages">
						<li><a href="department/list.action#">
								<div>
									<strong>张经理</strong> <span class="pull-right text-muted">
										<em>昨天</em>
									</span>
								</div>
								<div>今天晚上开会，讨论一下下个月工作的事...</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="department/list.action#">
								<strong>查看全部消息</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul></li>
				<!-- 邮件通知 end -->
				<!-- 任务通知 start -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="department/list.action#"> <i
						class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-tasks">
						<li><a href="department/list.action#">
								<div>
									<p>
										<strong>任务 1</strong> <span class="pull-right text-muted">完成40%</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 40%">
											<span class="sr-only">完成40%</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="department/list.action#">
								<div>
									<p>
										<strong>任务 2</strong> <span class="pull-right text-muted">完成20%</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-info" role="progressbar"
											aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
											style="width: 20%">
											<span class="sr-only">完成20%</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="department/list.action#">
								<strong>查看所有任务</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul></li>
				<!-- 任务通知 end -->
				<!-- 消息通知 start -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="department/list.action#"> <i
						class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-alerts">
						<li><a href="department/list.action#">
								<div>
									<i class="fa fa-comment fa-fw"></i> 新回复 <span
										class="pull-right text-muted small">4分钟之前</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="department/list.action#">
								<div>
									<i class="fa fa-envelope fa-fw"></i> 新消息 <span
										class="pull-right text-muted small">4分钟之前</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="department/list.action#">
								<div>
									<i class="fa fa-tasks fa-fw"></i> 新任务 <span
										class="pull-right text-muted small">4分钟之前</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="department/list.action#">
								<div>
									<i class="fa fa-upload fa-fw"></i> 服务器重启 <span
										class="pull-right text-muted small">4分钟之前</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="department/list.action#">
								<strong>查看所有提醒</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul></li>
				<!-- 消息通知 end -->
				<!-- 用户信息和系统设置 start -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="department/list.action#"> <i
						class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="department/list.action#"><i
								class="fa fa-user fa-fw"></i> 用户：</a></li>
						<li><a href="department/list.action#"><i
								class="fa fa-gear fa-fw"></i> 系统设置</a></li>
						<li class="divider"></li>
						<li><a href="http://localhost:8092/stu_crm/logout.action">
								<i class="fa fa-sign-out fa-fw"></i>退出登录
						</a></li>
					</ul></li>
				<!-- 用户信息和系统设置结束 -->
			</ul>
		</nav>

		<!-- 左侧显示列表部分 start-->
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<!-- 咨询管理  折叠的分组列表 -->
				<div class="panel-heading" id="collapseListGroupHeading1"
					data-toggle="collapse" data-target="#collapseListGroup1" role="tab">
					<h4 class="panel-title">
						咨询管理 <span class="fa fa-chevron-up right"></span>
					</h4>
				</div>
				<div id="collapseListGroup1" class="panel-collapse collapse in"
					role="tabpanel" aria-labelledby="collapseListGroupHeading1">
					<ul class="list-group">
						<li class="list-group-item"><a
							href="http://localhost:8092/stu_crm/refer/list.action"> <i
								class="fa fa-paste fa-fw"></i> 咨询学生管理
						</a></li>

						<li class="list-group-item"><a
							href="http://localhost:8092/stu_crm/consult/findAll.action">
								<i class="fa fa-paste fa-fw"></i> 咨询工作信息管理
						</a></li>

						<li class="list-group-item"><a href="refer/list.action">
								<i class="fa fa-lightbulb-o fa-fw"></i> 查询报名学生
						</a></li>
					</ul>
				</div>

				<!-- 学工管理  折叠的分组列表 -->
				<div class="panel-heading" id="collapseListGroupHeading2"
					data-toggle="collapse" data-target="#collapseListGroup2" role="tab">
					<h4 class="panel-title">
						学工管理 <span class="fa fa-chevron-up right"></span>
					</h4>
				</div>
				<div id="collapseListGroup2" class="panel-collapse collapse in"
					role="tabpanel" aria-labelledby="collapseListGroupHeading2">
					<ul class="list-group">
						<li class="list-group-item"><a
							href="http://localhost:8092/stu_crm/student/findAll.action">
								<i class="fa fa-suitcase fa-fw"></i> 在校学生管理
						</a></li>

						<li class="list-group-item"><a href="student/list.action">
								<i class="fa fa-bell-o fa-fw"></i> 学生升班留班
						</a></li>

						<li class="list-group-item"><a href="student/list.action">
								<i class="fa fa-coffee fa-fw"></i> 学生流失情况
						</a></li>
					</ul>
				</div>

				<!-- 教学管理  折叠的分组列表 -->
				<div class="panel-heading" id="collapseListGroupHeading3"
					data-toggle="collapse" data-target="#collapseListGroup3" role="tab">
					<h4 class="panel-title">
						教学管理 <span class="fa fa-chevron-up right"></span>
					</h4>
				</div>
				<div id="collapseListGroup3" class="panel-collapse collapse in"
					role="tabpanel" aria-labelledby="collapseListGroupHeading3">
					<ul class="list-group">
						<li class="list-group-item"><a
							href="http://localhost:8092/stu_crm/lessontype/findAll.action">
								<i class="fa fa-flash fa-fw"></i> 课程管理
						</a></li>

						<li class="list-group-item"><a
							href="http://localhost:8092/stu_crm/crmclass/findAll.action">
								<i class="fa fa-sitemap fa-fw"></i> 班级管理
						</a></li>
					</ul>
				</div>

				<!-- 就业管理  折叠的分组列表 -->
				<div class="panel-heading" id="collapseListGroupHeading4"
					data-toggle="collapse" data-target="#collapseListGroup4" role="tab">
					<h4 class="panel-title">
						就业管理 <span class="fa fa-chevron-up right"></span>
					</h4>
				</div>
				<div id="collapseListGroup4" class="panel-collapse collapse in"
					role="tabpanel" aria-labelledby="collapseListGroupHeading4">
					<ul class="list-group">
						<li class="list-group-item"><a
							href="http://localhost:8092/stu_crm/crmjob/findAll.action"> <i
								class="fa fa-cutlery fa-fw"></i> 学生就业情况
						</a></li>

						<li class="list-group-item"><a
							href="http://localhost:8092/stu_crm/jobcompany/findAll.action">
								<i class="fa fa-cutlery fa-fw"></i> 学生就业公司信息
						</a></li>
						<li class="list-group-item"><a href="getjob/list.action">
								<i class="fa fa-file-text-o fa-fw"></i> 就业报表
						</a></li>
					</ul>
				</div>

				<!-- 人力资源管理  折叠的分组列表 -->
				<div class="panel-heading" id="collapseListGroupHeading5"
					data-toggle="collapse" data-target="#collapseListGroup5" role="tab">
					<h4 class="panel-title">
						人力资源管理 <span class="fa fa-chevron-up right"></span>
					</h4>
				</div>
				<div id="collapseListGroup5" class="panel-collapse collapse in"
					role="tabpanel" aria-labelledby="collapseListGroupHeading5">
					<ul class="list-group">
						<li class="list-group-item"><a
							href="http://localhost:8092/stu_crm/department/list.action">
								<i class="fa fa-dashboard fa-fw"></i> 部门管理
						</a></li>

						<li class="list-group-item"><a
							href="http://localhost:8092/stu_crm/post/list.action"> <i
								class="fa fa-comment-o fa-fw"></i> 职务管理
						</a></li>

						<li class="list-group-item"><a
							href="http://localhost:8092/stu_crm/staff/findAll.action"> <i
								class="fa fa-umbrella fa-fw"></i> 员工管理
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 左侧显示列表部分 end-->

		<!-- 引入js文件 -->
		<!-- jQuery -->
		<script src="<%=basePath%>/js/jquery-1.11.3.min.js"></script>
		<!-- Bootstrap Core JavaScript -->
		<script src="<%=basePath%>/js/bootstrap.min.js"></script>
		<!-- Metis Menu Plugin JavaScript -->
		<script src="<%=basePath%>/js/metisMenu.min.js"></script>
		<!-- DataTables JavaScript -->
		<script src="<%=basePath%>/js/jquery.dataTables.min.js"></script>
		<script src="<%=basePath%>/js/dataTables.bootstrap.min.js"></script>
		<!-- Custom Theme JavaScript -->
		<script src="<%=basePath%>/js/sb-admin-2.js"></script>
</body>
</html>