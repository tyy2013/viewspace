<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${viewSpace.spaceName}</title>
<%@ include file="/include/head4.jsp"%>
</head>
<body>
	<!-- Main Page Container -->
	<div class="page-container">
		<%@ include file="/include/top.jsp"%>
		<!-- B. MAIN -->
		<div class="main">

			<%@ include file="/include/navigation.jsp"%>

			<!-- B.2 MAIN CONTENT -->
			<div class="main-content">
				<%@ include file="component/viewspace.jsp"%>
				
				<c:forEach var="viewPoint" varStatus="status" items="${viewSpace.viewPoints}">
					<%@ include file="component/viewpoint.jsp"%>
				</c:forEach>
			</div>
	
		</div>
		<%@ include file="/include/footer.jsp"%>
	</div>
</body>
</html>
