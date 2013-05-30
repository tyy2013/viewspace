<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
				<!-- Pagetitle -->
				<h1 class="pagetitle">${viewSpace.spaceName}</h1>

				<!-- Content unit - One column -->
				<div class="column1-unit">
					<h1>${viewSpace.spaceName}</h1>
					<h3>${viewSpace.address}</h3>
					<p>${viewSpace.description}</p>
					<p>
						<a href="<c:url value="${viewSpace.website}"/>">${viewSpace.website}</a>
					</p>
				</div>
				<hr class="clear-contentunit" />


				<c:forEach var="viewPoint" varStatus="status"
					items="${viewSpace.viewPoints}">
					<!-- Content unit - One column -->
					<h1 class="block">${status.count} - ${viewPoint.pointName}</h1>
					<div class="column1-unit">
<!-- 						<h1>Main heading above image</h1> -->
<!-- 						<h1>Heading h1</h1> -->
<!-- 						<h3>Heading h3</h3> -->
<!-- 						<p> -->
<!-- 							<img src="./img/image.jpg" alt="Image description" -->
<!-- 								title="Image title" />Lorem ipsum dolor sit amet, consectetuer -->
<!-- 							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut -->
<!-- 							laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim -->
<!-- 							veniam, quis nostruderci tation ullamcorper suscipit lobortis -->
<!-- 							nisl ut aliquip. orem ipsum dolor sit amet. -->
<!-- 						</p> -->
<!-- 						<p> -->
<!-- 							<img class="center" src="./img/image.jpg" alt="Image description" -->
<!-- 								title="Image title" /> -->
<!-- 						</p> -->
						
						
						<h1>${viewPoint.ticketPrice}</h1>
						<h3>${viewPoint.description}</h3>
						<c:if test="${!empty viewPoint.imgFile}">
							<p>
								<img  width="100%"
									src="<c:url value="/uploads/${viewPoint.imgFile}"/>"
									alt="Image description" title="Image title" />
							</p>
						</c:if>

					</div>
					<hr class="clear-contentunit" />
				</c:forEach>
			</div>

			
		</div>
		<%@ include file="/include/footer.jsp"%>
	</div>
</body>
</html>
