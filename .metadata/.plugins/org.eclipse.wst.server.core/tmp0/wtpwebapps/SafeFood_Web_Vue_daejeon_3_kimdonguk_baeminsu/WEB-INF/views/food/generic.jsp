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
	
	<style>
	
	.label {
		width: 100px;
	}
	
	.gbutton{
		
		margin-bottom: 50px;
		margin-left: 10px;
		margin-right: 10px;
	}
		
	
	</style>
		<title>SAFE FOOD</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<script type="text/javascript">
		
		function updatePageMove(code){
				location.href="<%=request.getContextPath()%>/food_update_bf.do?code="+code;
			};
			
		function deletePageMove(code){
				location.href="<%=request.getContextPath()%>/food_remove.do?code="+code;
			}
			
			// Load the Visualization API and the corechart package.
			google.charts.load('current', {'packages':['corechart']});
					
			// Set a callback to run when the Google Visualization API is loaded.
			google.charts.setOnLoadCallback(drawChart);
					
			// Callback that creates and populates a data table,
			// instantiates the pie chart, passes in the data and
			// draws it.
			function drawChart() {
			// Create the data table.
			var jsonData = $.ajax({
									url: "item.json",
									dataType:"json",
									async: false
									}).responseText;
			
			
			var carbo = ${info.carbo};
			var protein = ${info.protein};
			var fat = ${info.fat};
			var sugar = ${info.sugar};
			var fatty = ${info.fattyacid};
			var natrium =${info.natrium};
			var transfat = ${info.transfat};
			var data = new google.visualization.DataTable({
			    cols: [
			        {id:"",label:"name",pattern:"",type:"string"},
			        {id:"",label:"size",pattern:"",type:"number"}
			    ],  
			    rows: [
			        {c:[{v:"탄수화물",f:null},{v:carbo,f:null}]},
			        {c:[{v:"단백질",f:null},{v:protein,f:null}]},
			        {c:[{v:"당류",f:null},{v:sugar,f:null}]},
			        {c:[{v:"지방",f:null},{v:fat,f:null}]},
			        {c:[{v:"나트륨",f:null},{v:natrium/1000,f:null}]},
			        {c:[{v:"포화지방",f:null},{v:fatty,f:null}]},
			        {c:[{v:"트랜스지방",f:null},{v:transfat,f:null}]}			     
			    ]
			});
			var options = {'title':'영양 정보', colors: ['#F8CBCC', '#CAE8FB', '#FFE799', '#B5D8B5', '#E9CCE9', '#F5D6B9']};
					
			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
			chart.draw(data, options);
			}
			
			$(window).resize(function(){
				  drawChart();
				});
   		</script>
	</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

		<jsp:include page="../common/nav.jsp"/>


				<!-- Main -->
				<div id="main">
					<div class="inner">
						<h1>${info.name}</h1>
					</div>
				</div>
				<br/>
				<br/>
				<div id="mainPage">
					<div class="inner">
						<section>
							<div class="row gtr-uniform">						
								<div class="col-4">
									<span class="image fit">
										<img src="${info.img}" alt="">
									</span>
								</div>
								<div class="col-8">
									<div class="table-wrapper">
										<table class="productTable">
											<tbody>
												<tr>
													<td class="label"><b>상품명</b></td>
													<td>${info.name}</td>
												</tr>
												<tr>
													<td class="label"><b>제조사</b></td>
													<td>${info.maker}</td>
												</tr>
												<tr>
													<td class="label"><b>원료</b></td>
													<td>${info.material}</td>
												</tr>
												<tr>
													<td class="label"><b>알레르기</b></td>
													<c:if test="${empty alle }"> 
														<td>해당없음 </td>
													</c:if>
													
													<c:if test="${not empty alle }"> 
														<td>${alle}</td>
													</c:if>
													
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</section>
						
						
			
					
						<section>
							<div class="row gtr-uniform">
								<div id="chart_div" class="col-12 chart"></div>
							</div>
							<div class="row gtr-uniform">
								<div class="col-12">
									<div class="table-wrapper">
										<table>
											<caption><h3>성분표시</h3></caption>
											<thead>
												<tr>
													<th>열량</th>
													<th>${info.calory}kcal</th>
													
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>탄수화물</td>
													<td>${info.carbo}g</td>
													
												</tr>
												<tr>
													<td>나트륨</td>
													<td>${info.natrium}mg</td>
													
												</tr>
												<tr>
													<td>단백질</td>
													<td>${info.protein}g</td>
												
												</tr>
												<tr>
													<td>당류</td>
													<td>${info.sugar}g</td>
												
												</tr>
												<tr>
													<td>지방</td>
													<td>${info.fat}g</td>
												
												</tr>
												<tr>
													<td>포화지방</td>
													<td>${info.fattyacid}g</td>
												
												</tr>
												<tr>
													<td>콜레스테롤</td>
													<td>${info.chole}g</td>
											
												</tr>
												<tr>
													<td>트랜스지방</td>
													<td>${info.transfat}g</td>
												
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>


			<div id="btncontainer" style="margin:auto; text-align:center;">
				<c:if test="${sessionScope.id == 'admin'}">
				<button class="gbutton" onclick="updatePageMove('${info.code}')">수정</button>
				<button class="gbutton" onclick="deletePageMove('${info.code}')">삭제</button>
		
			</c:if>
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