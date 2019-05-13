<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8");  %>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
    <fmt:requestEncoding value="utf-8"/>

<!DOCTYPE HTML>
<html>
	<head>
		<title>SAFE FOOD</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$('.find_id_div').hide();
				$('.find_pw_div').hide();
			});
			
			function findId() {
				$('.find_id_div').show();
				$('.find_pw_div').hide();
			}
			
			function findPw() {
				$('.find_id_div').hide();
				$('.find_pw_div').show();
			}
		
		</script>
	</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">
				<jsp:include page="../common/nav.jsp"/>
					<!-- Main -->
					<div id="main">
						<div class="inner">
							<h1>LOGIN FAIL</h1>
							<h2>아이디 혹은 비밀번호가 다릅니다</h2>
							<span class="image main"><img src="images/pic13.jpg" alt="" /></span>						
						</div>		
					</div>
					<br/>
					<div id="mainPage">
						<div class="inner">
							<section>
								<div class="row gtr-uniform align-center">	
									<div class="col-6">
										<a href="#" onClick="findId();return false;" class="button primary" id="_findId">아이디 찾기</a>
									</div>
									<div class="col-6">
										<a href="#" onClick="findPw();return false;" class="button primary" id="_findPw">비밀번호 찾기</a>
									</div>
									<div class="find_id_div col-6">
										<form action="finduser.do" method="post">
											<input type="hidden" name="action" value="FIND"/>
											<h3>이름을 입력하세요</h3>
											<input type="text" name="u_Name" id="_u_Name"/>
											<br/>
											<h3>전화번호를 입력하세요</h3>
											<input type="tel" name="u_Tel" id="_u_Tel"/>
											<br/>
											<input type="submit" class="primary" value="FIND"/>
										</form>
									</div>
									<div class="find_id_div col-6">
										<br/>
									</div>
									<div class="find_pw_div col-6">
										<br/>
									</div>
									<div class="find_pw_div col-6">
										<form action="finduser.do" method="post">
											<input type="hidden" name="action" value="FIND"/>
											<h3>아이디를 입력하세요</h3>
											<input type="text" name="u_Id" id="_u_Id"/>
											<br/>
											<input type="submit" class="primary" value="FIND"/>
										</form>
									</div>
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