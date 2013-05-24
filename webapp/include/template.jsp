<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>title</title>
<%@ include file="/include/head4.jsp"%>
</head>
<body>
	<!-- Main Page Container -->
	<div class="page-container">
		<%@ include file="/include/top.jsp"%>
		<!-- B. MAIN -->
		<div class="main">

			<%@ include file="/include/left.jsp"%>

			<!-- B.2 MAIN CONTENT -->
			<div class="main-content">
				<!-- Pagetitle -->
				<h1 class="pagetitle">main-content</h1>

				<!-- Content unit - One column -->
				<div class="main-content">main-content</div>
			</div>

			<%@ include file="/include/right.jsp"%>
		</div>
		<%@ include file="/include/footer.jsp"%>
	</div>
</body>
</html>
