<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>科室信息</title>
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
					<h3 class="text-left">科室详情</h3>
				</div>
			</div>
			<hr />
			<div class="col-md-12">
				<ul class="nav nav-tabs">
				<c:if test='${hos.isOpen=="1" }'>
					<li class="active"><a href="#home" data-toggle="tab"
						aria-expanded="true">预约挂号</a></li>
					<li class=""><a href="#orderNotice" data-toggle="tab"
						aria-expanded="false">预约须知</a></li>
					</c:if>
					<c:if test='${hos.isOpen=="0" }'>
						<li class="active"><a href="#home" data-toggle="tab"
							aria-expanded="true">科室医生</a></li>
					</c:if>
					<li class=""><a href="#about" data-toggle="tab"
						aria-expanded="false">科室简介</a></li>
					<li class=""><a href="#equipment" data-toggle="tab"
						aria-expanded="false">科室设备</a></li>
					<li class=""><a href="#honor" data-toggle="tab"
						aria-expanded="false">科室荣誉</a></li>
					<li class=""><a href="#scope" data-toggle="tab"
						aria-expanded="false">诊疗范围</a></li>
				</ul>
				<div class="col-md-12">
					<div class="col-md-3">
						<a href="<c:url value='${mybasePath}hosInfoShow/${hos.id}.do' />"><p class="text-left">${hos.hospitalName }
						</p></a>
					</div>
					<div class="col-md-5">
						<p class="text-right">
							<font color="#eb6864">等级：</font>${hos.hospitalGrade }
						</p>
					</div>
					<div class="col-md-2">
						<p class="text-right">
							<font color="#eb6864">区域：</font>${hos.hospitalArea }
						</p>
					</div>
					<div class="col-md-2">
						<p class="text-right">
							<font color="#eb6864">类型：</font>${hos.hospitalNature }
						</p>
					</div>
				</div>
				<hr />
				<div class="col-md-12">
					<div class="col-md-3">
						<img alt="请检查网络，图片加载出现了一点小问题" src="${hos.hospitalImg }">
					</div>
					<div class="col-md-4">
						<p class="text-left">
							<font color="#eb6864">医院名称：</font>${hos.hospitalName }
						</p>
						<p class="text-left">
							<font color="#eb6864">科室名称：</font>${office.officesName  }
						</p>
						<p class="text-left">
							<font color="#eb6864">医生数量：</font>${office.doctorNum }
						</p>
						<p class="text-left">
							<font color="#eb6864">科室网址：<a href="${hos.hospitalUrl }"
								target="_blank">${hos.hospitalUrl }</a></font>
						</p>
					</div>
				</div>
				<hr />

				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade active in text-left" id="home">
						<div class="col-md-12">
							<div class="col-md-12">
								<p class="text-left"><font color="#eb6864">请选择预约医生</font></p>
								
							</div>
							<div style="border-bottom: 1px solid #ccc;"></div>
						</div>
						
						<table class="table table-striped table-hover ">
							<thead>
								<tr>
									<th>科室医生</th>
									<th>医生姓名</th>
									<th>医生性别</th>
									<th>医生职称</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="doc" items="${doctor }" varStatus="status">
									<tr>
										<td>${ status.index + 1}</td>
										<td><a href="<c:url value='${mybasePath}doctorInfoShow/${doc.id}.do' />">${doc.doctorName }</a></td>
										<td>${doc.doctorSex }</td>
										<td>${doc.doctorTitle }</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="tab-pane fade text-left" id="orderNotice">
						<div class="col-md-12 ">
							<div class="col-md-2">
								<!-- <p class="text-left"><font color="#eb6864">预约须知</font></p> -->
							</div>
							<div style="border-bottom: 1px solid #ccc;"></div>
								<br /><br />
						</div>
						
						<p>
							<br> <strong>电话预约挂号：022-022（24小时）<br>
							</strong><br> <br>
							根据卫生部8月5日通知和卫生局8月20日工作部署，医院名称已完成电话、网络预约挂号的流程建设，现将预约挂号、取号有关事项公布如下，请您认真阅读预约须知：<br>
							<br> <strong>一、预约时间范围：</strong><br>
							1、您可预约7天内（试点）日间的副教授、主治医师和住院医师等号源。节假日不安排预约号（含周六、周日）。<br>
							2、每天早8:30分开始放号;下午14:00停止次日预约挂号。<br> 3、周五14:00停挂至下周一。<br>
							<br> <strong>二、预约实名制：</strong><br>
							统一平台电话预约和网上预约挂号均采取实名制注册预约，请您如实提供就诊人员的真实姓名、有效证件号（身份证、军官证、护照）、性别、电话、手机号码、病案号或协和就诊卡条形码上的ID号等有效基本信息。<br>
							<br> <strong>三、预约取号：</strong><br>
							1、预约成功后，请患者于就诊当日携带有效证件、预约识别码及协和医院就诊卡到医院挂号窗口验证预约信息（核对与预约登记实名信息一致的本人有效证件和预约识别码）和取号，如验证不符则医院不能提供相应的诊疗服务。如果没有协和医院就诊卡者，请先办好就诊卡后再取号。<br>
							2、取号时间：上午就诊患者，就诊当日早9：00以前取号。下午就诊患者，就诊当日下午12:00-13:30之间取号。过时未取号者，预约作废。<br>
							3、取号地点：${hos.hospitalAddress }<br> <br> <strong>四、医生停诊：</strong><br>
							如遇特殊情况医生停诊，给您造成的不便敬请谅解。医生临时停诊，工作人员将会用电话方式及时通知您，请配合更改就诊日期或更换其他医生，请您保持电话畅通。<br>
							<br> <strong>五、取消预约：</strong><br>
							挂出的预约号如办理退号，至少在就诊前一工作日14:00前通过网站或者电话凭预约识别码进行取消。<br> <br>
							<strong>六、爽约处理：</strong><br> 1、如预约成功后患者未能按时就诊且不办理取消预约号视为爽约。<br>
							2、一年内（自然年）无故爽约累计达到3次的爽约用户将自动进入系统爽约名单，此后3个月内将取消其预约挂号资格；一年内（自然年）累计爽约6次，取消6个月的预约挂号资格。<br>
							<br> <strong>七、其它注意事项：</strong><br> 1、注意事项一。<br>
							2、注意事项二。<br> <br> <strong>交通指南：</strong><br> 乘车路线：
							${hos.hospitalBusRoute }<br> <br> <br> <br>
							${hos.hospitalName }<br>
						</p>
					</div>
					<div class="tab-pane fade text-left" id="about">
						<div class="col-md-12 ">
							<div style="border-bottom: 1px solid #ccc;"></div>
								<br /><br />
						</div>
						
						<p>&nbsp;&nbsp;${office.officesAbout }</p>
					</div>
					<div class="tab-pane fade text-left" id="equipment">
						<div class="col-md-12 ">
							<div style="border-bottom: 1px solid #ccc;"></div>
								<br /><br />
						</div>
						
						<p>&nbsp;&nbsp;${office.officesEquipment }</p>
					</div>
					<div class="tab-pane fade text-left" id="honor">
						<div class="col-md-12 ">
							<div style="border-bottom: 1px solid #ccc;"></div>
								<br /><br />
						</div>
						
						<p>&nbsp;&nbsp;${office.officesHonor }</p>
					</div>
					<div class="tab-pane fade text-left" id="scope">
						<div class="col-md-12 ">
							<div style="border-bottom: 1px solid #ccc;"></div>
								<br /><br />
						</div>
						
						<p>&nbsp;&nbsp;${office.officesDiagnosisScope }</p>
					</div>
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
</html>