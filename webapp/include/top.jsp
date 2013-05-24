<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- For alternative headers START PASTE here -->

<!-- A. HEADER -->
<div class="header">

	<!-- A.1 HEADER TOP -->
	<div class="header-top">

		<!-- Sitelogo and sitename -->
		<a class="sitelogo" href="<c:url value="/index.jsp"/>"
			title="Go to Start page"></a>
		<div class="sitename">
			<h1>
				<a href="<c:url value="/index.jsp"/>" title="Go to Start page">WRI
					HOME<span style="font-weight: normal; font-size: 50%;">&nbsp;update-7</span>
				</a>
			</h1>
			<h2>
				<%-- 				<c:if test="${!empty USER_CONTEXT.userName}"> --%>
				<%--    	${sessionUser.userName},欢迎您的到来,<a --%>
				<%-- href="<c:url value="/login/doLogout.do"/>">注销</a>&nbsp;&nbsp; --%>
				<%--    <a href="<c:url value="/vs/index.do"/>">管理景区</a> --%>
				<%-- 				</c:if> --%>
				<%-- 				<c:if test="${empty USER_CONTEXT.userName}"> --%>
				<!-- 					<div style="color: red">用户未登录</div> -->
				<%-- 				</c:if> --%>
				Welcome ${USER_CONTEXT.userName}
			</h2>
		</div>

		<!-- 选择语言-->
		<div class="nav0">
			<ul>
				<li><a href="#" title="Pagina home in Italiano"><img
						src="<%=request.getContextPath() %>/img/flag_italy.gif"
						alt="Image description" /></a></li>
				<li><a href="#" title="Homepage auf Deutsch"><img
						src="<%=request.getContextPath() %>/img/flag_germany.gif"
						alt="Image description" /></a></li>
			</ul>

		</div>

		<!-- Navigation Level 1 -->
		<div class="nav1">
			<ul>
				<li><a href="<c:url value="/index.jsp"/>" title="Go to Start page">Home</a></li>
				<li><a href="#" title="Get to know who we are">About</a></li>
				<li><a href="#" title="Get in touch with us">Contact</a></li>
				<li><a href="#" title="Get an overview of website">Sitemap</a></li>
			</ul>
		</div>
	</div>

	<!-- 	A.2 HEADER MIDDLE -->
	      <div class="header-middle" style="background-color:rgb(230,230,230) ;background-image:url(<%=request.getContextPath() %>/img/banner.gif);">    
	        Site message
	        <div class="sitemessage">
	          <h1>EASY &bull; FLEXIBLE &bull; ROBUST</h1>
	          <h2>The third generation Multiflex is<br /> here, now with cooler design<br /> features and easier code.</h2>
	          <h3><a href="#">&rsaquo;&rsaquo;&nbsp;More details</a></h3>
	        </div>        
	      </div>

	<!-- A.3 HEADER BOTTOM -->
	<div class="header-bottom">

		<!-- Navigation Level 2 (Drop-down menus) -->
		<div class="nav2">
			<ul>
				<li><a href="<c:url value="/index.jsp"/>">HOME</a></li>
			</ul>
			<c:forEach var="viewSpace" items="${viewSpaces}">
				<!-- Navigation item -->
				<ul>
					<li><a href="<c:url value="/vs/${viewSpace.spaceId}.do"/>">
						${viewSpace.spaceName} </a></li>
				</ul>
			</c:forEach>

						
		</div>
	</div>

	<!-- A.4 HEADER BREADCRUMBS -->

	<!-- Breadcrumbs -->
	<div class="header-breadcrumbs">
		<ul>
			<li>
			<a href="
				<c:if test="${empty USER_CONTEXT.userName}">
					<c:url value="/index.do"/>
				</c:if>
				<c:if test="${!empty USER_CONTEXT.userName}">
					<c:url value="/vs/index.do"/>
				</c:if>
			">Home</a>
			</li>
			
			<c:if test="${!empty viewSpace}">
				<li><a href="<c:url value="/vs/${viewSpace.spaceId}.do"/>">
					${viewSpace.spaceName} </a></li>
			</c:if>
			<c:if test="${!empty viewPoint}">
				<li><a href="<c:url value="/vp/${viewPoint.pointId}.do"/>">
					${viewPoint.pointName} </a></li>
			</c:if>
		</ul>

		<!-- Search form -->
		<div class="searchform">
			<form action="#" method="get" class="form">
				<fieldset>
					<input value=" Search..." name="field" class="field" /> <input
						type="submit" value="GO!" name="button" class="button" />
				</fieldset>
			</form>
		</div>
	</div>
</div>
