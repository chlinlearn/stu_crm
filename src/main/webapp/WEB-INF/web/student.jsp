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
    <!-- 学生列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">在校学生管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get" action="student/list.action">
					<div class="form-group">
						<label for="stuName">学生姓名</label> 
						<input type="text" class="form-control" id="stuName" value="" name="stuName">
					</div>
					 
					<div class="form-group">
						<label for="seclassid">班级</label> 
						<select class="form-control" id="seclassid" name="classid">
							<option value="">--请选择--</option>
							<option value="1">
								    1期JavaEE</option>
							<option value="2">
								    2期JavaEE</option>
							<option value="3">
								    3期JavaEE</option>
							</select>
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<a href="student/list.action#" class="btn btn-primary" data-toggle="modal" data-target="#newstudentDialog" onclick="clearstudent()">新建</a>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">学生信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>学生姓名</th>
								<th>性别</th>
								<th>入学时间</th>
								<th>就业时间</th>
								<th>学生状态</th>
            					<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${students}" var="students">
							<tr>
									<td>${students.id}</td>
									<td>${students.stuname}</td>
									<td>男</td>
									<td>${students.begintime}</td>
									<td>${students.jobtime}</td>
								    <td>${students.stustate}</td>
									<td>
										<a href="student/list.action#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#studentEditDialog" onclick="editstudent(${students.id})">修改</a>
										<a href="student/list.action#" class="btn btn-danger btn-xs" onclick="deletestudent(${students.id})">删除</a>
									</td>
								</tr>
								</c:forEach>
							</tbody>
					</table>
					<div class="col-md-12 text-right">
						<nav><ul class="pagination"><li class="disabled"><a href="student/list.action#">首页 </a></li><li class="disabled"><a href="student/list.action#">上一页 </a></li><li class="active"><a href="student/list.action#">1<spanclass="sr-only"></spanclass="sr-only"></a></li><li class="disabled"><a href="student/list.action#">下一页</a></li><li class="disabled"><a href="student/list.action#">尾页</a></li></ul></nav></div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 学生列表查询部分  end-->
</div>
<!-- 创建学生模态框 -->
<div class="modal fade" id="newstudentDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建学生信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_student_form">
					<div class="form-group">
						<label for="new_stuname" class="col-sm-2 control-label">
						    学生姓名
						</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="new_stuname" placeholder="学生姓名" name="stuname">
						</div>
						<label for="new_stusex" class="col-sm-2 control-label">
						 性别</label>
						<div class="col-sm-4"> 
							<select class="form-control" id="new_stusex" name="stusex">
								<option value="0">女</option>
								<option value="1">男</option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="new_referid" class="col-sm-2 control-label">
						咨询师</label> 
						<div class="col-sm-4">
							<select class="form-control" id="new_referid" name="referid">
								<option value="">--请选择--</option>
								<option value="4">
								     海丽</option>
							    </select>
						</div>
						<label for="new_stustate" class="col-sm-2 control-label">
						学生状态</label> 
						<div class="col-sm-4">
							<select class="form-control" id="new_stustate" name="stustate">
								<option value="学习中">学习中</option>
								<option value="已升班">已升班</option>
								<option value="已转班">已转班</option>
								<option value="已休学">已休学</option>
								<option value="已流失">已流失</option> 
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="new_classid" class="col-sm-2 control-label">
						 分配班级</label>
						<div class="col-sm-4">
							<select class="form-control" id="new_classid" name="classid">
								<option value="">--请选择--</option>
								<option value="1">
								     1期JavaEE</option>
							    <option value="2">
								     2期JavaEE</option>
							    <option value="3">
								     3期JavaEE</option>
							    </select>
							
						</div>
						<label for="new_checklevel" class="col-sm-2 control-label">
						 考评等级</label>
						<div class="col-sm-4">
							<select class="form-control" id="new_checklevel" name="checklevel">
								<option value="A">--A--</option>
								<option value="B">--B--</option>
								<option value="C">--C--</option>
								<option value="D">--D--</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_begintime" class="col-sm-2 control-label">入学时间</label>
						<div class="col-sm-4">
							<input type="datetime-local" class="form-control" id="new_begintime" placeholder="入学时间" name="begintime">
						</div>
						<label for="new_jobtime" class="col-sm-2 control-label">就业时间</label>
						<div class="col-sm-4">
							<input type="datetime-local" class="form-control" id="new_jobtime" placeholder="就业时间" name="jobtime">
						</div>
					</div>
					 
					<div class="form-group">
						<label for="new_remark" class="col-sm-2 control-label">备注</label>
						<div class="col-sm-10">
						    <textarea rows="3" class="form-control" id="new_remark" placeholder="备注" name="remark"></textarea>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createstudent()">创建学生</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改学生模态框 -->
