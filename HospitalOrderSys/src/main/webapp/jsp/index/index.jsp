<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>医院预约挂号</title>
<%
	/********** 保存网站的基本路径 ***********/
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//将该路径地址缓存到 session中 ,例如：http://localhost:8090/tjnu_ssh_1128/
	session.setAttribute("mybasePath", basePath);
%>
<!-- CSS -->
<jsp:include page="../include/headtag.jsp" />
<!-- <link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500"> -->
<link rel="stylesheet"
	href="assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/form-elements.css">
<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
	<jsp:include page="../include/head.jsp" />
	<jsp:include page="../include/menu.jsp" />
	<div id="page-wrapper" style="margin-top: 50px;">
		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<!-- <br />
					<br />
					<h2>预留页面标题</h2>
					<h5>预留内容小标题.</h5> -->
					<div id="tip" class="jumbotron text-left" style="padding-left: 45px;background-color: #ffffff">
						<div class="modal-header" style="padding-left: 45px;background-color: #ffffff">
							<button id="close" name = "close" type="button" class="close" data-dismiss="modal"
								aria-hidden="true">x×x</button>
						</div>
						<h2>	
							您好!
							</h1>
							<p>为提高患者预约效率,改善患者预约体验,建立该预约挂号统一平台.</p>
							<p>
								<a class="btn btn-primary btn-lg" href="${mybasePath}jsp/help/helpIndex.jsp" >了解挂号系统</a>
							</p>
					</div>
				</div>
			</div>
			<!-- /. ROW  -->
			<hr />
			<div class="carousel slide" id="carousel-630453">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-630453"></li>
					<li data-slide-to="1" data-target="#carousel-630453" class="active"></li>
					<li data-slide-to="2" data-target="#carousel-630453"></li>
				</ol>
				<div class="carousel-inner">
					<div class="item">
						<img alt="" src="${mybasePath}assets/img/1.jpg" />
						<div class="carousel-caption">
							<p>挂号系统已诞生 </p>
						</div>
					</div>
					<div class="item active">
						<img alt="" src="${mybasePath}assets/img/2.jpg" />
						<div class="carousel-caption">
							<p>多家医院查询功能</p>
							<p>支持多家医院信息查询，助您准确查询医院信息。</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="${mybasePath}assets/img/3.jpg" />
						<div class="carousel-caption">
							<p>医生信息</p>
							<p>大量医生信息，助您提前了解。</p>
						</div>
					</div>
				</div>
				<a class="left carousel-control" href="#carousel-630453"
					data-slide="prev"><span
					class="glyphicon glyphicon-chevron-left"></span></a> <a
					class="right carousel-control" href="#carousel-630453"
					data-slide="next"><span
					class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
		</div>
		<!-- /. PAGE INNER  -->

	</div>
	<!-- /. PAGE WRAPPER  -->

</body>
<!-- Javascript -->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/bootstrap/js/jquery.min.js"></script>
<script src="assets/js/jquery.backstretch.min.js"></script>
<!--不需要背景 <script src="assets/js/scripts.js"></script> -->
<!-- <script type="text/javascript">
	
    </script> -->
    <script type="text/javascript">
    jQuery(document).ready(function() {
    	
        $.backstretch("assets/img/backgrounds/1.jpg");
        
        });
    $("#close").click(function(){
    	 /*  $("#tip").remove();  */
    	  $("#tip").fadeTo("slow", 0.01, function(){//fade
    		    $(this).slideUp("slow", function() {//slide up
    		      $(this).remove();//then remove from the DOM
    		    });
    		  }); 
    });
    </script>
</html>