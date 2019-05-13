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
#empty_div {
	height: 200px;
	margin: auto;
	display: flex;
	justify-content: center;
	align-items: center;
}

#empty_mg {
	margin: auto;
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">




	$(function() {
		$('#_page${paging.page}').addClass('clicked');
		$('.page')
	});
	function searchPageClick(keyword,type,page){
		$("#_type").val(type);
		$("#_keyword").val(keyword);
		$("#_page").val(page);
		$("#search_paging").submit();
	}
	
	
	
	
	
</script>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">



		<jsp:include page="./common/nav.jsp" />


		<!-- Main -->
		<div id="main">
			<div class="inner">
				<div class="searchBar">
					<header>
						<h1>What We Provide</h1>
						<p>건강한 삶을 위한 먹거리 프로젝트</p>
					</header>

					<form action="<%=request.getContextPath()%>/foodsearchlist.do"
						method="post">
						<div class="row aln-center gtr-uniform">
							<div class="col-3 col-12-small">
								<select name="type" id="search">
									<option value="0">상품명</option>
									<option value="1">상품원료</option>
								</select>
							</div>
							<div class="col-3 col-12-small">
								<input type="text" name="keyword" id="search" placeholder="검색단어">

							</div>
							<div class="col-3 col-12-small">
								<input type="submit" class="startSearch" value="검색" />
							</div>
							<input type="hidden" name="page" value=1>
						</div>
						<input type="hidden" name="action" value="select">

					</form>
				</div>
			</div>
		</div>
		<br /> <br />



		<div id="mainPage">
			<div class="inner">
				<section class="tiles">
					<!-- 서블릿에서 제공받은 리스트 출력 -->
					<c:if test="${not empty paging}">
						<c:forEach items="${paging.list}" var="item" varStatus="vs">

							<article class="style${vs.count}">
								<span class="image center">
								
								
								
								<img src="${item.img}" alt="" />
								</span> <a href="food_detail.do?code=${item.code}">
									<div class="content">
										<h2>${item.name}</h2>
									</div>
								</a>
							</article>

						</c:forEach>
					</c:if>
				</section>

				<c:if test="${empty paging}">
					<div id='empty_div'>
						<h2 id='empty_mg'>결과가 존재하지 않습니다.</h2>
					</div>
				</c:if>

				<div>
					<br />
					<br />
				</div>

				<c:if test="${not empty paging && empty searchType}">
					<div class="pages">
						<ul class="actions row aln-center">
							<c:if test="${paging.startPage>1}">
								<li><a
									href="foodlist.do?page=${paging.startPage-1}"
									class="button small ">&lt;&lt;이전</a></li>
							</c:if>
							<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
								var="p">
								<li><a href="foodlist.do?page=${p}"
									class="button small " id="_page${p}"> ${p} </a></li>
							</c:forEach>
							<c:if test="${paging.endPage<paging.totalPage}">
								<li><a
									href="foodlist.do?page=${paging.endPage+1}"
									class="button small ">&lt;&lt;다음</a></li>
							</c:if>
						</ul>
					</div>
				</c:if>
				
				
				


				<c:if test="${not empty paging && not empty searchType}">
					<div class="pages">
						<ul class="actions row aln-center">
							<c:if test="${paging.startPage>1}">
								<li><a
									href="#"
									onclick="searchPageClick('${searchKeyword}','${searchType}','${paging.startPage-1}')"
									class="button small page">&lt;&lt;이전</a></li>
							</c:if>
							<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
								var="p">
								<li><a 
									href="#"
									onclick="searchPageClick('${searchKeyword}','${searchType}','${p}')"
									class="button small page" id="_page${p}"> ${p} </a></li>
							</c:forEach>
							<c:if test="${paging.endPage<paging.totalPage}">
								<li><a
									href="#"
									onclick="searchPageClick('${searchKeyword}','${searchType}','${paging.startPage+1}')"
									class="button small page">&lt;&lt;다음</a></li>
							</c:if>
						</ul>
						
						
						<form id="search_paging" action="foodsearchlist.do" method="post">
							<input type="hidden" id="_type" name="type"/>
							<input type="hidden" id="_keyword" name="keyword"/>
							<input type="hidden" id="_page" name="page"/>
						</form>
					</div>
				</c:if>
				
				
				
			</div>
		</div>


		<jsp:include page="./common/footer.jsp"></jsp:include>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>