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
    <title>类型模板管理</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="<%=basePath%>plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="<%=basePath%>plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/style.css">
	<script src="<%=basePath%>plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="<%=basePath%>plugins/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>plugins/select2/select2.css" />
    <link rel="stylesheet" href="<%=basePath%>plugins/select2/select2-bootstrap.css" />
    <script src="<%=basePath%>plugins/select2/select2.min.js" type="text/javascript"></script>
    
    <script type="text/javascript" src="<%=basePath%>plugins/angularjs/angular.min.js"></script>
	


	
	
	<!-- 分页组件开始 -->
	<script src="<%=basePath%>plugins/angularjs/pagination.js"></script>
	
	<link rel="stylesheet" href="<%=basePath%>plugins/angularjs/pagination.css">
	<!-- 分页组件结束 -->
	
	<script type="text/javascript" src="<%=basePath%>js/base_pagination.js"></script>
	
	<script type="text/javascript" src="<%=basePath%>js/angular-select2.js"> </script>
		
	<script type="text/javascript" src="<%=basePath%>js/service/typeTemplateService.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/service/brandService.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/service/specificationService.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/controller/baseController.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/controller/typeTemplateController.js"></script>

</head>

<body class="hold-transition skin-red sidebar-mini" ng-app="pinyougou" ng-controller="typeTemplateController" ng-init="findBrandList();findSpecList()">
  <!-- .box-body -->
                
                    <div class="box-header with-border">
                        <h3 class="box-title">商品类型模板管理</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default" title="新建" data-toggle="modal" data-target="#editModal" ng-click="entity={customAttributeItems:[]}"><i class="fa fa-file-o"></i> 新建</button>
                                        <button type="button" class="btn btn-default" title="删除" ng-click="dele()"><i class="fa fa-trash-o"></i> 删除</button>
                                       
                                        <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="has-feedback">
							                  分类模板名称：<input  >									
									<button class="btn btn-default">查询</button>                                    
                                </div>
                            </div>
                            <!--工具栏/-->

			                  <!--数据列表-->
			                  <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
			                      <thead>
			                          <tr>
			                              <th class="" style="padding-right:0px">
			                                  <input id="selall" type="checkbox" class="icheckbox_square-blue">
			                              </th> 
										  <th class="sorting_asc">模板ID</th>
									      <th class="sorting">分类模板名称</th>
									      <th class="sorting">关联品牌</th>
									      <th class="sorting">关联规格</th>									     
									      <th class="sorting">扩展属性</th>													     						
					                      <th class="text-center">操作</th>
			                          </tr>
			                      </thead>
			                      <tbody>
			                          <tr ng-repeat="entity in list">
			                              <td><input  type="checkbox" ng-click="updateSelection($event, entity.id)" ></td>			                              
				                          <td>{{entity.id}}</td>
									      <td>{{entity.name}}</td>
									      <td>{{jsonToString(entity.brandIds,'text')}}</td>
									      <td>{{jsonToString(entity.specIds,'text')}}</td>									 
									      <td>{{jsonToString(entity.customAttributeItems,'text')}}</td>		                                                                  
		                                  <td class="text-center">                                           
		                                 	  <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#editModal" ng-click="findOne(entity.id)">修改</button>                                           
		                                  </td>
			                          </tr>
									  
			                      </tbody>
			                  </table>
			                  <!--数据列表/-->                        
							   <tm-pagination conf="paginationConf"></tm-pagination>  
							 
                        </div>
                        <!-- 数据表格 /-->
                     </div>
                    <!-- /.box-body -->
<!-- 编辑窗口 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">商品类型模板编辑</h3>
		</div>
		<div class="modal-body">							
			
			<table class="table table-bordered table-striped"  width="800px">
		      	<tr>
		      		<td>商品类型</td>
		      		<td><input  class="form-control" placeholder="商品类型" ng-model="entity.name">  </td>
		      	</tr>			   
		      	<tr>
		      		<td>关联品牌</td>
		      		<td>
		      			<input select2 select2-model="entity.brandIds"  config="brandList" multiple placeholder=" 选择品牌（可多选） " class="form-control">
		      		</td>
		      	</tr>
		      	<tr>
		      		<td>关联规格</td>
		      		<td>
						<input select2 select2-model="entity.specIds"  config="specList" multiple placeholder=" 选择规格（可多选） " class="form-control">
		      		</td>
		      	</tr>	
		      	
		      	<tr>
		      		<td>扩展属性</td>
		      		<td>
		      			<div class="btn-group">
                             <button type="button" class="btn btn-default" title="新增扩展属性" ng-click="addTableRow()"><i class="fa fa-file-o"></i> 新增扩展属性</button>
                                                                    
                        </div>
						<table class="table table-bordered table-striped"  width="800px">
							<thead>
								<tr>
								    <td><input type="checkbox" class="icheckbox_square-blue"></td>
									<td>属性名称</td>									
									<td>操作</td>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="pojo in entity.customAttributeItems">
									<td><input type="checkbox" class="icheckbox_square-blue" ></td>
									<td><input class="form-control" placeholder="属性名称" ng-model="pojo.text"></td>
									<td><button type="button" class="btn btn-default" title="删除" ng-click="deleTableRow($index)"><i class="fa fa-trash-o"></i> 删除</button></td>
								</tr>
								
							</tbody>
						</table>	
           
		      		</td>
		      	</tr>	
		      	      
			 </table>				
			
		</div>
		<div class="modal-footer">						
			<button class="btn btn-success" data-dismiss="modal" aria-hidden="true" ng-click="save()">保存</button>
			<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
		</div>
	  </div>
	</div>
</div>
    
</body>
</html>