<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户完善个人信息</title>
<jsp:include page="../include/headtag.jsp" />
<!-- CSS -->
<!-- <link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500"> -->

<link rel="stylesheet"
	href="assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/form-elements.css">
<link rel="stylesheet" href="assets/css/style.css">
<style>
input:-webkit-autofill {
	-webkit-box-shadow: 0 0 0px 1000px white inset;
	border: 1px solid #CCC !important;
}
</style>
</head>

<body>

	<jsp:include page="../include/head.jsp" />
	<jsp:include page="../include/menu.jsp" />
	<div class="inner-bg">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3 form-box">
					<div class="form-top">
						<div class="form-top-left">
							<h3 style="color: #969696;">用户完善信息</h3>
							<p>完善个人信息</p>
						</div>
						<div class="pull-right-bottom">
							<p class="text-danger"
								style="position: absolute; right: 60px; bottom: 500px"
								id="errorTip">${error}</p>
						</div>

					</div>
					<div class="form-bottom">
						<form role="form" action="${mybasePath }addUserInfoPost.do" method="post"
							class="login-form">
							<div class="form-group col-xs-12">
								<label class="sr-only" for="userName">userName</label>姓名(*):<input
									style="font-weight: bold" type="text" name="userName"
									id="userName" class="form-username form-control" required />
							</div>
							<div class="form-group col-xs-12">
								<label class="sr-only" for="userIdenf">身份证号</label>身份证号(*):<input
									type="text" name="userIdenf" class="form-username form-control"
									id="userIdenf" required style="font-weight: bold"
									onkeyup="isCheckIdenf()" /><span id="idenfTip"></span>
							</div>

							<div class="form-group col-xs-12">
								<label class="sr-only" for="userMobile">userMobile</label>手机号(*):<input
									style="font-weight: bold" type="text" name="userMobile"
									id="userMobile" class="form-control input-control clearfix"
									required onkeyup="isCheckMobile()" /><span id="mobileTip"></span>
							</div>
							<div class="form-group col-xs-12">
								性别(*): <select class="form-control input-control "
									name="userSex">
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
							</div>

							<div class="form-group col-xs-12">
								<button type="submit" class="btn" id="btn">完善信息</button>
							</div>
						</form>
						<span><a href="../user/findPassword.jsp">找回密码</a></span> <span><a
							href="../user/login.jsp" class="pull-right">用户登录</a></span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Javascript -->
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>
	<script src="assets/js/scripts.js"></script>
	<!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

	<script type="text/javascript">
		function isCheckIdenf() {
			var idenf = document.getElementById("userIdenf").value;
			document.getElementById("errorTip").innerHTML = "";
			if (idenf != "") {
				var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
				isok = reg.test(idenf);
				if (isok) {
					document.getElementById("idenfTip").innerHTML = "<font color='#969696'>身份证格式正确</font>";
					document.getElementById("btn").disabled = false;
				} else {
					document.getElementById("btn").disabled = true;
					document.getElementById("idenfTip").innerHTML = "身份证格式不正确";
				}
			} else {
				document.getElementById("idenfTip").innerHTML = "";
			}
		}
	</script>


	<script type="text/javascript">
		function isCheckMobile() {
			var mobile = document.getElementById("userMobile").value;
			document.getElementById("errorTip").innerHTML = "";
			if (mobile != "") {
				var reg = /^1[0-9]{10}$/;
				isok = reg.test(mobile);
				if (isok) {
					document.getElementById("mobileTip").innerHTML = "<font color='#969696'>手机号码格式正确</font>";
					document.getElementById("btn").disabled = false;
				} else {
					document.getElementById("btn").disabled = true;
					document.getElementById("mobileTip").innerHTML = "手机号码格式不正确";
				}
			} else {
				document.getElementById("mobileTip").innerHTML = "";
			}
		}
	</script>

</body>

</html>