<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.Homework" %>
<%@ page import="com.chengxusheji.po.Course" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //获取所有的courseObj信息
    List<Course> courseList = (List<Course>)request.getAttribute("courseList");
    Homework homework = (Homework)request.getAttribute("homework");

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
  <TITLE>查看家庭作业详情</TITLE>
  <link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/animate.css" rel="stylesheet"> 
</head>
<body style="margin-top:70px;"> 
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
	<ul class="breadcrumb">
  		<li><a href="<%=basePath %>index.jsp">首页</a></li>
  		<li><a href="<%=basePath %>Homework/frontlist">家庭作业信息</a></li>
  		<li class="active">详情查看</li>
	</ul>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">作业id:</div>
		<div class="col-md-10 col-xs-6"><%=homework.getHomeworkId()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">作业课程:</div>
		<div class="col-md-10 col-xs-6"><%=homework.getCourseObj().getCourseName() %></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">作业任务:</div>
		<div class="col-md-10 col-xs-6"><%=homework.getTaskTitle()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">作业要求:</div>
		<div class="col-md-10 col-xs-6"><%=homework.getTaskContent()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">作业文件:</div>
		<div class="col-md-10 col-xs-6"><a href="<%=basePath%><%=homework.getTaskFile()%>" target="_blank"><%=homework.getTaskFile()%></a></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">作业日期:</div>
		<div class="col-md-10 col-xs-6"><%=homework.getHomeworkDate()%></div>
	</div>
	<div class="row bottom15">
		<div class="col-md-2 col-xs-4"></div>
		<div class="col-md-6 col-xs-6">
			<button onclick="history.back();" class="btn btn-primary">返回</button>
		</div>
	</div>
</div> 
<jsp:include page="../footer.jsp"></jsp:include>
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script>
var basePath = "<%=basePath%>";
$(function(){
        /*小屏幕导航点击关闭菜单*/
        $('.navbar-collapse a').click(function(){
            $('.navbar-collapse').collapse('hide');
        });
        new WOW().init();
 })
 </script> 
</body>
</html>

