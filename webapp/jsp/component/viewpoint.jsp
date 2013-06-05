<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${!empty viewPoint}">
<!-- Content unit - One column -->
<h1 class="block"><c:if test="${!empty status}">${status.count} -</c:if> ${viewPoint.pointName}</h1>
<div class="column1-unit">
	<h1>${viewPoint.ticketPrice}</h1>
	<div>${viewPoint.description}</div>
	<c:if test="${!empty viewPoint.imgFile}">
		<p>
			<img width="100%" src="<c:url value="/uploads/${viewPoint.imgFile}"/>"
				alt="Image description" title="Image title" />
		</p>
	</c:if>

</div>
<hr class="clear-contentunit" />
</c:if>