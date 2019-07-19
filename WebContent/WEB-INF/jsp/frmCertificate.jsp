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
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>后台管理系统</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
  

    <link rel="stylesheet" href="<%=basePath%>plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="<%=basePath%>plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/style.css">
    
    <style>
    	.skin-green .main-header .navbar {
		    background-color: #222d32
		}
		.skin-green .main-header .logo {
		    background-color: #222d32!important;
		    color: #fff;
		    border-bottom: 0 solid transparent;
		}
		.skin-green .sidebar-menu>li:hover>a, .skin-green .sidebar-menu>li.active>a {
		    color: #fff;
		    background: #1e282c;
		    border-left-color: #fff
		}
		.skin-green .main-header .navbar .sidebar-toggle:hover {
		    background-color: #337ab7;
		}
		.skin-green .main-header li.user-header {
		    background-color: #337ab7;
		}
    </style>
    
    <script src="<%=basePath%>plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="<%=basePath%>plugins/jQueryUI/jquery-ui.min.js"></script>
    <script src="<%=basePath%>plugins/bootstrap/js/bootstrap.min.js"></script>
  
    <script src="<%=basePath%>plugins/adminLTE/js/app.min.js"></script>
    
    <script type="text/javascript">   
		 function SetIFrameHeight(){
		  	  var iframeid=document.getElementById("iframe"); //iframe id
		  	  if (document.getElementById){
		  		iframeid.height =document.documentElement.clientHeight;			   	   
			  }
		 }
    
	</script>    
	
	
	<%-- <script type="text/javascript" src="<%=basePath%>plugins/angularjs/angular.min.js"></script>

	<script type="text/javascript" src="<%=basePath%>js/base.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/service/loginService.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/controller/indexController.js"></script> --%>
 
</head>

