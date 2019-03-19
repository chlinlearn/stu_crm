<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学员关系管理系统CRM</title>
	<!-- 引入css样式文件 -->
	<!-- Bootstrap Core CSS -->
	<link href="http://localhost:8092/crm/css/bootstrap.min.css" rel="stylesheet">
	<!-- MetisMenu CSS -->
	<link href="http://localhost:8092/crm/css/metisMenu.min.css" rel="stylesheet">
	<!-- DataTables CSS -->
	<link href="http://localhost:8092/crm/css/dataTables.bootstrap.css" rel="stylesheet">
	<!-- Custom CSS -->
	<link href="http://localhost:8092/crm/css/sb-admin-2.css" rel="stylesheet">
	<!-- Custom Fonts -->
	<link href="http://localhost:8092/crm/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="http://localhost:8092/crm/css/boot-crm.css" rel="stylesheet" type="text/css">
    <style>
        .panel-group{max-height:770px;overflow: auto;}
        .leftMenu{margin:10px;margin-top:5px;}
        .panel-heading{background-color: #337ab7;border-color: #2e6da4;font-size:14px;padding-left:20px;height:36px;line-height:36px;color:white;position:relative;cursor:pointer;}/*转成手形图标*/
        .panel-heading span{position:absolute;right:10px;top:12px;}
        .menu-item-left{padding: 2px; background: transparent; border:1px solid transparent;border-radius: 6px;}
        .menu-item-left:hover{background:#C4E3F3;border:1px solid #1E90FF;}
    </style> 
</head>
<body>
<div id="wrapper">
  <!-- 导航栏部分 -->
  <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
	<div class="navbar-header">
		<a class="navbar-brand" href="">学员关系管理系统（CRM） v2.0</a>
	</div>
	<!-- 导航栏右侧图标部分 -->
	<!-- 导航栏右侧图标部分 -->
	<ul class="nav navbar-top-links navbar-right">
	    <!-- 邮件通知 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="crmpost/list.action#"> 
				<i class="fa fa-envelope fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-messages">
				<li>
				    <a href="crmpost/list.action#">
						<div>
							<strong>张经理</strong> <span class="pull-right text-muted">
								<em>昨天</em>
							</span>
						</div>
						<div>今天晚上开会，讨论一下下个月工作的事...</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a class="text-center" href="crmpost/list.action#">
				        <strong>查看全部消息</strong>
						<i class="fa fa-angle-right"></i>
				    </a>
				</li>
			</ul>
		</li>
		<!-- 邮件通知 end -->
		<!-- 任务通知 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="crmpost/list.action#"> 
			    <i class="fa fa-tasks fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-tasks">
				<li>
				    <a href="crmpost/list.action#">
						<div>
							<p>
								<strong>任务 1</strong> 
								<span class="pull-right text-muted">完成40%</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
									<span class="sr-only">完成40%</span>
								</div>
							</div>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="crmpost/list.action#">
						<div>
							<p>
								<strong>任务 2</strong> 
								<span class="pull-right text-muted">完成20%</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
									<span class="sr-only">完成20%</span>
								</div>
							</div>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a class="text-center" href="crmpost/list.action#"> 
				        <strong>查看所有任务</strong>
						<i class="fa fa-angle-right"></i>
				    </a>
				</li>
			</ul> 
		</li>
		<!-- 任务通知 end -->
		<!-- 消息通知 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="crmpost/list.action#"> 
				<i class="fa fa-bell fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-alerts">
				<li>
				    <a href="crmpost/list.action#">
						<div>
							<i class="fa fa-comment fa-fw"></i> 新回复 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="crmpost/list.action#">
						<div>
							<i class="fa fa-envelope fa-fw"></i> 新消息 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="crmpost/list.action#">
						<div>
							<i class="fa fa-tasks fa-fw"></i> 新任务 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="crmpost/list.action#">
						<div>
							<i class="fa fa-upload fa-fw"></i> 服务器重启 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a class="text-center" href="crmpost/list.action#"> 
				        <strong>查看所有提醒</strong>
						<i class="fa fa-angle-right"></i>
				    </a>
				</li>
			</ul> 
		</li>
		<!-- 消息通知 end -->
		<!-- 用户信息和系统设置 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="crmpost/list.action#"> 
				<i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="crmpost/list.action#"><i class="fa fa-user fa-fw"></i>
				               用户：</a>
				</li>
				<li><a href="crmpost/list.action#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
				<li class="divider"></li>
				<li>
					<a href="logout.action">
					<i class="fa fa-sign-out fa-fw"></i>退出登录
					</a>
				</li>
			</ul> 
		</li>
		<!-- 用户信息和系统设置结束 -->
	</ul> <!-- 左侧显示列表部分 start-->
	<div class="navbar-default sidebar" role="navigation">
	<div class="sidebar-nav navbar-collapse">
			<!-- 咨询管理  折叠的分组列表 -->
			<div class="panel-heading" id="collapseListGroupHeading1" data-toggle="collapse" data-target="#collapseListGroup1" role="tab">
				<h4 class="panel-title">
					咨询管理 <span class="fa fa-chevron-up right"></span>
				</h4>
			</div>
			<div id="collapseListGroup1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="collapseListGroupHeading1">
				<ul class="list-group">
					<li class="list-group-item">
					 <a href="refer/list.action">
							<i class="fa fa-paste fa-fw"></i> 咨询学生管理
					</a></li>

					<li class="list-group-item">
					<a href="refer/list.action">
							<i class="fa fa-lightbulb-o fa-fw"></i> 查询报名学生
					</a>
				   </li>
				</ul>
			</div>

			<!-- 学工管理  折叠的分组列表 -->
			<div class="panel-heading" id="collapseListGroupHeading2" data-toggle="collapse" data-target="#collapseListGroup2" role="tab">
				<h4 class="panel-title">
					学工管理 <span class="fa fa-chevron-up right"></span>
				</h4>
			</div>
			<div id="collapseListGroup2" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="collapseListGroupHeading2">
				<ul class="list-group">
					<li class="list-group-item">
					 <a href="student/list.action">
							<i class="fa fa-suitcase fa-fw"></i> 在校学生管理
					</a></li>

					<li class="list-group-item">
					 <a href="student/list.action">
							<i class="fa fa-bell-o fa-fw"></i> 学生升班留班
					</a></li>

					<li class="list-group-item">
					 <a href="student/list.action">
							<i class="fa fa-coffee fa-fw"></i> 学生流失情况
					</a></li>
				</ul>
			</div>

			<!-- 教学管理  折叠的分组列表 -->
			<div class="panel-heading" id="collapseListGroupHeading3" data-toggle="collapse" data-target="#collapseListGroup3" role="tab">
				<h4 class="panel-title">
					教学管理 <span class="fa fa-chevron-up right"></span>
				</h4>
			</div>
			<div id="collapseListGroup3" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="collapseListGroupHeading3">
				<ul class="list-group">
					<li class="list-group-item">
					 <a href="course/list.action">
							<i class="fa fa-flash fa-fw"></i> 课程管理
					</a>
					</li>

					<li class="list-group-item">
					 <a href="crmclass/list.action">
							<i class="fa fa-sitemap fa-fw"></i> 班级管理
					</a></li>
				</ul>
			</div>

            <!-- 就业管理  折叠的分组列表 -->
			<div class="panel-heading" id="collapseListGroupHeading4" data-toggle="collapse" data-target="#collapseListGroup4" role="tab">
				<h4 class="panel-title">
					就业管理 <span class="fa fa-chevron-up right"></span>
				</h4>
			</div>
			<div id="collapseListGroup4" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="collapseListGroupHeading4">
				<ul class="list-group">
					<li class="list-group-item">
					 <a href="getjob/list.action">
							<i class="fa fa-cutlery fa-fw"></i> 学生就业情况
					</a></li>

					<li class="list-group-item">
					 <a href="getjob/list.action">
							<i class="fa fa-file-text-o fa-fw"></i> 就业报表
					</a></li>
				</ul>
			</div>

			<!-- 人力资源管理  折叠的分组列表 -->
			<div class="panel-heading" id="collapseListGroupHeading5" data-toggle="collapse" data-target="#collapseListGroup5" role="tab">
				<h4 class="panel-title">
					人力资源管理 <span class="fa fa-chevron-up right"></span>
				</h4>
			</div>
			<div id="collapseListGroup5" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="collapseListGroupHeading5">
				<ul class="list-group">
					<li class="list-group-item">
					  <a href="department/list.action">
							<i class="fa fa-dashboard fa-fw"></i> 部门管理
					  </a>
				    </li>

					<li class="list-group-item">
						<a href="crmpost/list.action">
								<i class="fa fa-comment-o fa-fw"></i> 职务管理
						</a>
					</li>

					<li class="list-group-item">
						<a href="crmstaff/list.action">
							<i class="fa fa-umbrella fa-fw"></i> 员工管理
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div><!-- 左侧显示列表部分 end--> 
  </nav>
    <!-- 职务列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">职务管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
		<!-- 搜索部分 -->
			<div class="panel-body">
				<form class="form-inline" method="get" action="crmpost/list.action">
					<div class="form-group">
						<label for="depid">部门</label> 
						<select class="form-control" id="depid" name="depid">
						 <option value="0">所有部门</option>
						 <option value="1">教学部</option>
						 <option value="2">人力资源部</option>
						 <option value="3">财务部</option>
						 <option value="4">学工部</option>
						 <option value="5">咨询部</option>
						 <option value="6">就业部</option>
						 </select>
					</div>
					<div class="form-group">
						<label for="crmpostName">职务名称</label> 
						<input type="text" class="form-control" id="name" value="" name="name">
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<a href="crmpost/list.action#" class="btn btn-primary" data-toggle="modal" data-target="#newPostDialog" onclick="clearPost()">新建</a>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">职务信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>职务名称</th> 
								<th>所属部门</th>
								<th>操作</th>
							</tr>
						</thead>
							<tbody>
							<c:forEach items="${posts}" var="posts">
							<tr>
									<td>${posts.id}</td>
									<td>${posts.postname}</td> 
									<td>${posts.depid}</td> 
									<td>
										<a href="crmpost/list.action#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#crmpostEditDialog" onclick="editcrmpost(${posts.id})">修改</a>
										<a href="crmpost/list.action#" class="btn btn-danger btn-xs" onclick="deletecrmpost(${posts.id})">删除</a>
									</td>
								</tr>
							</c:forEach>
							</tbody>
					</table>
					<div class="col-md-12 text-right">
						<nav><ul class="pagination"><li class="disabled"><a href="crmpost/list.action#">首页 </a></li><li class="disabled"><a href="crmpost/list.action#">上一页 </a></li><li class="active"><a href="crmpost/list.action#">1<spanclass="sr-only"></spanclass="sr-only"></a></li><li><a href="crmpost/list.action?page=2&amp;rows=5">2</a></li><li><a href="crmpost/list.action?page=2&amp;rows=5">下一页</a></li><li><a href="crmpost/list.action?page=2">尾页</a></li></ul></nav></div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 职务列表查询部分  end-->
</div>
<!-- 创建职务模态框 -->
<div class="modal fade" id="newPostDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建职务信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_crmpost_form">
					<div class="form-group">
						<label for="new_depid" class="col-sm-2 control-label">
						    所属部门
						</label>
						<div class="col-sm-4">
							<select class="form-control" id="new_depid" name="depid">
							 <option value="1">教学部</option>
							 <option value="2">人力资源部</option>
							 <option value="3">财务部</option>
							 <option value="4">学工部</option>
							 <option value="5">咨询部</option>
							 <option value="6">就业部</option>
							 </select>
						</div>
						<label for="new_crmpostName" class="col-sm-2 control-label">
						    职务名称
						</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="new_crmpostName" placeholder="职务名称" name="name">
						</div>
						
					</div> 
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createcrmpost()">创建职务</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改职务模态框 -->
<div class="modal fade" id="crmpostEditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改职务信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_crmpost_form">
					<input type="hidden" id="edit_postid" name="postid">
					<div class="form-group">
					   <label for="edit_depid" class="col-sm-2 control-label">
						    所属部门
						</label>
						<div class="col-sm-4">
							<select class="form-control" id="edit_depid" name="depid">
							 <option value="1">教学部</option>
							 <option value="2">人力资源部</option>
							 <option value="3">财务部</option>
							 <option value="4">学工部</option>
							 <option value="5">咨询部</option>
							 <option value="6">就业部</option>
							 </select>
						</div>
						<label for="edit_crmpostName" class="col-sm-2 control-label">职务名称</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="edit_crmpostName" placeholder="职务名称" name="name">
						</div>
					</div> 
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updatecrmpost()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="http://localhost:8092/crm/js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="http://localhost:8092/crm/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="http://localhost:8092/crm/js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="http://localhost:8092/crm/js/jquery.dataTables.min.js"></script>
<script src="http://localhost:8092/crm/js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="./js/sb-admin-2.js"></script>
<!-- 编写js代码 -->
<script type="text/javascript">
$(function(){
    $(".panel-heading").click(function(e){
        /*切换折叠指示图标*/
        $(this).find("span").toggleClass("fa-chevron-down");
        $(this).find("span").toggleClass("fa-chevron-up");
    });
}); 
//清空新建职务窗口中的数据
	function clearPost() {
	    $("#new_crmpostName").val(""); 
	}
	// 创建职务
	function createcrmpost() {
	$.post("crmpost/create.action",
	$("#new_crmpost_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("职务创建成功！");
	            window.location.reload();
	        }else{
	            alert("职务创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的职务信息
	function editcrmpost(id) {
	    $.ajax({
	        type:"get",
	        url:"crmpost/getPostById.action",
	        data:{"id":id},
	        success:function(data) {
	        	$("#edit_postid").val(data.postid);
	            $("#edit_depid").val(data.depid);
	            $("#edit_crmpostName").val(data.name); 
	        }
	    });
	}
    // 执行修改职务操作
	function updatecrmpost() {
		$.post("crmpost/update.action",$("#edit_crmpost_form").serialize(),function(data){
			if(data =="OK"){
				alert("职务信息更新成功！");
				window.location.reload();
			}else{
				alert("职务信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除职务
	function deletecrmpost(id) {
	    if(confirm('确实要删除该职务吗?')) {
	$.post("crmpost/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("职务删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除职务失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>

</body></html>