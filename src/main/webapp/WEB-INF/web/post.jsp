<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://itcx.com/pagination/" prefix="pg"%>
<%@include file="base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
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
				<form class="form-inline" method="get" action="search.action">
					<div class="form-group">
						<label for="depid">部门</label> <select class="form-control"
							id="depID" name="depID">
							<option value="1">教务部</option>
							<option value="2">咨询部</option>
							<option value="3">财务部</option>
							<option value="4">学工部</option>
							<option value="5">数据部</option>
							<option value="6">UI部</option>
							<option value="7">创新部</option>
							<option value="8">后端部</option>
							<option value="9">人事部</option>
							<option value="10">后勤部</option>
						</select>
					</div>
					<div class="form-group">
						<label for="crmpostName">职务名称</label> <input type="text"
							class="form-control" id="postName" value="" name="postName">
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<a href="crmpost/list.action#" class="btn btn-primary"
			data-toggle="modal" data-target="#newPostDialog"
			onclick="clearPost()">新建</a>
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
							<c:forEach items="${page.rows}" var="posts">
								<tr>
									<td>${posts.id}</td>
									<td>${posts.postName}</td>
									<td>${posts.depName}</td>
									<td><a href="" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#crmpostEditDialog"
										onclick="editcrmpost(${posts.id})">修改</a> <a href=""
										class="btn btn-danger btn-xs"
										onclick="deletecrmpost(${posts.id})">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<!-- 分页条使用自定义标签实现-->
						<pg:page
							url="${pageContext.request.contextPath }/post/list.action" />
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 部门列表查询部分  end-->
	</div>
	<!-- 创建职务模态框 -->
	<div class="modal fade" id="newPostDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建职务信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_crmpost_form">
						<div class="form-group">
							<label for="new_depid" class="col-sm-2 control-label">
								所属部门 </label>
							<div class="col-sm-4">
								<select class="form-control" id="new_depid" name="depID">
									<option value="1">教务部</option>
									<option value="2">咨询部</option>
									<option value="3">财务部</option>
									<option value="4">学工部</option>
									<option value="5">数据部</option>
									<option value="6">UI部</option>
									<option value="7">创新部</option>
									<option value="8">后端部</option>
									<option value="9">人事部</option>
									<option value="10">后勤部</option>
								</select>
							</div>
							<label for="new_crmpostName" class="col-sm-2 control-label">
								职务名称 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_crmpostName"
									placeholder="职务名称" name="postName">
							</div>

						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createcrmpost()">创建职务</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改职务模态框 -->
	<div class="modal fade" id="crmpostEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改职务信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_crmpost_form">
						<input type="hidden" id="edit_postid" name="id">
						<div class="form-group">
							<label for="edit_depid" class="col-sm-2 control-label">
								所属部门 </label>
							<div class="col-sm-4">
								<select class="form-control" id="edit_depid" name="depID">
									<option value="1">教务部</option>
									<option value="2">咨询部</option>
									<option value="3">财务部</option>
									<option value="4">学工部</option>
									<option value="5">数据部</option>
									<option value="6">UI部</option>
									<option value="7">创新部</option>
									<option value="8">后端部</option>
									<option value="9">人事部</option>
									<option value="10">后勤部</option>
								</select>
							</div>
							<label for="edit_crmpostName" class="col-sm-2 control-label">职务名称</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_crmpostName"
									placeholder="职务名称" name="postName">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updatecrmpost()">保存修改</button>
				</div>
			</div>
		</div>
	</div>

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
	$.post("create.action",
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
	        url:"getPostById.action",
	        data:{"id":id},
	        success:function(data) {
	        	$("#edit_postid").val(data.id);
	            $("#edit_depid").val(data.depID);
	            $("#edit_crmpostName").val(data.postName); 
	        }
	    });
	}
    // 执行修改职务操作
	function updatecrmpost() {
		$.post("update.action",$("#edit_crmpost_form").serialize(),function(data){
			if(data == "OK"){
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
	$.post("delete.action",{"id":id},
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
</body>
</html>