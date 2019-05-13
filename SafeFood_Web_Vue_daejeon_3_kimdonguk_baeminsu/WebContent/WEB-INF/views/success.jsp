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
<!DOCTYPE html>

<html>
	<head>
		<title>${stat}</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

		<jsp:include page="./common/nav.jsp"/>

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<h1>Result</h1>
							<span class="image main"><img src="<%= request.getContextPath() %>/images/pic13.jpg" alt="" /></span>						
						</div>		
					</div>
					<br/>
					<div id="mainPage">
						<div class="inner">
							<section class="align-center">
								<h1>${stat}</h1>
								<h2>${msg}</h2>
								<a href='${nurl}'>돌아가기</a>
							</section>
						</div>
					</div>

				<jsp:include page="./common/footer.jsp"></jsp:include>

			</div>

		<!-- Scripts -->
			<script src="<%= request.getContextPath() %>/assets/js/jquery.min.js"></script>
			<script src="<%= request.getContextPath() %>/assets/js/browser.min.js"></script>
			<script src="<%= request.getContextPath() %>/assets/js/breakpoints.min.js"></script>
			<script src="<%= request.getContextPath() %>/assets/js/util.js"></script>
			<script src="<%= request.getContextPath() %>/assets/js/main.js"></script>

	</body>
</html>