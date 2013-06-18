
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- B.1 MAIN NAVIGATION -->
<div class="main-navigation">
	<!-- Navigation Level 3 -->
	<div class="round-border-topright"></div>
	<h1 class="first">导航</h1>

	<!-- Navigation with grid style -->
	<dl class="nav3-grid">
<%-- 		<c:forEach var="viewSpace" items="${viewSpaces}"> --%>
<!-- 			<dt> -->
<%-- 				<a href="<c:url value="/vs/${viewSpace.spaceId}.do"/>"> --%>
<%-- 					${viewSpace.spaceName} </a> --%>
<!-- 			</dt> -->
<%-- 		</c:forEach> --%>
		<c:forEach var="viewPoint" varStatus="status"
			items="${viewSpace.viewPoints}">
			<dt>
				<a href="#">
					${viewPoint.pointName} </a>
			</dt>
		</c:forEach>
	</dl>
</div>