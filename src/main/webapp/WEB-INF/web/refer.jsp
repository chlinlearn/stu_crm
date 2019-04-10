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
	<!-- 咨询列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">咨询学生管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get" action="refer/list.action">
					<div class="form-group">
						<label for="referName">咨询学生姓名</label> <input type="text"
							class="form-control" id="referName" value="" name="referName">
					</div>
					<div class="form-group">
						<label for="referFrom">咨询来源</label> <select class="form-control"
							id="referFrom" name="referSource">
							<option value="">--请选择--</option>
							<option value="网站">网站</option>
							<option value="现场">现场</option>
							<option value="电话">电话</option>
							<option value="邮件">邮件</option>
						</select>
					</div>
					<div class="form-group">
						<label for="referUser">负责人</label> <select class="form-control"
							id="referUser" name="referUser">
							<option value="">--请选择--</option>
							<option value="4">海丽</option>
						</select>
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<a href="refer/list.action#" class="btn btn-primary"
			data-toggle="modal" data-target="#newreferDialog"
			onclick="clearrefer()">新建</a>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">咨询信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>咨询来源</th>
								<th>咨询师</th>
								<th>学生姓名</th>
								<th>状态</th>
								<th>资源级别</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.rows}" var="refer">
								<tr>
									<td>${refer.id}</td>
									<td>${refer.source}</td>
									<td>${refer.staffName}</td>
									<td>${refer.username}</td>
									<td>${refer.state}</td>
									<td>${refer.resourcelevel}</td>
									<td><a href="" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#referEditDialog"
										onclick="editrefer(${refer.id})">修改</a> <a href=""
										class="btn btn-danger btn-xs"
										onclick="deleterefer(${refer.id})">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<!-- 分页条使用自定义标签实现-->
						<pg:page
							url="${pageContext.request.contextPath }/refer/list.action" />
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
	<!-- 创建咨询模态框 -->
	<div class="modal fade" id="newreferDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
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
							<label for="new_cname" class="col-sm-2 control-label">
								学生姓名 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cname"
									placeholder="学生姓名" name="cname">
							</div>
							<label for="new_csex" class="col-sm-2 control-label"> 性别</label>
							<div class="col-sm-4">
								<select class="form-control" id="new_csex" name="csex">
									<option value="0">女</option>
									<option value="1">男</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="new_source" class="col-sm-2 control-label">
								咨询来源</label>
							<div class="col-sm-4">
								<select class="form-control" id="new_source" name="source">
									<option value="">--请选择--</option>
									<option value="网站">网站</option>
									<option value="现场">现场</option>
									<option value="电话">电话</option>
									<option value="邮件">邮件</option>
								</select>
							</div>
							<label for="new_cstate" class="col-sm-2 control-label">
								咨询状态</label>
							<div class="col-sm-4">
								<select class="form-control" id="new_cstate" name="cstate">
									<option value="咨询中">咨询中</option>
									<option value="已报名">已报名</option>
									<option value="已结束">已结束</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="new_resLevel" class="col-sm-2 control-label">
								资源级别</label>
							<div class="col-sm-4">
								<select class="form-control" id="new_resLevel"
									name="resourcelevel">
									<option value="A">--A--</option>
									<option value="B">--B--</option>
									<option value="C">--C--</option>
									<option value="D">--D--</option>
								</select>
							</div>
							<label for="new_isjob" class="col-sm-2 control-label">
								工作状态</label>
							<div class="col-sm-4">
								<select class="form-control" id="new_isjob" name="isjob">
									<option value="1">在职</option>
									<option value="0">应届生</option>
									<option value="-1">其他</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="new_phone" class="col-sm-2 control-label">联系电话</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_phone"
									placeholder="联系电话" name="phone">
							</div>
							<label for="new_idcard" class="col-sm-2 control-label">身份证号</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_idcard"
									placeholder="身份证号" name="idcard">
							</div>
						</div>
						<div class="form-group">
							<label for="new_weixin" class="col-sm-2 control-label">微信号</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_weixin"
									placeholder="微信号" name="weixin">
							</div>
							<label for="new_qq" class="col-sm-2 control-label">QQ号码</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_qq"
									placeholder="QQ号码" name="qq">
							</div>
						</div>
						<div class="form-group">
							<label for="new_address" class="col-sm-2 control-label">联系地址</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_address"
									placeholder="联系地址" name="address">
							</div>
							<label for="new_cmail" class="col-sm-2 control-label">邮箱地址</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_cmail"
									placeholder="Email地址" name="cmail">
							</div>
						</div>
						<div class="form-group">
							<label for="new_byacademy" class="col-sm-2 control-label">毕业院校</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_byacademy"
									placeholder="毕业院校" name="byacademy">
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
						onclick="createrefer()">创建咨询</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改咨询模态框 -->
	<div class="modal fade" id="referEditDialog" tabindex="-1"
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
							<label for="edit_cname" class="col-sm-2 control-label">
								学生姓名 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_cname"
									placeholder="学生姓名" name="cname">
							</div>
							<label for="edit_csex" class="col-sm-2 control-label"> 性别</label>
							<div class="col-sm-4">
								<select class="form-control" id="edit_csex" name="csex">
									<option value="0">女</option>
									<option value="1">男</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="edit_source" class="col-sm-2 control-label">
								咨询来源</label>
							<div class="col-sm-4">
								<select class="form-control" id="edit_source" name="source">
									<option value="">--请选择--</option>
									<option value="网站">网站</option>
									<option value="现场">现场</option>
									<option value="电话">电话</option>
									<option value="邮件">邮件</option>
								</select>
							</div>
							<label for="edit_cstate" class="col-sm-2 control-label">
								咨询状态</label>
							<div class="col-sm-4">
								<select class="form-control" id="edit_cstate" name="cstate">
									<option value="咨询中">咨询中</option>
									<option value="已报名">已报名</option>
									<option value="已结束">已结束</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="edit_resLevel" class="col-sm-2 control-label">
								资源级别</label>
							<div class="col-sm-4">
								<select class="form-control" id="edit_resLevel"
									name="resourcelevel">
									<option value="A">--A--</option>
									<option value="B">--B--</option>
									<option value="C">--C--</option>
									<option value="D">--D--</option>
								</select>
							</div>
							<label for="edit_isjob" class="col-sm-2 control-label">
								工作状态</label>
							<div class="col-sm-4">
								<select class="form-control" id="edit_isjob" name="isjob">
									<option value="1">在职</option>
									<option value="0">应届生</option>
									<option value="-1">其他</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_phone" class="col-sm-2 control-label">联系电话</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_phone"
									placeholder="联系电话" name="phone">
							</div>
							<label for="edit_idcard" class="col-sm-2 control-label">身份证号</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_idcard"
									placeholder="身份证号" name="idcard">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_weixin" class="col-sm-2 control-label">微信号</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_weixin"
									placeholder="微信号" name="weixin">
							</div>
							<label for="edit_qq" class="col-sm-2 control-label">QQ号码</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_qq"
									placeholder="QQ号码" name="qq">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_address" class="col-sm-2 control-label">联系地址</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_address"
									placeholder="联系地址" name="address">
							</div>
							<label for="edit_cmail" class="col-sm-2 control-label">邮箱地址</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_cmail"
									placeholder="Email地址" name="cmail">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_byacademy" class="col-sm-2 control-label">毕业院校</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_byacademy"
									placeholder="毕业院校" name="byacademy">
							</div>
							<label for="edit_remark" class="col-sm-2 control-label">备注</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_remark"
									placeholder="备注" name="remark">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updaterefer()">保存修改</button>
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
	function clearrefer() {
	    $("#new_cname").val("");
	    $("#new_cstate").val("");
	    $("#new_phone").val("");
	    $("#new_idcard").val("");
	    $("#new_weixin").val("");
	    $("#new_qq").val("");
	    $("#new_address").val("");
	    $("#new_cmail").val("");
	    $("#new_byacademy").val("");
	    $("#new_remark").val("");
	}
	// 创建咨询
	function createrefer() {
	$.post("refer/create.action",
	$("#new_refer_form").serialize(),function(data){
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
	        url:"refer/getReferById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_id").val(data.id);
	            $("#edit_cname").val(data.cname);
	            $("#edit_csex").val(data.csex);
	            $("#edit_source").val(data.source);
	            $("#edit_cstate").val(data.cstate);
	            $("#edit_resLevel").val(data.resourcelevel);
	            $("#edit_isjob").val(data.isjob);
	            $("#edit_phone").val(data.phone);
	            $("#edit_idcard").val(data.idcard);
	            $("#edit_weixin").val(data.weixin);
	            $("#edit_qq").val(data.qq);
	            $("#edit_address").val(data.address);
	            $("#edit_cmail").val(data.cmail);
	            $("#edit_byacademy").val(data.byacademy);
	            $("#edit_remark").val(data.remark);
	        }
	    });
	}
    // 执行修改咨询操作
	function updaterefer() {
		$.post("refer/update.action",
		  $("#edit_refer_form").serialize(),
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
	function deleterefer(id) {
	    if(confirm('确实要删除该咨询吗?')) {
		$.post("refer/delete.action",{"id":id},
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
</html>