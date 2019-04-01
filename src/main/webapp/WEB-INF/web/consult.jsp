<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- base模板 -->
<%@ include file="base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

</head>
<body>
	<!-- 咨询列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">咨询工作信息管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get" action="search.action">
					<div class="form-group">
						<label for="referName">咨询学生姓名</label> <input type="text"
							class="form-control" id="referName" value="" name="referName">
					</div>
					<div class="form-group">
						<label for="username">咨询师</label> <input type="text"
							class="form-control" id="username" value="" name="username">
					</div>
					<div class="form-group">
						<label for="consultTime">咨询时间</label> <input type="text"
							class="form-control" id="consultTime" value="" name="consultTime">
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<a href="create.action" class="btn btn-primary" data-toggle="modal"
			data-target="#newconsultDialog" onclick="clearconsult()">新建</a>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">咨询工作信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>用户名</th>
								<th>咨询师</th>
								<th>咨询时间</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${consults}" var="consults">
								<tr>
									<td>${consults.id}</td>
									<td>${consults.referName}</td>
									<td>${consults.username }</td>
									<td>${consults.consultTime }</td>
									<td><a href="update.action" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#consultEditDialog"
										onclick="editconsult(${consults.id})">修改</a> <a
										href="delete.action#" class="btn btn-danger btn-xs"
										onclick="deleterconsult(${consults.id})">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<nav>
						<ul class="pagination">
							<li class="disabled"><a href="list.action#">首页 </a></li>
							<li class="disabled"><a href="list.action#">上一页 </a></li>
							<li class="active"><a href="list.action#">1<spanclass="sr-only"></spanclass="sr-only"></a></li>
							<li class="disabled"><a href="list.action#">下一页</a></li>
							<li class="disabled"><a href="list.action#">尾页</a></li>
						</ul>
						</nav>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 咨询列表查询部分  end-->
	</div>
	<!-- 创建咨询模态框 -->
	<div class="modal fade" id="newrconsultDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建咨询工作信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_consult_form">
						<div class="form-group">
							<label for="new_creferName" class="col-sm-2 control-label">
								用户名 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_creferName"
									placeholder="用户名" name="creferName">
							</div>
						</div>
						<div class="form-group">
							<label for="new_cusername" class="col-sm-2 control-label">
								咨询师 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cusername"
									placeholder="咨询师" name="cusername">
							</div>
						</div>
						<div class="form-group">
							<label for="new_cconsultTime" class="col-sm-2 control-label">
								咨询时间 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cconsultTime"
									placeholder="咨询时间" name="cconsultTime">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createrefer()">创建咨询</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改咨询模态框 -->
	<div class="modal fade" id="consultEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改咨询信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_refer_form">
						<input type="hidden" id="edit_id" name="id">
						<div class="form-group">
							<label for="edit_creferName" class="col-sm-2 control-label">
								学生姓名 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_creferName"
									placeholder="用户名" name="creferName">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_cusername" class="col-sm-2 control-label">
								咨询师</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_cusername"
									placeholder="咨询师" name="cusername">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_cconsultTime" class="col-sm-2 control-label">
								咨询时间 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_cconsultTime"
									placeholder="咨询时间" name="cconsultTime">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateconsult()">保存修改</button>
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
//清空新建咨询窗口中的数据
	function clearconsult() {
	    $("#new_creferName").val("");
	    $("#new_cusername").val("");
	    $("#new_cconsultTime").val("");
	}
	// 创建咨询
	function createconsult() {
	$.post("create.action",
	$("#new_consult_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("创建成功！");
	            window.location.reload();
	        }else{
	            alert("创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的咨询信息
	function editconsult(id) {
	    $.ajax({
	        type:"get",
	        url:"getConsultById.action",
	        data:{"id":id},
	        success:function(data) {
	        	$("#edit_id").val(data.id);
	            $("#edit_creferName").val(data.referName);
	            $("#edit_cusername").val(data.username);
	            $("#edit_cconsultTime").val(data.consultTime);
	        }
	    });
	}
    // 执行修改咨询操作
	function updateconsult() {
		$.post("update.action",
		  $("#edit_consult_form").serialize(),
		  function(data){
			if(data =="OK"){
				alert("更新成功！");
				window.location.reload();
			}else{
				alert("更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除咨询
	function deleteconsult(id) {
	    if(confirm('确实要删除该咨询吗?')) {
		$.post("delete.action",{"id":id},
		function(data){
	            if(data =="OK"){
	                alert("删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>