<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE HTML>
<html>
<head>
<title>SAFE FOOD</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>
	<body class="is-preload">
		<!-- Wrapper -->
		<div id="wrapper">
		
		<jsp:include page="../common/nav.jsp"/>
		
			<!-- Main -->
			<div id="main">
				<div class="inner">
					<h1>회원가입</h1>
					<span class="image main"><img src="images/pic13.jpg" alt="" /></span>	
				</div>	
			</div>
			<br/>
			<div id="mainPage">
				<div class="inner">
					<section>
						<form id="signup-form" method="post" action="join.do">
							<input type="text" name="u_Id" id="_u_Id" placeholder="Id"/>
							<br/>
							<input type="password" name="u_Password" id="_u_Password" placeholder="Password"/>
							<br/>
							<input type="text" name="u_Name" id="_u_Name" placeholder="Name"/>
							<br/>
							<input type="text" name="u_Address" id="_u_Address" placeholder="Address"/>
							<br/>
							<input type="tel" name="u_Tel" id="_u_Tel" placeholder="Tel"/>
							<br/>
							<span>알레르기 정보</span>
								<div class="row gtr-uniform">
								<br/>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="soybean" name="u_Allergy" value="대두" checked>
									<label for="soybean">대두</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="peanut" name="u_Allergy" value="땅콩">
									<label for="peanut">땅콩</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="milk" name="u_Allergy" value="우유">
									<label for="milk">우유</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="crab" name="u_Allergy" value="게">
									<label for="crab">게</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="shrimp" name="u_Allergy" value="새우">
									<label for="shrimp">새우</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="tuna" name="u_Allergy" value="참치">
									<label for="tuna">참치</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="salmon" name="u_Allergy" value="연어">
									<label for="salmon">연어</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="mugwort" name="u_Allergy" value="쑥">
									<label for="mugwort">쑥</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="beef" name="u_Allergy" value="소고기">
									<label for="beef">소고기</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="chicken" name="u_Allergy" value="닭고기">
									<label for="chicken">닭고기</label>
								</div>
								<div class="col-4 col-12-small">
									<input type="checkbox" id="pork" name="u_Allergy" value="돼지고기">
									<label for="pork">돼지고기</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="peach" name="u_Allergy" value="복숭아">
									<label for="peach">복숭아</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="dandelion" name="u_Allergy" value="민들레">
									<label for="dandelion">민들레</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="egg" name="u_Allergy" value="계란">
									<label for="egg">계란</label>
								</div>
							</div>
							<br/>
							<input type="submit" class="locateCenter" value="SIGN UP" />
						</form>
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