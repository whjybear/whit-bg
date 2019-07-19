<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet">


<link href="<%=basePath%>css/bootstrap-datetimepicker.min.css" rel="stylesheet">

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
			vertical-align: middle!important;
		}
    </style>

</head>
<body class="hold-transition skin-blue sidebar-mini">

	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header" style="font-size:17px">签名管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" action="${pageContext.request.contextPath }/frmCertificate/frm" method="post">
					<%-- <div class="form-group" style="margin-left: 15px;margin-bottom: 10px">
						<label for="frmName">学员姓名</label> <input type="text" class="form-control" id="frmName" value="${name }"
							name="name">
					</div>
					 
					<div class="form-group" style="display:none;margin-left: 15px;margin-bottom: 10px">
						<label for="isquery">证书状态</label>
						<select class="form-control" id="isquery" name="isquery">
							<option value="">--请选择--</option>
							<c:forEach items="${isQueryType}" var="item">
								<option value="${item.dict_id}"
									<c:if test="${item.dict_id == isquery}"> selected</c:if>>${item.dict_item_name }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group" style="margin-left: 15px;margin-bottom: 10px">
						<label for="frmName">手机号码</label> <input type="text"
							class="form-control" id="frmPhone" value="${phone }"
							name="phone">
					</div>
					<div class="form-group" style="margin-left: 15px;margin-bottom: 10px">
						<label for="frmTitle">课程名称</label> <input type="text" class="form-control" id="frmTitle" value="${title }"
							name="title">
					</div>
					<div class="form-group" style="margin-left: 15px;margin-bottom: 10px">
						<label for="frmName">证书编号</label> <input type="text"
							class="form-control" id="frmNumber" value="${number }"
							name="number">
					</div>
					<div class="form-group" style="margin-left: 15px;margin-bottom: 10px">
						<label for="teachersList">签名老师</label>
						<select class="form-control" id="teachersList" name="signTeacher">
							<option value="">--请选择--</option>
							<c:forEach items="${teachersList}" var="item">
								<option value="${item.dict_id}"
									<c:if test="${item.dict_id == signTeacher}"> selected</c:if>>${item.dict_item_name}-${item.dict_id }</option>
							</c:forEach>
						</select>
					</div> --%>
					<button type="submit" class="btn btn-primary" style="margin-left: 15px;width:80px;margin-bottom: 10px">查  询</button>
					<button data-toggle="modal" data-target="#editDialog" onclick="editData('new');return false;"  class="btn btn-primary" style="width:80px;margin-bottom: 10px">新  增</button>
					<button data-toggle="modal" data-target="#editDialog" onclick="refreshA();return false;"  class="btn btn-primary" style="width:80px;margin-bottom: 10px">刷 新</button>
					
				</form>
				<!-- <button data-toggle="modal" data-target="#editDialog" onclick="editData('new')"  class="btn btn-primary" style="float: right;margin-top:-33px">新  增</button> -->
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading" style="display: none">签名列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>签名教师姓名</th>
								<th>图片</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${teachersList}" var="row">
								<tr>
									<td>${row.dict_id}</td>
									<td>${row.dict_item_name}</td>
									<td>
										<img style="width: 100px;" data-toggle="modal" onclick="showBigImg('${row.dict_id}','${row.dict_item_name}','/pic/${row.pic}')"  data-target="#showDialog"   alt="" src="/pic/${row.pic}">
									</td>
									<td style="text-align: center;"><a style="width: 80px;" href="#" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#editDialog"
										onclick="editData(${row.dict_id})">修改</a> <a href="#"
										class="btn btn-danger btn-xs" style="display: none"
										onclick="deleteData(${row.dict_id})">删除</a></td>
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
	<div class="modal fade" id="showDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 800px">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel2">导师签名图片</h4>
				</div>
				<div class="modal-body">
					 <img alt="" style="width: 100%" src="">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
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
				<div class="modal-body" style="padding-bottom: 0px">
					<form action="${pageContext.request.contextPath }/sign/updata.action" class="form-horizontal" id="edit_data_form" style="text-align: center;" enctype="multipart/form-data" method="post">
						<input type="hidden" id="edit_id" name="baseDict.id"/>
						<div class="form-group">
							<label for="edit_title" class="col-sm-2 control-label">签名姓名</label>
							<div class="col-sm-10" style="margin-bottom: 15px;">
								<input type="text" value="${sessionScope.tempTitle }" class="form-control" id="edit_title" placeholder="签名姓名" name="signTeacher">
							</div>
							<label for="edit_title" class="col-sm-2 control-label">签名ID</label>
							<div class="col-sm-10" style="margin-bottom: 15px;">
								<input type="text" value="${sessionScope.tempTitle }" class="form-control" id="edit_ID" placeholder="签名姓名ID" name="dict_id">
							</div>
							<!-- <img alt="" style="margin: 5px;width:100px;height:100px;" src="file:///Users/bear/Downloads/jianhao.png"> --> 
							<!-- 570/350 -->
						</div>
						<div class="form-group" style="margin-bottom: 5px;">
							<label for="edit_title" class="col-sm-2 control-label">文件选择</label>
							<div class="col-sm-10" style="margin-bottom: 15px;">
								<input onchange="changeImg(this)" type="file" value="" name="pictureFile" class="form-control" id="edit_file" placeholder="签名文件" name="title">
							</div>
						</div>
						 
						 
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="closeBtn" class="btn btn-default" data-dismiss="modal">关闭</button>
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

	<script src="<%=basePath%>js/moment-with-locales.js"></script>
	<script src="<%=basePath%>js/bootstrap-datetimepicker.min.js"></script>
 	
	<%-- <script src="<%=basePath%>js/moment.min.js"></script> --%>
	
	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	 
		
	<script type="text/javascript">
		var formatDateTime = function(data, format) {
			if (data==undefined || data=="") {
				return "";
			} else {
				var m = moment(data);
				return m.isValid() ? m.format(format) : "";
			}
		};
		
		$(function () {
		    $('#datetimepicker1').datetimepicker({
		        format: 'YYYY-MM-DD',
		        locale: moment.locale('zh-cn')
		    });
		   	
		    
		    //$('#edit_endTime').val('2018-12-09');
		});
		
		//显示大图
		function showBigImg(id,name,pic){
			$("#showDialog h4").text(id + name );
			$("#showDialog img").prop("src",pic);
		}
		
		//显示图片
		function changeImg(it){
			//alert($(it).val());
			//alert($("#edit_data_form img").attr("src"));
			//$("#edit_data_form img").prop("src",$(it).val());
		}
		var isEdit = false;
		//打开编辑窗口
		function editData(id) {
			
			if(id == 'new'){
				//新增证书编号可输入
				$("#edit_ID").prop("readonly",false);
				//新增
				//新增窗口的标题
				//新增的时候只需要填写必要字段
				$("#myModalLabel").text("新增签名证书");
				$(".igroreInput").hide();
				$("#btnNewOrEdit").text("确定");
				$("#edit_title").val("");
				$("#edit_ID").val("");
				$("#edit_file").val("");
				
				//$("#edit_endTime").val("");
				//新增： 证书标题 和日 期需要记住上一次 todo
				//$("#edit_title").val("");
				
				//var date = new Date();
				//Y = date.getFullYear() + '-';
				//M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
				//D = date.getDate() + ' ';
				//默认是当前日 日 期需要记住上一次 todo
				//$("#edit_endTime").val(Y+M+D);
				 
			}else{
				$("#myModalLabel").text("修改信息");
				$(".igroreInput").show();
				$("#btnNewOrEdit").text("保存修改");
				//修改
				isEdit = true;
				//编辑
				$("#edit_ID").val(id);
				$("#edit_ID").prop("readonly",true);
				$.ajax({
					type:"get",
					url:"<%=basePath%>sign/edit.action",
					data:{"id":id},
					success:function(data) {  
						$("#edit_title").val(data.dict_item_name);
					}
				});
			}
			
		}
		//直接表单提交
		function updateData() {
			if(isEdit == true){
				//修改
				alert("e..");
				$("#closeBtn").click();
				return;
			}
			//新增
			//alert("直接表单提交");
			if($("#edit_ID").val() == ""){
				alert("签名ID不能为空");
				return;
			}
			if($("#edit_title").val() == ""){
				alert("签名老师姓名不能为空");
				return;
			}
			if($("#edit_file").val() == ""){
				alert("签名图片文件不能为空");
				return;
			}
			//检查签名老师姓名+id是否有重复
			var isDup = "";
			$.ajax({
					type:"get",
					async:false,  //同步请求
					url:"<%=basePath%>sign/checkNumber.action",
					data:{
						"edit_id":$("#edit_ID").val(),
						"edit_title":$("#edit_title").val()
					},
					success:function(data) {
						if(data == "nook"){
							alert("签名证书ID重复！请检查");
							isDup = data;
							return;
						}
					}
			})
			if(isDup == "nook"){
				return;
			}
			$("#edit_data_form").submit();
			//$("#editDialog").hide();
			$("#closeBtn").click();
			//刷新本页面
			
		}
		//更新数据 + 新建
		function updateData2() {
			alert("111");
			//new FormData
			if($("#edit_title").val() == ""){
				alert("课程名称不能为空");
				return;
			}
			if($("#edit_signTeacher").val() == ""){
				alert("签名老师不能为空");
				return;
			}
			if($("#edit_name").val() == ""){
				alert("姓名不能为空");
				return;
			}
			
			if($("#edit_number").val() == ""){
				alert("证书编号不能为空");
				return;
			}
			if($("#edit_endTime").val() == ""){
				alert("结业日期不能为空");
				return;
			}
			
			if($("#edit_id").val() == ""){
				alert("new..");
				//检查$("#edit_number").val() 证书编号不能重复
				<%-- var isDup = "";
				$.ajax({
						type:"get",
						async:false,  //同步请求
						url:"<%=basePath%>frmCertificate/checkNumber.action",
						data:{
							"number":$("#edit_number").val(),
						},
						success:function(data) {
							if(data == "nook"){
								alert("证书编号重复！请检查");
								isDup = data;
								return;
							}
						}
				})
				if(isDup == "nook"){
					return;
				} --%>
				//新建，只上传指定的字段
				$.ajax({
					type:"post",
					url:"<%=basePath%>sign/updata.action",
					data:{
						"name":$("#edit_name").val(),
						"number":$("#edit_number").val(),
						"phone":$("#edit_phone").val(),
						"title":$("#edit_title").val(),
						"endTime":$("#edit_endTime").val(),
						"signTeacher":$("#edit_signTeacher").val(),
					},
					success:function(data) {  
						alert("添加成功！");
						
						window.location.reload();
					}
				})
			}else{
				alert("222");
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
		
		
		function refreshA(){
			window.location = "http://localhost:8080/whit-bg/sign/list";
		}
	</script>
</body>
</html>