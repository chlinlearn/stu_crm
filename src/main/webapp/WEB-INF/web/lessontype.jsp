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
				<h1 class="page-header">课程信息管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get" action="search.action">
					<div class="form-group">
						<label for="lessonName">课程名</label> <input type="text"
							class="form-control" id="lessonName" value="" name="lessonName">
					</div>
			<button type="submit" class="btn btn-primary">查询</button>
			</form>
		</div>
	</div>
	<a href="create.action#" class="btn btn-primary" data-toggle="modal"
		data-target="#newlessontypeDialog" onclick="clearlessontype()">新建</a>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">课程信息列表</div>
				<!-- /.panel-heading -->
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>编号</th>
							<th>课程名称</th>
							<th>课程费用</th>
							<th>总课时</th>
							<th>备注</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${lessontypes}" var="lessontypes">
							<tr>
								<td>${lessontypes.id}</td>
								<td>${lessontypes.lessonName}</td>
								<td>${lessontypes.lessonCost }</td>
								<td>${lessontypes.totalTime }</td>
								<td>${lessontypes.remark }</td>
								<td><a href="update.action#" class="btn btn-primary btn-xs"
									data-toggle="modal" data-target="#lessontypeEditDialog"
									onclick="editlessontype(${lessontypes.id})">修改</a> <a
									href="delete.action#" class="btn btn-danger btn-xs"
									onclick="deletelessontype(${lessontypes.id})">删除</a></td>
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
	<div class="modal fade" id="newlessontypeDialog" tabindex="-1"
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
					<form class="form-horizontal" id="new_refer_form">
						<div class="form-group">
							<label for="new_clessonName" class="col-sm-2 control-label">
								课程名称 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_clessonName"
									placeholder="课程名称" name="clessonName">
							</div>
							<label for="new_clessonCost" class="col-sm-2 control-label">
								课程费用 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_clessonCost"
									placeholder="课程费用" name="clessonCost">

							</div>
						</div>
						<div class="form-group">
							<label for="new_ctotalTime" class="col-sm-2 control-label">
								总课时 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_ctotalTime"
									placeholder="总课时" name="ctotalTime">
							</div>
							<label for="new_cremark" class="col-sm-2 control-label">
								备注 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cremark"
									placeholder="备注" name="cremark">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createlessontype()">创建咨询</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改咨询模态框 -->
	<div class="modal fade" id="lessontypeEditDialog" tabindex="-1"
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
					<form class="form-horizontal" id="edit_lessontype_form">
						<input type="hidden" id="edit_id" name="id">
						<div class="form-group">
							<label for="new_clessonName" class="col-sm-2 control-label">
								课程名称 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_clessonName"
									placeholder="课程名称" name="clessonName">
							</div>
							<label for="new_clessonCost" class="col-sm-2 control-label">
								课程费用 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_clessonCost"
									placeholder="课程费用" name="clessonCost">

							</div>
						</div>
						<div class="form-group">
							<label for="new_ctotalTime" class="col-sm-2 control-label">
								总课时 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_ctotalTime"
									placeholder="总课时" name="ctotalTime">
							</div>
							<label for="new_cremark" class="col-sm-2 control-label">
								备注 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cremark"
									placeholder="备注" name="cremark">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updatelessontype()">保存修改</button>
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
	function clearlessontype() {
	    $("#new_clessonName").val("");
	    $("#new_clessonCost").val("");
	    $("#new_ctotalTime").val("");
	    $("#new_cremark").val("");
	}
	// 创建咨询
	function createlessontype() {
	$.post("create.action",
	$("#new_lessontype_form").serialize(),function(data){
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
	function editrefer(id) {
	    $.ajax({
	        type:"get",
	        url:"refer/getLessonTypeById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_id").val(data.id);
	            $("#edit_clessonName").val(data.lessonName);
	            $("#edit_clessonCost").val(data.lessonCost);
	            $("#edit_ctotalTime").val(data.totalTime);
	            $("#edit_cremark").val(data.remark);	            
	        }
	    });
	}
    // 执行修改咨询操作
	function updatelessontype() {
		$.post("update.action",
		  $("#edit_lessontype_form").serialize(),
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
	function deletelessontype(id) {
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