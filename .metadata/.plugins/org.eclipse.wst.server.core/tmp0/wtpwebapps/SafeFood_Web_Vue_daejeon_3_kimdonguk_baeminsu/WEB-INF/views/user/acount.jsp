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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript">
		$(function() {
			var arr = new Array();
			<c:forEach items="${allergy}" var="arr">
				arr.push("${arr.allergy_info}")
			</c:forEach>
			var i;
			for (i = 0; i < arr.length; i++) {
				if (arr[i] === "대두") {
					$("#soybean").prop("checked", true);
				} else if (arr[i] === "땅콩") {
					$("#peanut").prop("checked", true);
				} else if (arr[i] === "우유") {
					$("#milk").prop("checked", true);
				} else if (arr[i] === "게") {
					$("#crab").prop("checked", true);
				} else if (arr[i] === "새우") {
					$("#shrimp").prop("checked", true);
				} else if (arr[i] === "참치") {
					$("#tuna").prop("checked", true);
				} else if (arr[i] === "연어") {
					$("#salmon").prop("checked", true);
				} else if (arr[i] === "쑥") {
					$("#mugwort").prop("checked", true);
				} else if (arr[i] === "소고기") {
					$("#beef").prop("checked", true);
				} else if (arr[i] === "닭고기") {
					$("#chicken").prop("checked", true);
				} else if (arr[i] === "돼지고기") {
					$("#pork").prop("checked", true);
				} else if (arr[i] === "복숭아") {
					$("#peach").prop("checked", true);
				} else if (arr[i] === "민들레") {
					$("#dandelion").prop("checked", true);
				} else if (arr[i] === "계란") {
					$("#egg").prop("checked", true);
				}
			}
		});
			
			function clickEdit(){
				var pass = $('#_u_Password').val();
				if(pass.length < 6){
					alert("비밀번호는 6자이상 입력해주세요 ");
				}else{
					$('#_action').val('EDIT');
					$('#update-form').submit();
				}
			}
			
			function clickDelete(){
				var input = confirm("회원을 탈퇴하시겠습니까?");
				if(input == true){	
					$('#_action').val('DELETE');
					$('#update-form').submit();
				}
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
						<h1>회원정보 수정</h1>
						<span class="image main"><img src="img/pic13.jpg" alt="" /></span>	
					</div>	
				</div>
				<br/>
				<div id="mainPage">
					<div class="inner">
						<section>
							<form id="update-form" method="post" action="usermodify.do">
								<input type="hidden" name="action" value='' id="_action"/>
								<input type="text" name="u_Id" id="_u_Id" readonly="readonly" value="${sessionScope.id}"/>
								<br/>
								<input type="password" name="u_Password" id="_u_Password" placeholder="Password"/>
								<br/>
								<input type="text" name="u_Name" id="_u_Name" value="${sessionScope.alias}"/>
								<br/>
								<input type="text" name="u_Address" id="_u_Address" value="${address}"/>
								<br/>
								<input type="tel" name="u_Tel" id="_u_Tel" value="${tel}"/>
								<br/>
								<span style="margin-bottom: 10px;">알레르기 정보</span>
									<div class="row gtr-uniform">
										<br/>
										<div class="col-3 col-12-small">
											<input type="checkbox" id="soybean" name="u_Allergy" value="대두">
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
							</form>
							<a href="#" onClick="clickEdit();return false;" class="button primary" id="_edit">EDIT</a>
							<a href="userdrop.do" class="button primary" id="_delete">DELETE</a>
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