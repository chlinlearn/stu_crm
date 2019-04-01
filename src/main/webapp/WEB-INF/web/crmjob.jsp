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
<body>
	<!-- 咨询列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">就业信息管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get" action="search.action">
					<div class="form-group">
						<label for="stuCode">学生学号</label> <input type="text"
							class="form-control" id="stuCode" value="" name="stuCode">
					</div>
					<div class="form-group">
						<label for="stuName">学生姓名</label> <input type="text"
							class="form-control" id="stuName" value="" name="stuName">
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<a href="create.action#" class="btn btn-primary" data-toggle="modal"
			data-target="#newcrmjobDialog" onclick="clearcrmjob()">新建</a>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">就业信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>学号</th>
								<th>姓名</th>
								<th>性别</th>
								<th>班级</th>
								<th>工作公司</th>
								<th>现所在地</th>
								<th>就业意向</th>
								<th>就业状态</th>
								<th>到岗时间</th>
								<th>备注</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${crmjobs}" var="crmjobs">
								<tr>
									<td>${crmjobs.id}</td>
									<td>${crmjobs.stuCode}</td>
									<td>${crmjobs.stuName }</td>
									<td>${crmjobs.gender }</td>
									<td>${crmjobs.classname }</td>
									<td>${crmjobs.jobcompany }</td>
									<td>${crmjobs.location }</td>
									<td>${crmjobs.activeCode }</td>
									<td>${crmjobs.jobState }</td>
									<td>${crmjobs.jobTime }</td>
									<td>${crmjobs.remark }</td>
									<td><a href="update.action" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#crmjobEditDialog"
										onclick="editcrmjob(${crmjobs.id})">修改</a> <a
										href="delete.action#" class="btn btn-danger btn-xs"
										onclick="deletecrmjob(${crmjobs.id})">删除</a></td>
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
	<div class="modal fade" id="newcrmjobDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建咨询信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_crmjob_form">
						<div class="form-group">
							<label for="new_cstuCode" class="col-sm-2 control-label">
								学号</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cstuCode"
									placeholder="学号" name="cstuCode">
							</div>
							<label for="new_cstuName" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cstuName"
									placeholder="姓名" name="cstuName">
							</div>
						</div>
						<div class="form-group">
							<label for="new_cgender" class="col-sm-2 control-label">
								性别</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cgender"
									placeholder="性别" name="cgender">
							</div>
							<label for="new_cclass" class="col-sm-2 control-label">班级</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cclass"
									placeholder="班级" name="cclass">
							</div>
						</div>
						<div class="form-group">
							<label for="new_cjobcompany" class="col-sm-2 control-label">
								工作公司</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cjobcompany"
									placeholder="工作公司" name="cjobcompany">
							</div>
							<label for="new_clocation" class="col-sm-2 control-label">现所在地</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_clocation"
									placeholder="现所在地" name="clocation">
							</div>
						</div>
						<div class="form-group">
							<label for="new_cactiveCode" class="col-sm-2 control-label">就业意向</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cactiveCode"
									placeholder="就业意向" name="cactiveCode">
							</div>
							<label for="new_cjobState" class="col-sm-2 control-label">
								就业状态</label>
							<div class="col-sm-4">
								<select class="form-control" id="new_cjobState" name="cjobState">
									<option value="0">找工作</option>
									<option value="1">已就业</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="new_cjobTime" class="col-sm-2 control-label">到岗时间</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cjobTime"
									placeholder="到岗时间" name="cjobTime">
							</div>
							<label for="new_remark" class="col-sm-2 control-label">备注</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_remark"
									placeholder="备注" name="remark">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createcrmjob()">创建咨询</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改咨询模态框 -->
	<div class="modal fade" id="crmjobEditDialog" tabindex="-1"
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
					<form class="form-horizontal" id="edit_crmjob_form">
						<input type="hidden" id="edit_id" name="id">
						<div class="form-group">
							<label for="new_cstuCode" class="col-sm-2 control-label">
								学号</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cstuCode"
									placeholder="学号" name="cstuCode">
							</div>
							<label for="new_cstuName" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cstuName"
									placeholder="姓名" name="cstuName">
							</div>
						</div>
						<div class="form-group">
							<label for="new_cgender" class="col-sm-2 control-label">
								性别</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cgender"
									placeholder="性别" name="cgender">
							</div>
							<label for="new_cclass" class="col-sm-2 control-label">班级</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cclass"
									placeholder="班级" name="cclass">
							</div>
						</div>
						<div class="form-group">
							<label for="new_cjobcompany" class="col-sm-2 control-label">
								工作公司</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cjobcompany"
									placeholder="工作公司" name="cjobcompany">
							</div>
							<label for="new_clocation" class="col-sm-2 control-label">现所在地</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_clocation"
									placeholder="现所在地" name="clocation">
							</div>
						</div>
						<div class="form-group">
							<label for="new_cactiveCode" class="col-sm-2 control-label">就业意向</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cactiveCode"
									placeholder="就业意向" name="cactiveCode">
							</div>
							<label for="new_cjobState" class="col-sm-2 control-label">
								就业状态</label>
							<div class="col-sm-4">
								<select class="form-control" id="new_cjobState" name="cjobState">
									<option value="0">找工作</option>
									<option value="1">已就业</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="new_cjobTime" class="col-sm-2 control-label">到岗时间</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cjobTime"
									placeholder="到岗时间" name="cjobTime">
							</div>
							<label for="new_remark" class="col-sm-2 control-label">备注</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_remark"
									placeholder="备注" name="remark">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updatecrmjob()">保存修改</button>
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
	function clearcrmjob() {
	    $("#new_cstuCode").val("");
	    $("#new_cstuName").val("");
	    $("#new_cgender").val("");
	    $("#new_cclass").val("");
	    $("#new_cjobcompany").val("");
	    $("#new_clocation").val("");
	    $("#new_cactiveCode").val("");
	    $("#new_cjobState").val("");
	    $("#new_cjobTime").val("");
	    $("#new_remark").val("");
	}
	// 创建咨询
	function createcrmjob() {
	$.post("create.action",
	$("#new_crmjob_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("咨询创建成功！");
	            window.location.reload();
	        }else{
	            alert("咨询创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的咨询信息
	function editcrmjob(id) {
	    $.ajax({
	        type:"get",
	        url:"getCrmJobById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_id").val(data.id);
	            $("#edit_cstuCode").val(data.stuCode);
	            $("#edit_cstuName").val(data.stuName);
	            $("#edit_cgender").val(data.gender);
	            $("#edit_cclass").val(data.classname);
	            $("#edit_cjobcompany").val(data.jobcompany);
	            $("#edit_clocation").val(data.location);
	            $("#edit_cactiveCode").val(data.activeCode);
	            $("#edit_cjobState").val(data.jobState);
	            $("#edit_cjobTime").val(data.jobTime);
	            $("#edit_remark").val(data.remark);
	        }
	    });
	}
    // 执行修改咨询操作
	function updatecrmjob() {
		$.post("update.action",
		  $("#edit_crmjob_form").serialize(),
		  function(data){
			if(data =="OK"){
				alert("咨询信息更新成功！");
				window.location.reload();
			}else{
				alert("咨询信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除咨询
	function deletecrmjob(id) {
	    if(confirm('确实要删除该咨询吗?')) {
		$.post("delete.action",{"id":id},
		function(data){
	            if(data =="OK"){
	                alert("咨询删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除咨询失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</body>
</html>