<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
		<title>光纤通信技术和网络国家重点实验室</title>
		<%@ include file="/include/head4.jsp"%>
</head>
<body>
 <!-- Main Page Container -->
  <div class="page-container">
	<%@ include file="/include/top.jsp"%>
		 
		 <!-- B. MAIN -->
    	<div class="main">
    	<%@ include file="/include/navigation.jsp" %>
    	
    	<div class="main-content">
    	<h1 class="pagetitle">管理页面</h1>
    	
        <h1 class="block" >管理空间</h1>
    	<div class="column1-unit">
    	<table width="100%">
			<tr><th colspan="4" ><div style="float: right">
			<a href="<c:url value="/vs/add.do"/>">新增空间</a></div>
			
			</th></tr>
			
			<tr>
				<th class="top" scope="col">空间名</th>
				<th class="top" scope="col">所在地</th>
				<th class="top" scope="col">简介</th>
				<th class="top" scope="col">操作</th>
			</tr>

			<c:forEach var="viewSpace" items="${viewSpaces}" varStatus="status">
				<form id="form${status.count}" method="post" action="${context}/vs/${viewSpace.spaceId}/delete.do">
				<tr>
					<td>
						<a href="<c:url value="/vs/${viewSpace.spaceId}.do"/>">
						   ${viewSpace.spaceName}
						</a>
					</td>
					<td>${viewSpace.address}</td>
					<td>${viewSpace.description}</td>
					<td>
					   <a href="<c:url value="/vs/${viewSpace.spaceId}/edit.do"/>">更改</a>
					   <input type="hidden" name="_method" value="DELETE" />
					   <a href="javascript:document.getElementById('form${status.count}').submit();">删除</a>
					</td>					
				</tr>
				</form>
			</c:forEach>
		</table>
		</div>
		</div>
		</div>
		<%@ include file="/include/footer.jsp" %>
	</div>
</body>
</html>