<div class="modal fade" id="studentEditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改学生信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_student_form">
					<input type="hidden" id="edit_id" name="id">
					<div class="form-group">
						<label for="edit_stuname" class="col-sm-2 control-label">
						    学生姓名
						</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="edit_stuname" placeholder="学生姓名" name="stuname">
						</div>
						<label for="edit_stusex" class="col-sm-2 control-label">
						 性别</label>
						<div class="col-sm-4"> 
							<select class="form-control" id="edit_stusex" name="stusex">
								<option value="0">女</option>
								<option value="1">男</option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="edit_referid" class="col-sm-2 control-label">
						咨询师</label> 
						<div class="col-sm-4">
							<select class="form-control" id="edit_referid" name="referid">
								<option value="">--请选择--</option>
								<option value="4">
								     海丽</option>
							    </select>
						</div>
						<label for="edit_stustate" class="col-sm-2 control-label">
						学生状态</label> 
						<div class="col-sm-4">
							<select class="form-control" id="edit_stustate" name="stustate">
								<option value="学习中">学习中</option>
								<option value="已升班">已升班</option>
								<option value="已转班">已转班</option>
								<option value="已休学">已休学</option>
								<option value="已流失">已流失</option> 
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="edit_classid" class="col-sm-2 control-label">
						 分配班级</label>
						<div class="col-sm-4">
							<select class="form-control" id="edit_classid" name="classid">
								<option value="">--请选择--</option>
								<option value="1">
								     1期JavaEE</option>
							    <option value="2">
								     2期JavaEE</option>
							    <option value="3">
								     3期JavaEE</option>
							    </select>
							
						</div>
						<label for="edit_checklevel" class="col-sm-2 control-label">
						 考评等级</label>
						<div class="col-sm-4">
							<select class="form-control" id="edit_checklevel" name="checklevel">
								<option value="A">--A--</option>
								<option value="B">--B--</option>
								<option value="C">--C--</option>
								<option value="D">--D--</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_begintime" class="col-sm-2 control-label">入学时间</label>
						<div class="col-sm-4">
							<input type="datetime-local" class="form-control" id="edit_begintime" placeholder="入学时间" name="begintime">
						</div>
						<label for="edit_jobtime" class="col-sm-2 control-label">就业时间</label>
						<div class="col-sm-4">
							<input type="datetime-local" class="form-control" id="edit_jobtime" placeholder="就业时间" name="jobtime">
						</div>
					</div>
					 
					<div class="form-group">
						<label for="edit_remark" class="col-sm-2 control-label">备注</label>
						<div class="col-sm-10">
						    <textarea rows="3" class="form-control" id="edit_remark" placeholder="备注" name="remark"></textarea>
						</div>
					</div>  
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updatestudent()">保存修改</button>
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
//清空新建学生窗口中的数据
	function clearstudent() {
	    $("#new_stuname").val("");
	    $("#new_stustate").val("");
	    $("#new_begintime").val("");
	    $("#new_jobtime").val("");
	    $("#new_remark").val("");
	}
	// 创建学生
	function createstudent() {
		$.post("student/create.action",
		$("#new_student_form").serialize(),
		function(data){
	        if(data =="OK"){
	            alert("学生创建成功！");
	            window.location.reload();
	        }else{
	            alert("学生创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的学生信息
	function editstudent(id) {
	    $.ajax({
	        type:"get",
	        url:"student/getStudentById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_id").val(data.id);
	            $("#edit_stuname").val(data.stuname);
	            $("#edit_stusex").val(data.stusex);
	            $("#edit_referid").val(data.referid);
	            $("#edit_stustate").val(data.stustate);
	            $("#edit_classid").val(data.classid);
	            $("#edit_checklevel").val(data.checklevel);
	            $("#edit_begintime").val(data.begintime);
	            $("#edit_jobtime").val(data.jobtime);
	            $("#edit_remark").val(data.remark);
	        }
	    });
	}
    // 执行修改学生操作
	function updatestudent() {
		$.post("student/update.action",
		  $("#edit_student_form").serialize(),
		  function(data){
			if(data =="OK"){
				alert("学生信息更新成功！");
				window.location.reload();
			}else{
				alert("学生信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除学生
	function deletestudent(id) {
	    if(confirm('确实要删除该学生吗?')) {
		$.post("student/delete.action",{"id":id},
		function(data){
	            if(data =="OK"){
	                alert("学生删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除学生失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>