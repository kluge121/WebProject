<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE HTML>
<html>
<head>
<title>SAFE FOOD</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#_showMember').click(function(event) {
			$("#_showMemberForm").submit();
		});
	});
</script>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<jsp:include page="../common/nav.jsp" />
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<h1>MANAGER PAGE</h1>
				<h2>관리자 페이지입니다</h2>
			</div>
		</div>
		<br />
		<div id="mainPage">
			<div class="inner">
				<section>
					<form action="<%=request.getContextPath()%>/showmember.do" method="post" name="showMemberForm" id="_showMemberForm">
						<input type="hidden" name="action" value="SHOWMEMBER">
						<div class="row gtr-uniform align-center">
							<div class="col-5">
								<select name="type" id="memberSearch">
									<option value="1">ID</option>
									<option value="2">이름</option>
									<option value="3">전화번호</option>
									<option value="4">주소</option>
									<option value="5">알레르기</option>
								</select>
							</div>
							<div class="col-5">
								<input type="text" name="keyword" id="memberSearchRes"
									placeholder="검색단어">
							</div>
							<div class="col-2">
								<a class="button primary" id="_showMember">회원정보 조회</a>
							</div>
						</div>
					</form>
					<br />
					<div class="table-wrapper" id="_members">
						<table class="alt">
							<thead class="align-center">
								<tr>
									<th>ID</th>
									<th>NAME</th>
									<th>TEL</th>
									<th>ADDRESS</th>
									<th>ALLERGY</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${members}" var="memberinfo" varStatus="vs">
 									<tr>
										<td>${memberinfo.userInfoDto.id}</td>
										<td>${memberinfo.userInfoDto.name}</td>
										<td>${memberinfo.userInfoDto.tel}</td>
										<td>${memberinfo.userInfoDto.address}</td>
										<td>
											<c:forEach items="${members}" var="memberallergy" varStatus="vs1">
												<c:if test="${memberallergy.userAllergyDto.id == memberinfo.userInfoDto.id}">
													<c:forEach items="${memberallergy.userAllergyDto.u_Allergy}" var="allergy" varStatus="vs1">
														<span>${allergy.allergy_info} </span> 
													</c:forEach>						
													
												</c:if>
											</c:forEach>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</section>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>