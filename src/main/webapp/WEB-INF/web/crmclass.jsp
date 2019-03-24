<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
	<!-- 班级列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">班级管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<!-- 搜索部分 -->
			<div class="panel-body">
				<form class="form-inline" method="get" action="search.action">
					<div class="form-group">
						<label for="crmclassName">班级名称</label> <input type="text"
							class="form-control" id="crmclassName" value="" name="classname">
					</div>
					<div class="form-group">
						<label for="crmstate">状态</label> <select class="form-control"
							id="crmstate" name="state">
							<option value="未开课" selected="selected">未开课</option>
							<option value="已开课">已开课</option>
							<option value="已结束">已结束</option>
						</select>
					</div>
					<div class="form-group">
						<label for="crmtime">时间</label> <input type="datetime-local"
							class="form-control" id="crmtime" placeholder="开班时间"
							name="begintime">
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<a href="#" class="btn btn-primary" data-toggle="modal"
			data-target="#newCrmclassDialog" onclick="clearCrmclass()">新建</a> <a
			href="crmclass/list.action#" class="btn btn-info" data-toggle="modal"
			data-target="#uploadDialog" onclick="clearupload()">上传课表</a>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">班级信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>班级名称</th>
								<th>开授课程</th>
								<th>开班时间</th>
								<th>毕业时间</th>
								<th>状态</th>
								<th>学生总数</th>
								<th>升学数</th>
								<th>留班数</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${crmClasses}" var="crmClasses">
								<tr>
									<td>${crmClasses.id}</td>
									<td>${crmClasses.classname}</td>
									<td>${crmClasses.lessontypeid}</td>
									<td>${crmClasses.begintime}</td>
									<td>${crmClasses.endtime}</td>
									<td>${crmClasses.state}</td>
									<td>${crmClasses.totalcount}</td>
									<td>${crmClasses.gocount}</td>
									<td>${crmClasses.leavecount}</td>
									<td><a href="crmclass/list.action#"
										class="btn btn-primary btn-xs" data-toggle="modal"
										data-target="#crmclassEditDialog"
										onclick="editcrmclass(${crmClasses.id})">修改</a> <a
										href="crmclass/list.action#" class="btn btn-danger btn-xs"
										onclick="deletecrmclass(${crmClasses.id})">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<nav>
						<ul class="pagination">
							<li class="disabled"><a href="crmclass/list.action#">首页
							</a></li>
							<li class="disabled"><a href="crmclass/list.action#">上一页
							</a></li>
							<li class="active"><a href="crmclass/list.action#">1<spanclass="sr-only"></spanclass="sr-only"></a></li>
							<li class="disabled"><a href="crmclass/list.action#">下一页</a></li>
							<li class="disabled"><a href="crmclass/list.action#">尾页</a></li>
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
	<!-- 班级列表查询部分  end-->
	</div>
	<!-- 上传课表模态框 -->
	<div class="modal fade" id="uploadDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">上传课表信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_crmclass_form">
						<div class="form-group">
							<label for="new_uploadfilename" class="col-sm-2 control-label">
								上传课表名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_uploadfilename"
									placeholder="上传课表名称" name="uploadfilename">
							</div>
						</div>
						<div class="form-group">
							<label for="new_uploadpath" class="col-sm-2 control-label">
								上传课表位置 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_uploadpath"
									placeholder="上传课表位置" name="uploadpath">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createcrmclass()">创建班级</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 创建班级模态框 -->
	<div class="modal fade" id="newCrmclassDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建班级信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_crmclass_form">
						<div class="form-group">
							<label for="new_crmclassName" class="col-sm-2 control-label">
								班级名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_crmclassName"
									placeholder="班级名称" name="classname">
							</div>
						</div>
						<div class="form-group">
							<label for="new_begintime" class="col-sm-2 control-label">
								开班时间 </label>
							<div class="col-sm-4">
								<input type="datetime-local" class="form-control"
									id="new_begintime" placeholder="开班时间" name="begintime">
							</div>
							<label for="new_endtime" class="col-sm-2 control-label">
								毕业时间 </label>
							<div class="col-sm-4">
								<input type="datetime-local" class="form-control"
									id="new_endtime" placeholder="毕业时间" name="endtime">
							</div>
						</div>
						<div class="form-group">
							<label for="new_state" class="col-sm-2 control-label"> 状态
							</label>
							<div class="col-sm-4">
								<select class="form-control" id="new_state" name="state">
									<option value="未开课" selected="selected">未开课</option>
									<option value="已开课">已开课</option>
									<option value="已结束">已结束</option>
								</select>
							</div>
							<label for="new_totalcount" class="col-sm-2 control-label">
								学生总数 </label>
							<div class="col-sm-4">
								<input type="number" class="form-control" id="new_totalcount"
									placeholder="学生总数" name="totalcount">
							</div>
						</div>
						<div class="form-group">
							<label for="new_gocount" class="col-sm-2 control-label">
								升学数 </label>
							<div class="col-sm-4">
								<input type="number" class="form-control" id="new_gocount"
									placeholder="升学数" name="gocount">
							</div>
							<label for="new_leavecount" class="col-sm-2 control-label">
								留班数 </label>
							<div class="col-sm-4">
								<input type="number" class="form-control" id="new_leavecount"
									placeholder="留班数" name="leavecount">
							</div>
						</div>
						<div class="form-group">
							<label for="new_lessontype" class="col-sm-2 control-label">
								所属课程 </label>
							<div class="col-sm-10">
								<select class="form-control" id="new_lessontype"
									name="lessontypeid">
									<option value="0">---请选择---</option>
									<option value="1">Java基础</option>
									<option value="2">Java就业</option>
									<option value="3">Java Web基础</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="new_remark" class="col-sm-2 control-label">
								备注 </label>
							<div class="col-sm-10">
								<textarea rows="3" type="text" class="form-control"
									id="new_remark" placeholder="备注" name="remark"></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createcrmclass()">创建班级</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改班级模态框 -->
	<div class="modal fade" id="crmclassEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改班级信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_crmclass_form">
						<input type="hidden" id="edit_classid" name="classid">
						<div class="form-group">
							<label for="edit_crmclassName" class="col-sm-2 control-label">
								班级名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_crmclassName"
									placeholder="班级名称" name="name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_begintime" class="col-sm-2 control-label">
								开班时间 </label>
							<div class="col-sm-4">
								<input type="datetime-local" class="form-control"
									id="edit_begintime" placeholder="开班时间" name="begintime">
							</div>
							<label for="edit_endtime" class="col-sm-2 control-label">
								毕业时间 </label>
							<div class="col-sm-4">
								<input type="datetime-local" class="form-control"
									id="edit_endtime" placeholder="毕业时间" name="endtime">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_state" class="col-sm-2 control-label">
								状态 </label>
							<div class="col-sm-4">
								<select class="form-control" id="edit_state" name="state">
									<option value="未开课" selected="selected">未开课</option>
									<option value="已开课">已开课</option>
									<option value="已结束">已结束</option>
								</select>
							</div>
							<label for="edit_totalcount" class="col-sm-2 control-label">
								学生总数 </label>
							<div class="col-sm-4">
								<input type="number" class="form-control" id="edit_totalcount"
									placeholder="学生总数" name="totalcount">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_gocount" class="col-sm-2 control-label">
								升学数 </label>
							<div class="col-sm-4">
								<input type="number" class="form-control" id="edit_gocount"
									placeholder="升学数" name="gocount">
							</div>
							<label for="edit_leavecount" class="col-sm-2 control-label">
								留班数 </label>
							<div class="col-sm-4">
								<input type="number" class="form-control" id="edit_leavecount"
									placeholder="留班数" name="leavecount">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_lessontype" class="col-sm-2 control-label">
								所属课程 </label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_lessontype"
									name="lessontypeid">
									<option value="0">---请选择---</option>
									<option value="1">Java基础</option>
									<option value="2">Java就业</option>
									<option value="3">Java Web基础</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_remark" class="col-sm-2 control-label">
								备注 </label>
							<div class="col-sm-10">
								<textarea rows="3" type="text" class="form-control"
									id="edit_remark" placeholder="备注" name="remark"></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updatecrmclass()">保存修改</button>
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
//清空新建班级窗口中的数据
	function clearCrmclass() {
	    $("#new_crmclassName").val(""); 
	    $("#new_begintime").val(""); 
	    $("#new_endtime").val(""); 
	    $("#new_state").val(""); 
	    $("#new_totalcount").val(""); 
	    $("#new_gocount").val(""); 
	    $("#new_leavecount").val(""); 
	    $("#new_lessontype").val(""); 
	    $("#new_uploadfilename").val(""); 
	    $("#new_uploadpath").val(""); 
	    $("#new_remark").val(""); 
	}
	// 创建班级
	function createcrmclass() {
		alert("点击")
	$.Post("create.action",
	$("#new_crmclass_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("班级创建成功！");
	            window.location.reload();
	        }else{
	            alert("班级创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的班级信息
	function editcrmclass(id) {
	    $.ajax({
	        type:"get",
	        url:"crmclass/getcrmclassById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_classid").val(data.classid);
	            $("#edit_crmclassName").val(data.name); 
	            $("#edit_begintime").val(data.begintime);
	            $("#edit_endtime").val(data.endtime);
	            $("#edit_state").val(data.state);
	            $("#edit_totalcount").val(data.totalcount); 
	            $("#edit_gocount").val(data.gocount);
	            $("#edit_leavecount").val(data.leavecount);
	            $("#edit_lessontype").val(data.lessontypeid);
	            $("#edit_uploadfilename").val(data.uploadfilename);
	            $("#edit_uploadpath").val(data.uploadpath);
	            $("#edit_remark").val(data.remark);
	        }
	    });
	}
    // 执行修改班级操作
	function updatecrmclass() {
		$.Post("crmclass/update.action",
		 $("#edit_crmclass_form").serialize(),
		  function(data){
			if(data =="OK"){
				alert("班级信息更新成功！");
				window.location.reload();
			}else{
				alert("班级信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除班级
	function deletecrmclass(id) {
	 if(confirm('确实要删除该班级吗?')) {
	 $.Post("crmclass/delete.action",{"id":id},
	  function(data){
	            if(data =="OK"){
	                alert("班级删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除班级失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>

</body>
</html>