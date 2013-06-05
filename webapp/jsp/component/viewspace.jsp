<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${!empty viewSpace}">
	<!-- Pagetitle -->
	<h1 class="pagetitle">${viewSpace.spaceName}</h1>
	
	<!-- Content unit - One column -->
	<div class="column1-unit">
		<h1>简介</h1>
		<h3>${viewSpace.address}</h3>
		
		<h3>${viewSpace.description}</h3>
<!-- 		<p> -->
<%-- 			<a href="<c:url value="${viewSpace.website}"/>">${viewSpace.website}</a> --%>
<!-- 		</p> -->
	</div>
<!-- 	<hr class="clear-contentunit" /> -->
</c:if>