<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="whit" uri="http://whit.cn/common/"%>
<%
	String path = request.getContextPath();

	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台管理系统</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">

<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style type="text/css">
   
		#page-wrapper{
			margin-left: 0px;
		}
		.page-header{
			margin-top:10px;
		}
		td{
			text-align: center;
		}
    </style>

</head>
<body class="hold-transition skin-blue sidebar-mini">

	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">证书管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline"
					action="${pageContext.request.contextPath }/frmCertificate/frm"
					method="post">
					<div class="form-group">
						<label for="frmName">证书获得者姓名</label> <input type="text"
							class="form-control" id="frmName" value="${name }"
							name="name">
					</div>
					 
					<div class="form-group" style="margin-left: 15px;">
						<label for="isquery">证书状态</label>
						<select class="form-control" id="isquery" name="isquery">
							<option value="">--请选择--</option>
							<c:forEach items="${isQueryType}" var="item">
								<option value="${item.dict_id}"
									<c:if test="${item.dict_id == isquery}"> selected</c:if>>${item.dict_item_name }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group" style="margin-left: 15px;">
						<label for="frmName">手机号码</label> <input type="text"
							class="form-control" id="frmPhone" value="${phone }"
							name="phone">
					</div>
					<div class="form-group" style="margin-left: 15px;">
						<label for="frmName">证书编号</label> <input type="text"
							class="form-control" id="frmNumber" value="${number }"
							name="number">
					</div>
					<button type="submit" class="btn btn-primary" style="margin-left: 15px;width:80px">查  询</button>
					
				</form>
				<button data-toggle="modal" data-target="#editDialog" onclick="editData('new')"  class="btn btn-primary" style="float: right;margin-top:-33px">新  增</button>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">客户信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>ID</th>
								<th>证书获得者姓名</th>
								<th>证书类型</th>
								<th>证书编号</th>
								<th>手机号码</th>
								<th>是否已查询</th>
								<th>查询次数</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<td>${row.id}</td>
									<td>${row.name}</td>
									<td>${row.type}</td>
									<td>${row.number}</td>
									<td>${row.phone}</td>
									<td>
										<c:if test="${row.isquery == '10001'}"> 已查询</c:if>
										<c:if test="${row.isquery == '10002'}"> 未查询</c:if>
									</td>
									<td>${row.queryTimes}</td>
									<td style="text-align: center;"><a href="#" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#editDialog"
										onclick="editData(${row.id})">修改</a> <a href="#"
										class="btn btn-danger btn-xs"
										onclick="deleteData(${row.id})">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<whit:page
							url="${pageContext.request.contextPath }/frmCertificate/frm" />
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- /#page-wrapper -->
	<!-- 新建、编辑对话框 -->
	<div class="modal fade" id="editDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_data_form" >
						<input type="hidden" id="edit_id" name="id"/>
						<div class="form-group">
							<label for="edit_name" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_name" placeholder="姓名" name="name">
							</div>
						</div>
						<div class="form-group igroreInput">
							<label for="edit_name" class="col-sm-2 control-label">证书类型</label>
							<div class="col-sm-10">
								<input type="text" readonly="readonly" class="form-control" id="edit_type" placeholder="证书类型" name="type">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_number" class="col-sm-2 control-label">证书编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control"  id="edit_number" placeholder="证书编号" name="number">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_phone" class="col-sm-2 control-label">手机号码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_phone" placeholder="手机号码" name="phone">
							</div>
						</div>
						<div class="form-group igroreInput" >
							<label for="edit_custIndustry" style="float:left;padding:7px 15px 0 27px;">查询状态</label>
							<div class="col-sm-10"> 
								<select	class="form-control" id="edit_isquery"  name="isquery">
									<option value="">--请选择--</option>
									<c:forEach items="${isQueryType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == isquery}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group igroreInput">
							<label for="edit_queryTimes" class="col-sm-2 control-label">查询次数</label>
							<div class="col-sm-10">
								<input type="text" readonly="readonly" class="form-control" id="edit_queryTimes" placeholder="查询次数" name="queryTimes">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="btnNewOrEdit" type="button" class="btn btn-primary" onclick="updateData()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	
	<script type="text/javascript">
		//打开编辑窗口
		function editData(id) {
			if(id == 'new'){
				//新增
				//新增窗口的标题
				//新增的时候只需要填写必要字段
				$("#myModalLabel").text("新增证书");
				$(".igroreInput").hide();
				$("#btnNewOrEdit").text("确定");
				$("#edit_id").val("");
				$("#edit_name").val("");
				$("#edit_number").val("");
				$("#edit_phone").val("");
				 
			}else{
				$("#myModalLabel").text("修改信息");
				$(".igroreInput").show();
				$("#btnNewOrEdit").text("保存修改");
				//编辑
				$.ajax({
					type:"get",
					url:"<%=basePath%>frmCertificate/edit.action",
					data:{"id":id},
					success:function(data) {  
						$("#edit_id").val(data.id);
						$("#edit_name").val(data.name);
						$("#edit_type").val(data.type)
						$("#edit_number").val(data.number)
						$("#edit_phone").val(data.phone)
						$("#edit_isquery").val(data.isquery);
						$("#edit_queryTimes").val(data.queryTimes);
					}
				});
			}
			
		}
		//更新数据 + 新建
		function updateData() {
			new FormData
			if($("#edit_id").val() == ""){
				//新建，只上传指定的字段
				$.ajax({
					type:"get",
					url:"<%=basePath%>frmCertificate/update.action",
					data:{
						"name":$("#edit_name").val(),
						"number":$("#edit_number").val(),
						"phone":$("#edit_phone").val()
					},
					success:function(data) {  
						alert("添加成功！");
						window.location.reload();
					}
				})
			}else{
				//编辑，自动序列化，没有后台类型转换的问题。todo
				$.post("<%=basePath%>frmCertificate/update.action",$("#edit_data_form").serialize(),function(data){
					alert("更新成功！");
					window.location.reload();
				});
			}
		}
		//删除数据
		function deleteData(id) {
			if(confirm('确实要删除吗?')) {
				$.post("<%=basePath%>frmCertificate/delete.action",{"id":id},function(data){
					alert("删除成功！");
					window.location.reload();
				});
			}
		}
	</script>
</body>
</html>