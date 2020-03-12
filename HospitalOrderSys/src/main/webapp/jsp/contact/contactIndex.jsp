<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>联系我们</title>
<!-- CSS -->
<jsp:include page="../include/headtag.jsp" />
<!-- <link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500"> -->
<link rel="stylesheet"
	href="${mybasePath}assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${mybasePath}assets/css/form-elements.css">
<link rel="stylesheet" href="${mybasePath}assets/css/style.css">
</head>
<body>
	<jsp:include page="../include/head.jsp" />
	<jsp:include page="../include/menu.jsp" />
	<div id="page-wrapper" style="margin-top: 50px;">
		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<h3 class="text-left">联系我们</h3>
				</div>
			</div>
			<hr />
			<ul class="nav nav-tabs">
				<li class="active"><a href="#contact" data-toggle="tab">联系我们</a></li>
				<li><a href="#partener" data-toggle="tab">合作伙伴</a></li>
				<li><a href="#statement" data-toggle="tab">法律声明</a></li>
				<li><a href="#service" data-toggle="tab">服务协议</a></li>

			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade active in text-left" id="contact">
					<div class="col-md-12 ">
						<div class="col-md-2">
							<p class="text-left">联系我们</p>
						</div>
					</div>
					<br /> <br />
					<hr width="1300px">
					<p style="margin-left: 20px;">
						<span class="glyphicon glyphicon-phone-alt"></span>&nbsp;电话预约挂号服务热线：xxx
					</p>
					<p style="margin-left: 20px;">
						<span class="glyphicon glyphicon-globe"></span> &nbsp;网上预约挂号：<a
							href="http://www.baidu.com" target="_blank">null</a>
					</p>

				</div>
				<div class="tab-pane fade text-left" id="partener">
					<div class="col-md-12 ">
						<div class="col-md-2">
							<p class="text-left">合作伙伴</p>
						</div>
					</div>
					<br /> <br />
					<hr width="1300px">
					<p style="margin-left: 20px;">期末项目组</p>
				</div>
				<div class="tab-pane fade text-left" id="statement">
					<div class="col-md-12 ">
						<div class="col-md-2">
							<p class="text-left">法律声明</p>
						</div>
					</div>
					<br /> <br />
					<hr width="1300px">

			</div>
			<div class="tab-pane fade text-left" id="service">
				<div class="col-md-12 ">
					<div class="col-md-2">
						<p class="text-left">服务协议</p>
					</div>
				</div>
				<br /> <br />
				<hr width="1300px">

			</div>

		</div>
	</div>

	<!-- /. PAGE INNER  -->
	</div>
	<!-- /. PAGE WRAPPER  -->

</body>
<!-- Javascript -->
<script src="${mybasePath}assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${mybasePath}assets/bootstrap/js/jquery.min.js"></script>
<script src="${mybasePath}assets/js/jquery.backstretch.min.js"></script>
<script type="text/javascript">
	$("#idl dt").click(function() {
		var me = $(this);
		me.nextUntil("dt").toggle();
	});
</script>
</html>