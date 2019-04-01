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
				<h1 class="page-header">学生就业公司信息管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get" action="search.action">
					<div class="form-group">
						<label for="companyName">工作单位</label> <input type="text"
							class="form-control" id="companyName" value="" name="companyName">
					</div>
					<div class="form-group">
						<label for="comCode">机构代码</label> <input type="text"
							class="form-control" id="comCode" value="" name="comCode">
					</div>			
			<button type="submit" class="btn btn-primary">查询</button>
			</form>
		</div>
	</div>
	<a href="create.action#" class="btn btn-primary"
		data-toggle="modal" data-target="#newjoncompanyDialog"
		onclick="clearjobcompany()">新建</a>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">学生就业公司信息列表</div>
				<!-- /.panel-heading -->
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>编号</th>
							<th>工作单位</th>
							<th>机构代码</th>
							<th>单位地址</th>
							<th>单位联系人</th>
							<th>单位电话</th>
							<th>工作岗位</th>
							<th>薪酬</th>
							<th>企业状态</th>
							<th>备注</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${jobcompanys}" var="jobcompanys">
							<tr>
								<td>${jobcompanys.id}</td>
								<td>${jobcompanys.companyName}</td>
								<td>${jobcompanys.comCode }</td>
								<td>${jobcompanys.address }</td>
								<td>${jobcompanys.linkman }</td>
								<td>${jobcompanys.telephone }</td>
								<td>${jobcompanys.quarters }</td>
								<td>${jobcompanys.emolument }</td>
								<td>${jobcompanys.state }</td>
								<td>${jobcompanys.remark }</td>
								<td><a href="update.action" class="btn btn-primary btn-xs"
									data-toggle="modal" data-target="#jobcompanyEditDialog"
									onclick="editjobcompany(${jobcompanys.id})">修改</a> <a
									href="delete.action" class="btn btn-danger btn-xs"
									onclick="deletejobcompany(${jobcompanys.id})">删除</a></td>
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
	<div class="modal fade" id="newjobcompanyDialog" tabindex="-1"
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
					<form class="form-horizontal" id="new_jobcompany_form">
						<div class="form-group">
							<label for="new_ccompanyName" class="col-sm-2 control-label">
								工作单位</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_ccompanyName"
									placeholder="工作单位" name="cccompanyName">
							</div>
							<label for="new_ccomCode" class="col-sm-2 control-label">
								机构代码</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_ccomCode"
									placeholder="机构代码" name="ccomCode">
							</div>
						</div>
						<div class="form-group">
							<label for="new_caddress" class="col-sm-2 control-label">
								单位地址 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_caddress"
									placeholder="单位地址" name="caddress">
							</div>
							<label for="new_clinkman" class="col-sm-2 control-label">
								单位联系人</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_clinkman"
									placeholder="单位联系人 " name="clinkman">
							</div>
						</div>
						<div class="form-group">
							<label for="new_ctelephone" class="col-sm-2 control-label">
								单位电话 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_ctelephone"
									placeholder="单位电话" name="ctelephone">
							</div>
							<label for="new_cquarters" class="col-sm-2 control-label">
								工作岗位 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cquarters"
									placeholder="工作岗位" name="cquarters">
							</div>
						</div>
						<div class="form-group">
							<label for="new_cemolument" class="col-sm-2 control-label">
								薪酬 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cemolument"
									placeholder="薪酬" name="cemolument">
							</div>
							<label for="new_cstate" class="col-sm-2 control-label">
								企业状态</label>
							<div class="col-sm-4">
								<select class="form-control" id="new_cstate" name="cstate">
									<option value="0">女</option>
									<option value="1">男</option>
								</select>
							</div>
						</div>
						<div class="form-group">
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
						onclick="createjobcompany()">创建咨询</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改咨询模态框 -->
	<div class="modal fade" id="jobcompanyEditDialog" tabindex="-1"
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
							<label for="new_ccompanyName" class="col-sm-2 control-label">
								工作单位</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_ccompanyName"
									placeholder="工作单位" name="cccompanyName">
							</div>
							<label for="new_ccomCode" class="col-sm-2 control-label">
								机构代码</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_ccomCode"
									placeholder="机构代码" name="ccomCode">
							</div>
						</div>
						<div class="form-group">
							<label for="new_caddress" class="col-sm-2 control-label">
								单位地址 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_caddress"
									placeholder="单位地址" name="caddress">
							</div>
							<label for="new_clinkman" class="col-sm-2 control-label">
								单位联系人</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_clinkman"
									placeholder="单位联系人 " name="clinkman">
							</div>
						</div>
						<div class="form-group">
							<label for="new_ctelephone" class="col-sm-2 control-label">
								单位电话 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_ctelephone"
									placeholder="单位电话" name="ctelephone">
							</div>
							<label for="new_cquarters" class="col-sm-2 control-label">
								工作岗位 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cquarters"
									placeholder="工作岗位" name="cquarters">
							</div>
						</div>
						<div class="form-group">
							<label for="new_cemolument" class="col-sm-2 control-label">
								薪酬 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cemolument"
									placeholder="薪酬" name="cemolument">
							</div>
							<label for="new_cstate" class="col-sm-2 control-label">
								企业状态</label>
							<div class="col-sm-4">
								<select class="form-control" id="new_cstate" name="cstate">
									<option value="0">女</option>
									<option value="1">男</option>
								</select>
							</div>
						</div>
						<div class="form-group">
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
						onclick="updatejobcompany()">保存修改</button>
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
	function clearjobcompany() {
	    $("#new_ccompanyName").val("");
	    $("#new_ccomCode").val("");
	    $("#new_caddress").val("");
	    $("#new_clinkman").val("");
	    $("#new_ctelephone").val("");
	    $("#new_cquarters").val("");
	    $("#new_cemolument").val("");
	    $("#new_cstate").val("");
	    $("#new_cremark").val("");
	}
	// 创建咨询
	function createjobcompany() {
	$.post("create.action",
	$("#new_jobcompany_form").serialize(),function(data){
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
	        url:"refer/getJobCompanyById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_id").val(data.id);
	            $("#edit_ccompanyName").val(data.companyName);
	            $("#edit_ccomCode").val(data.comCode);
	            $("#edit_caddress").val(data.address);
	            $("#edit_clinkman").val(data.linkman);
	            $("#edit_ctelephone").val(data.telephone);
	            $("#edit_cquarters").val(data.quarters);
	            $("#edit_cemolument").val(data.emolument);
	            $("#edit_cstate").val(data.state);
	            $("#edit_cremark").val(data.remark);
	        }
	    });
	}
    // 执行修改咨询操作
	function updatejobcompany() {
		$.post("update.action",
		  $("#edit_jobcompany_form").serialize(),
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
	function deletejobcompany(id) {
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