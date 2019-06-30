<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="whit" uri="http://whit.cn/common/" %>
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
        #page-wrapper {
            margin-left: 0px;
        }

        .page-header {
            margin-top: 10px;
        }

        td {
            text-align: center;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header" style="font-size:17px">批量操作</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="panel panel-default">
        <div class="panel-body">
            <form class="form-inline" action="<%=basePath%>frmCertificate/getExcelTemplate.action" method="get">
                <div>
                    <div class="form-group" style="margin-left: 15px;margin-bottom: 10px">
                        <label for="teachersList">签名老师</label>
                        <select class="form-control" id="teachersList" name="signTeacher">
                            <option value="">--请选择--</option>
                            <c:forEach items="${teachersList}" var="item">
                                <option value="${item.dict_id}"
                                        <c:if test="${item.dict_id == signTeacher}"> selected</c:if>>
                                        ${item.dict_item_name}-${item.dict_id }
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group" style="margin-left: 15px;margin-bottom: 10px">
                        <label for="frmName">学员姓名</label>
                        <input type="text"
                               class="form-control"
                               id="frmName"
                               name="phone">
                    </div>
                    <div class="form-group" style="margin-left: 15px;margin-bottom: 10px">
                        <label for="frmTitle">证书编号</label>
                        <input type="text"
                               class="form-control"
                               id="frmNumber"
                               name="title">
                    </div>
                    <div class="form-group" style="margin-left: 15px;margin-bottom: 10px">
                        <label for="frmName">课程名称</label>
                        <input type="text"
                               class="form-control"
                               id="frmTitle"
                               name="number">
                    </div>
                    <div class="form-group" style="margin-left: 15px;margin-bottom: 10px">
                        <label for="frmName">课程结束日期</label>
                        <input type="text"
                               class="form-control"
                               id="frmEndTime"
                               name="number">
                    </div>
                    <div class="form-group" style="margin-left: 15px;margin-bottom: 10px">
                        <label for="frmName">手机号码</label>
                        <input type="text"
                               class="form-control"
                               id="frmPhone"
                               name="number">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary" style="margin-left: 15px;width:80px;margin-bottom: 10px">
                    下载模板
                </button>
                <button data-toggle="modal" data-target="#editDialog" onclick="editData('new');return false;"
                        class="btn btn-primary" style="width:80px;margin-bottom: 10px">
                    导入模板
                </button>
            </form>
            <!-- <button data-toggle="modal" data-target="#editDialog" onclick="editData('new')"  class="btn btn-primary" style="float: right;margin-top:-33px">新  增</button> -->
        </div>
    </div>
    <div class="row" style="display: none">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading" style="display: none">客户信息列表</div>
                <!-- /.panel-heading -->
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <!-- <th>ID</th> -->
                        <th>签名教师</th>
                        <th>学员姓名</th>
                        <!-- <th>证书类型</th> -->
                        <th>证书编号</th>
                        <th>课程名称</th>
                        <th>课程结束日期</th>
                        <th>手机号码</th>
                        <!-- <th>是否已查询</th> -->
                        <th>查询次数</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.rows}" var="row">
                        <tr>
                                <%-- <td>${row.id}</td> --%>
                            <td>${row.signTeacher}</td>
                            <td>${row.name}</td>
                                <%-- <td>${row.type}</td> --%>
                            <td>${row.number}</td>
                            <td>${row.title}</td>
                            <td><fmt:formatDate value="${row.endTime}" pattern="yyyy-MM-dd"/></td>
                            <td>${row.phone}</td>
                                <%-- <td>
                                    <c:if test="${row.isquery == '10001'}"> 已查询</c:if>
                                    <c:if test="${row.isquery == '10002'}"> 未查询</c:if>
                                </td> --%>
                            <td>${row.queryTimes}</td>
                            <td style="text-align: center;">
                                <a href="#"
                                   class="btn btn-primary btn-xs"
                                   data-toggle="modal" data-target="#editDialog"
                                   onclick="editData(${row.id})">修改</a>
                                <a href="#"
                                   class="btn btn-danger btn-xs"
                                   onclick="deleteData(${row.id})">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="col-md-12 text-right">
                    <whit:page url="${pageContext.request.contextPath }/frmCertificate/frm"/>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
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

</script>
</body>
</html>