<body class="hold-transition skin-green sidebar-mini" ng-app="pinyougou" ng-controller="indexController" ng-init="showLoginName()">
	<%
			if(session.getAttribute("loginUser") == null){
				response.sendRedirect("/whit-bg");
			}
	%>
    <div class="wrapper">

        <!-- 页面头部 -->
        <header class="main-header">
            <!-- Logo -->
            <a href="index.html" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"><b>FRM</b></span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>医健学府</b></span>
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>

                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <!-- Messages: style can be found in dropdown.less-->
                        <li class="dropdown messages-menu" style="display: none;">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-envelope-o"></i>
                                <span class="label label-success">4</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">你有4个邮件</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li>
                                            <!-- start message -->
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="<%=basePath%>img/user2-160x160.jpg" class="img-circle" alt="User Image">
                                                </div>
                                                <h4>
                                                    系统消息
                                                    <small><i class="fa fa-clock-o"></i> 5 分钟前</small>
                                                </h4>
                                                <p>欢迎登录系统?</p>
                                            </a>
                                        </li>
                                        <!-- end message -->
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="<%=basePath%>img/user3-128x128.jpg" class="img-circle" alt="User Image">
                                                </div>
                                                <h4>
                                                    团队消息
                                                    <small><i class="fa fa-clock-o"></i> 2 小时前</small>
                                                </h4>
                                                <p>你有新的任务了</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="<%=basePath%>img/user4-128x128.jpg" class="img-circle" alt="User Image">
                                                </div>
                                                <h4>
                                                    Developers
                                                    <small><i class="fa fa-clock-o"></i> Today</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="<%=basePath%>img/user3-128x128.jpg" class="img-circle" alt="User Image">
                                                </div>
                                                <h4>
                                                    Sales Department
                                                    <small><i class="fa fa-clock-o"></i> Yesterday</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="<%=basePath%>img/user4-128x128.jpg" class="img-circle" alt="User Image">
                                                </div>
                                                <h4>
                                                    Reviewers
                                                    <small><i class="fa fa-clock-o"></i> 2 days</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><a href="#">See All Messages</a></li>
                            </ul>
                        </li>
                        <!-- Notifications: style can be found in dropdown.less -->
                        <li class="dropdown notifications-menu" style="display: none;">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-bell-o"></i>
                                <span class="label label-warning">10</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">你有10个新消息</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-users text-aqua"></i> 5 new members joined today
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the page and may cause design problems
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-users text-red"></i> 5 new members joined
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-user text-red"></i> You changed your username
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><a href="#">View all</a></li>
                            </ul>
                        </li>
                        <!-- Tasks: style can be found in dropdown.less -->
                        <li class="dropdown tasks-menu" style="display: none;">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-flag-o"></i>
                                <span class="label label-danger">9</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">你有9个新任务</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li>
                                            <!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Design some buttons
                                                    <small class="pull-right">20%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">20% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <!-- end task item -->
                                        <li>
                                            <!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Create a nice theme
                                                    <small class="pull-right">40%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">40% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <!-- end task item -->
                                        <li>
                                            <!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Some task I need to do
                                                    <small class="pull-right">60%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">60% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <!-- end task item -->
                                        <li>
                                            <!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Make beautiful transitions
                                                    <small class="pull-right">80%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">80% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <!-- end task item -->
                                    </ul>
                                </li>
                                <li class="footer">
                                    <a href="#">View all tasks</a>
                                </li>
                            </ul>
                        </li>
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="<%=basePath%>img/user2-160x160.jpg" class="user-image" alt="User Image">
                                <!-- <span class="hidden-xs">{{loginName}}</span> -->
                                <span class="hidden-xs">管理员</span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header">
                                    <img src="<%=basePath%>img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                    <p>
                                      <!-- {{loginName}} -->
                                      管理员
                                        <small>最后登录 11:20AM</small>
                                    </p>
                                </li>
                                
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="#" class="btn btn-default btn-flat">修改密码</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="/frmCertificate/list" class="btn btn-default btn-flat">退出</a>
                                    </div>
                                </li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </nav>
        </header>
        <!-- 页面头部 /-->

        <!-- 导航侧栏 -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="<%=basePath%>img/user2-160x160.jpg" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <!-- <p> {{loginName}}</p> -->
                        <p>管理员</p>
                        <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                    </div>
                </div>
              
                <!-- /.search form -->


                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu"  >
                    <li class="header">菜单</li>
                    <%-- <li id="admin-index"><a target="iframe" href="<%=basePath%>frmCertificate/home"><i class="fa fa-dashboard"></i> <span>首页</span></a></li> --%>
					<li id="admin-index"><a target="iframe" href="<%=basePath%>frmCertificate/frm"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>
					
				    <!-- 菜单 -->
				    <li class="treeview active">
				        <a href="#">
				            <i class="fa fa-folder"></i> 
				            <span>学府管理</span>
				            <span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
				        </a>
				        <ul class="treeview-menu">
				        	 <li id="admin-login">
				                <a href="<%=basePath%>frmCertificate/frm" target="iframe">
				                    <i class="fa fa-circle-o"></i>证书管理
				                </a>
				            </li>
				            <li style="display: block;" id="admin-login">
				                <%-- <a href="<%=basePath%>frmCertificate/seller_1" target="iframe"> --%>
				                <a href="<%=basePath%>sign/list" target="iframe">
				                    <i class="fa fa-circle-o"></i>签名管理
				                </a>
				            </li>
                            <li style="display: block;" id="admin-login">
                                <%-- <a href="<%=basePath%>frmCertificate/seller_1" target="iframe"> --%>
                                <a href="<%=basePath%>frmCertificate/batchAction" target="iframe">
                                    <i class="fa fa-circle-o"></i>批量操作
                                </a>
                            </li>
							<li style="display: none;" id="admin-login">
				                <a href="<%=basePath%>frmCertificate/seller" target="iframe">
				                    <i class="fa fa-circle-o"></i>商家管理
				                </a>
				            </li>
				        </ul>                        
				    </li>
					<li class="treeview" style="display: none;">
				        <a href="#">
				            <i class="fa fa-folder"></i> 
				            <span>商品管理</span>
				            <span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
				        </a>
				        <ul class="treeview-menu">
				
				            <li id="admin-login">
				                <a href="<%=basePath%>frmCertificate/brand" target="iframe">
				                    <i class="fa fa-circle-o"></i>品牌管理
				                </a>
				            </li>
							<li id="admin-login">
				                <a href="<%=basePath%>frmCertificate/specification" target="iframe">
				                    <i class="fa fa-circle-o"></i>规格管理
				                </a>
				            </li>							
							<li id="admin-login">
				                <a href="<%=basePath%>frmCertificate/type_template" target="iframe">
				                    <i class="fa fa-circle-o"></i>模板管理
				                </a>
				            </li>
							<li id="admin-login">
				                <a href="<%=basePath%>frmCertificate/item_cat" target="iframe">
				                    <i class="fa fa-circle-o"></i>分类管理
				                </a>
				            </li>
							<li id="admin-login">
				                <a href="<%=basePath%>frmCertificate/goods" target="iframe">
				                    <i class="fa fa-circle-o"></i>商品审核
				                </a>
				            </li>
				        </ul>                        
				    </li>
					
					<li class="treeview" style="display: none;">
				        <a href="#">
				            <i class="fa fa-folder"></i> 
				            <span>广告管理</span>
				            <span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
				        </a>
				        <ul class="treeview-menu">
				
				            <li id="admin-login">
				                <a href="<%=basePath%>frmCertificate/content_category" target="iframe">
				                    <i class="fa fa-circle-o"></i>广告类型管理
				                </a>
				            </li>
							<li id="admin-login">
				                <a href="<%=basePath%>frmCertificate/content" target="iframe">
				                    <i class="fa fa-circle-o"></i>广告管理
				                </a>
				            </li>
				        </ul>                        
				    </li>
				    <!-- 菜单 /-->

                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>
        <!-- 导航侧栏 /-->

        <!-- 内容区域 -->
        <div class="content-wrapper">
			<iframe width="100%" id="iframe" name="iframe"	onload="SetIFrameHeight()" 
					frameborder="0" src="<%=basePath%>frmCertificate/frm"></iframe>
 
        </div>
        <!-- 内容区域 /-->

        <!-- 底部导航 -->
        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 1.0.8
            </div>
            <strong>Copyright &copy; 2014-2019 <a href="http://www.whit.cn">医健学府技术部</a>.</strong> All rights reserved.
        </footer>
        <!-- 底部导航 /-->

    </div>

</body>
</html>