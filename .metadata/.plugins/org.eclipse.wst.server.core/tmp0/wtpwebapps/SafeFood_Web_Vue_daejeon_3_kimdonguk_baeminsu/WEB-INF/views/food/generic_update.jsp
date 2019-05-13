<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">

	$(function() {
		var arr = new Array();
		<c:forEach items="${info.u_Allergy}" var="arr">
			arr.push("${arr}");
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

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#prev').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

<style>
.label {
	width: 100px;
}
</style>
<title>SAFE FOOD</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<jsp:include page="../common/nav.jsp" />


		<!-- Main -->
		<div id="main">
			<div class="inner">
				<h1>상품등록</h1>
			</div>
		</div>
		<br /> <br />

		<div id="mainPage">
			<div class="inner">
				<section>
					<form action="food_update_af.do"
			method="post" enctype="multipart/form-data">
						<div class="row">
							<input type="hidden" name="action" value="update">
							<div class="col-4 col-12-medium">
								<span class="image fit"> <img id="prev" src="${info.img}" alt=""></span>
								<input type="file" name="uploadFile" size="40" onchange="readURL(this);" style="margin: 30px">
							</div>
							
							<div class="col-8 col-12-medium">
								<div class="table-wrapper">
									<table class="productTable">
										<tbody>
											<tr>
												<td class="label"><b>상품코드</b></td>
												<td><input type="number" name="code" class="input"
													value="${info.code}" readonly="readonly"></td>
											</tr>
											<tr>
												<td class="label"><b>상품명</b></td>
												<td><input type="text" name="name" class="input"
													value="${info.name}"></td>
											</tr>
											<tr>
												<td class="label"><b>제조사</b></td>
												<td><input type="text" name="maker" class="input"
													value="${info.maker}"></td>
											</tr>
											<tr>
												<td class="label"><b>원료</b></td>
												<td><textarea name="material" class='input' rows=10
														cols=30>${info.material}</textarea></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<h3>알레르기 성분</h3>
							<div class="row gtr-uniform">
								<br />
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
									<input type="checkbox" id="dandelion" name="u_Allergy"
										value="민들레"> <label for="dandelion">민들레</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="egg" name="u_Allergy" value="계란">
									<label for="egg">계란</label>
								</div>
							</div>
							<div>
								<br/>
							</div>
							<div class="col-12 col-12-medium">
								<div class="table-wrapper">
									<table>
										<caption>
											<h3>성분입력</h3>
										</caption>
										<thead>
											<tr>
												<th>열량</th>
												<th><input type="number" name="calory" class="input"
													value="${info.calory}">kcal</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>일회 제공량</td>
												<td><input type="number" name="supportpereat"
													class="input" value="${info.supportpereat}">g</td>
											</tr>
											<tr>
												<td>탄수화물</td>
												<td><input type="number" name="carbo" class="input"
													value="${info.carbo}">g</td>

											</tr>
											<tr>
												<td>나트륨</td>
												<td><input type="number" name="natrium" class="input"
													value="${info.natrium}">mg</td>

											</tr>
											<tr>
												<td>단백질</td>
												<td><input type="number" name="protein" class="input"
													value="${info.protein}">g</td>

											</tr>
											<tr>
												<td>당류</td>
												<td><input type="number" name="sugar" class="input"
													value="${info.sugar}">g</td>

											</tr>
											<tr>
												<td>지방</td>
												<td><input type="number" name="fat" class="input"
													value="${info.fat}">g</td>

											</tr>
											<tr>
												<td>포화지방</td>
												<td><input type="number" name="fattyacid" class="input"
													value="${info.fattyacid}">g</td>

											</tr>
											<tr>
												<td>콜레스테롤</td>
												<td><input type="number" name="chole" class="input"
													value="${info.chole}">g</td>

											</tr>
											<tr>
												<td>트랜스지방</td>
												<td><input type="number" name="transfat" class="input"
													value="${info.transfat}">g</td>

											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<input type="submit" value="확인">
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