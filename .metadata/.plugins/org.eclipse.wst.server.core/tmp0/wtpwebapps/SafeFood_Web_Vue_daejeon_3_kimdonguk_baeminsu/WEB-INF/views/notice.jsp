<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8");  %>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
    <fmt:requestEncoding value="utf-8"/>
    
    
<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
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

		<jsp:include page="./common/nav.jsp"/>

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								<h1>Notice</h1>
								<p>SAFE FOOD 공지사항</p>
							</header>
						</div>
					</div>
					
					<div id="mainPage">
						<div class="inner">
							<section>
								<p>공지사항공지사항</p>
							</section>
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