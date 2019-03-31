<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
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
		<!-- 部门列表查询部分  start-->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">部门管理</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<!-- 搜索部分 -->
				<div class="panel-body">
					<form class="form-inline" method="get"
						action="search.action">
						<div class="form-group">
							<label for="departmentName">部门名称</label> <input type="text"
								class="form-control" id="depname" value="" name="depname">
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
					</form>
				</div>
			</div>
			<a href="#" class="btn btn-primary"
				data-toggle="modal" data-target="#newDeptDialog"
				onclick="clearDept()">新建</a>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">部门信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>编号</th>
									<th>部门名称</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${departments}" var="dep">
									<tr>
										<td>${dep.id}</td>
										<td>${dep.depName}</td>
										<td><a href="#"
											class="btn btn-primary btn-xs" data-toggle="modal"
											data-target="#departmentEditDialog"
											onclick="editdepartment(${dep.id})">修改</a> <a
											href="department/list.action#" class="btn btn-danger btn-xs"
											onclick="deletedepartment(${dep.id})">删除</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<nav>
							<ul class="pagination">
								<li class="disabled"><a href="department/list.action#">首页
								</a></li>
								<li class="disabled"><a href="department/list.action#">上一页
								</a></li>
								<li class="active"><a href="department/list.action#">1<spanclass="sr-only"></spanclass="sr-only"></a></li>
								<li><a href="department/list.action?page=2&amp;rows=5">2</a></li>
								<li><a href="department/list.action?page=2&amp;rows=5">下一页</a></li>
								<li><a href="department/list.action?page=2">尾页</a></li>
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
		<!-- 部门列表查询部分  end-->
	</div>
	<!-- 创建部门模态框 -->
	<div class="modal fade" id="newDeptDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建部门信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_department_form">
						<div class="form-group">
							<label for="new_departmentName" class="col-sm-2 control-label">
								部门名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_departmentName"
									placeholder="部门名称" name="depname">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createdepartment()">创建部门</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改部门模态框 -->
	<div class="modal fade" id="departmentEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改部门信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_department_form">
						<input type="hidden" id="edit_depid" name="depid">
						<div class="form-group">
							<label for="edit_departmentName" class="col-sm-2 control-label">部门名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_departmentName"
									placeholder="部门名称" name="depname">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updatedepartment()">保存修改</button>
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
//清空新建部门窗口中的数据
	function clearDept() {
	    $("#new_departmentName").val(""); 
	}
	// 创建部门
	function createdepartment() {
	$.post("create.action",
	$("#new_department_form").serialize(),function(data){
		    alert(data.depName)
	        if(data){
	            alert("部门创建成功！");
	            window.location.reload();
	        }else{
	            alert("部门创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的部门信息
	function editdepartment(id) {
	    $.ajax({
	        type:"get",
	        url:"",/* getDepartmentById.action */
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_depid").val(data.id);
	            $("#edit_departmentName").val(data.depname); 
	            
	        }
	    });
	}
    // 执行修改部门操作
	function updatedepartment() {
		$.post("update.action",$("#edit_department_form").serialize(),function(data){
			if(data =="OK"){
				alert("部门信息更新成功！");
				window.location.reload();
			}else{
				alert("部门信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除部门
	function deletedepartment(id) {
	    if(confirm('确实要删除该部门吗?')) {
	$.post("department/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("部门删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除部门失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>