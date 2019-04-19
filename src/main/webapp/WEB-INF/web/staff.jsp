<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://itcx.com/pagination/" prefix="pg"%>
<!-- base模板 -->
<%@ include file="base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
	<!-- 员工列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">员工管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<!-- 搜索部分 -->
			<div class="panel-body">
				<form class="form-inline" method="get" action="crmstaff/list.action">
					<div class="form-group">
						<label for="crmstaffName">员工名称</label> <input type="text"
							class="form-control" id="crmstaffName" value="" name="staffName">
					</div>
					<div class="form-group">
						<label for="crmpostid">职务</label> <select class="form-control"
							id="crmpostid" name="postID">
							<option value="1" selected="selected">班主任</option>
							<option value="2">教师</option>
							<option value="3">经理</option>
							<option value="4">督导主任</option>
							<option value="5">教师</option>					
						</select>
					</div>
					<div class="form-group">
						<label for="crmtime">时间</label> <input type="datetime-local"
							class="form-control" id="crmtime" placeholder="开班时间" name="onDutyDate">
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<a href="crmstaff/list.action#" class="btn btn-primary"
			data-toggle="modal" data-target="#newcrmstaffDialog"
			onclick="clearcrmstaff()">新建</a>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">员工信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>员工名称</th>
								<th>性别</th>
								<th>生日</th>
								<th>入职日期</th>
								<th>职务</th>
								<th>操作</th>
							</tr>
						</thead>
							<tbody>
							<c:forEach items="${page.rows}" var="staffs">
								<tr>
									<td>${staffs.id}</td>
									<td>${staffs.staffName}</td>
									<td>${staffs.gender}</td>
									<td>${staffs.birthday}</td>
									<td>${staffs.onDutyDate}</td>
									<td>${staffs.postName}</td>
									<td><a href="" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#crmstaffEditDialog"
										onclick="editcrmstaff(${staffs.id})">修改</a> <a href=""
										class="btn btn-danger btn-xs"
										onclick="deletecrmstaff(${staffs.id})">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<!-- 分页条使用自定义标签实现-->
						<pg:page
							url="${pageContext.request.contextPath }/staff/list.action" />
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 员工列表查询部分  end-->
	</div>
	<!-- 创建员工模态框 -->
	<div class="modal fade" id="newcrmstaffDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建员工信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_crmstaff_form">
						<div class="form-group">
							<label for="new_crmstaffName" class="col-sm-2 control-label">
								员工名称 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_crmstaffName"
									placeholder="员工名称" name="staffname">
							</div>
							<label for="new_begintime" class="col-sm-2 control-label">
								性别 </label>
							<div class="col-sm-4">
								<select class="form-control" id="new_gender" name="gender">
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="new_birthday" class="col-sm-2 control-label">
								生日 </label>
							<div class="col-sm-4">
								<input type="datetime-local" class="form-control"
									id="new_birthday" placeholder="生日" name="birthday">
							</div>
							<label for="new_ondutydate" class="col-sm-2 control-label">
								入职日期 </label>
							<div class="col-sm-4">
								<input type="datetime-local" class="form-control"
									id="new_ondutydate" placeholder="入职日期" name="ondutydate">
							</div>
						</div>
						<div class="form-group">
							<label for="new_loginname" class="col-sm-2 control-label">
								登录名 </label>
							<div class="col-sm-4">
								<input type="number" class="form-control" id="new_loginname"
									placeholder="登录名" name="loginname">
							</div>
							<label for="new_loginpwd" class="col-sm-2 control-label">
								登录密码 </label>
							<div class="col-sm-4">
								<input type="number" class="form-control" id="new_loginpwd"
									placeholder="登录密码" name="loginpwd">
							</div>
						</div>
						<div class="form-group">
							<label for="new_staffcode" class="col-sm-2 control-label">
								员工编号 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_staffcode"
									placeholder="员工编号" name="staffcode">
							</div>
							<label for="new_lessontype" class="col-sm-2 control-label">
								职务 </label>
							<div class="col-sm-4">
								<select class="form-control" id="new_postid" name="postid">
									<option value="0">---请选择---</option>
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createcrmstaff()">创建员工</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改员工模态框 -->
	<div class="modal fade" id="crmstaffEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改员工信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_crmstaff_form">
						<input type="hidden" id="edit_staffid" name="staffid">
						<div class="form-group">
							<label for="edit_crmstaffName" class="col-sm-2 control-label">
								员工名称 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_crmstaffName"
									placeholder="员工名称" name="staffname">
							</div>
							<label for="edit_gender" class="col-sm-2 control-label">
								性别 </label>
							<div class="col-sm-4">
								<select class="form-control" id="edit_gender" name="gender">
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_birthday" class="col-sm-2 control-label">
								生日 </label>
							<div class="col-sm-4">
								<input type="datetime-local" class="form-control"
									id="edit_birthday" placeholder="生日" name="birthday">
							</div>
							<label for="edit_ondutydate" class="col-sm-2 control-label">
								入职日期 </label>
							<div class="col-sm-4">
								<input type="datetime-local" class="form-control"
									id="edit_ondutydate" placeholder="入职日期" name="ondutydate">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_loginname" class="col-sm-2 control-label">
								登录名 </label>
							<div class="col-sm-4">
								<input type="number" class="form-control" id="edit_loginname"
									placeholder="登录名" name="loginname">
							</div>
							<label for="edit_loginpwd" class="col-sm-2 control-label">
								登录密码 </label>
							<div class="col-sm-4">
								<input type="number" class="form-control" id="edit_loginpwd"
									placeholder="登录密码" name="loginpwd">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_staffcode" class="col-sm-2 control-label">
								员工编号 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_staffcode"
									placeholder="员工编号" name="staffcode">
							</div>
							<label for="edit_postid" class="col-sm-2 control-label">
								职务 </label>
							<div class="col-sm-4">
								<select class="form-control" id="edit_postid" name="postid">
									<option value="0">---请选择---</option>
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updatecrmstaff()">保存修改</button>
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
//清空新建员工窗口中的数据
	function clearcrmstaff() {
	    $("#new_crmstaffName").val(""); 
	    $("#new_gender").val(""); 
	    $("#new_birthday").val(""); 
	    $("#new_ondutydate").val(""); 
	    $("#new_loginname").val(""); 
	    $("#new_loginpwd").val(""); 
	    $("#new_staffcode").val(""); 
	    $("#new_postid").val(""); 
	}
	// 创建员工
	function createcrmstaff() {
	$.Post("crmstaff/create.action",
	$("#new_crmstaff_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("员工创建成功！");
	            window.location.reload();
	        }else{
	            alert("员工创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的员工信息
	function editcrmstaff(id) {
	    $.ajax({
	        type:"get",
	        url:"crmstaff/getStaffById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_staffid").val(data.staffid);
	            $("#edit_crmstaffName").val(data.staffName);
	            $("#edit_gender").val(data.gender); 
	            $("#edit_birthday").val(data.birthday);
	            $("#edit_ondutydate").val(data.onDutyDate);
	            $("#edit_loginname").val(data.loginName);
	            $("#edit_loginpwd").val(data.loginPwd);
	            $("#edit_staffcode").val(data.staffCode);
	            $("#edit_postid").val(data.postID);
	        }
	    });
	}
    // 执行修改员工操作
	function updatecrmstaff() {
		$.Post("crmstaff/update.action",
		 $("#edit_crmstaff_form").serialize(),
		  function(data){
			if(data =="OK"){
				alert("员工信息更新成功！");
				window.location.reload();
			}else{
				alert("员工信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除员工
	function deletecrmstaff(id) {
	 if(confirm('确实要删除该员工吗?')) {
	 $.Post("crmstaff/delete.action",{"id":id},
	  function(data){
	            if(data =="OK"){
	                alert("员工删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除员工失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>

</body>
</html>