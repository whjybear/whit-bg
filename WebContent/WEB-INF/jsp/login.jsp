<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();

	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>管理后台</title>
<link rel="icon" href="<%=basePath%>assets/img/favicon.ico">


<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/webbase.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/pages-login-manage.css" />
</head>

<body>
	<div class="loginmanage">
		<div class="py-container">
			<h4 class="manage-title">医健学府证书查询管理后台</h4>
			<div class="loginform">

				<ul class="sui-nav nav-tabs tab-wraped">
					<li>
						<!-- <a href="#index" data-toggle="tab"> -->
						<a href="#" data-toggle="tab">
							<h3>扫码登录</h3>
						</a>
					</li>
					<li class="active"><a href="#profile" data-toggle="tab">
							<h3>账户登录</h3>
					</a></li>
				</ul>
				<div class="tab-content tab-wraped">
					<div id="index" class="tab-pane">
						<p>二维码登录，暂为官网二维码</p>
						<img src="../img/wx_cz.jpg" />
					</div>
					<div id="profile" class="tab-pane  active">
						<form class="sui-form" action="${pageContext.request.contextPath }/frmCertificate/checkLogin" method="post"
							id="loginform">
							<div class="input-prepend">
								<span class="add-on loginname"></span> <input
									id="prependedInput" name="username" type="text"
									placeholder="邮箱/用户名/手机号" class="span2 input-xfat">
							</div>
							<div class="input-prepend">
								<span class="add-on loginpwd"></span> <input id="prependedInput"
									name="password" type="password" placeholder="请输入密码"
									class="span2 input-xfat">
							</div>
							<div class="setting">
								<div id="slider" style="display: none">
									<div id="slider_bg"></div>
									<span id="label">>></span> <span id="labelTip">拖动滑块验证</span>
								</div>
							</div>
							<div class="logined">
								<a class="sui-btn btn-block btn-xlarge btn-danger"
									onclick="document:loginform.submit()" target="_blank">登&nbsp;&nbsp;录</a>
							</div>
						</form>

					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>


	<!--foot-->
	<div class="py-container copyright" style="">
		<ul>
			<li>关于我们</li>
			<li>联系我们</li>
			<li>联系客服</li>
			<li>社区</li>
			<li>地址</li>
			<li>社区</li>
		</ul>
	</div>


	<script type="text/javascript"
		src="<%=basePath%>js/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/sui/sui.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/jquery-placeholder/jquery.placeholder.min.js"></script>
	<script src="<%=basePath%>js/pages/jquery.slideunlock.js"></script>
	<script>
		$(function() {
			var slider = new SliderUnlock("#slider", {
				successLabelTip : "欢迎访问"
			}, function() {
				// alert("验证成功,即将跳转至首页");
				// window.location.href="index.html"
			});
			slider.init();
		})
	</script>
</body>
</html>