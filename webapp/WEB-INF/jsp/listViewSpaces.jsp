<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		 <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <meta http-equiv="cache-control" content="no-cache" />
  <meta http-equiv="expires" content="3600" />
  <meta name="description" content="Your page description here ..." />
  <meta name="keywords" content="Your keywords, keywords, keywords, here ..." />
  <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout4_setup.css" />
  <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout4_text.css" />
  <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
		<title>风景区列表</title>
	</head>
	<body>

	<%@ include file="includeTop.jsp"%>
	<div style="clear:both;">	
		<div style="float: right;">
		<form action="${context}/search.do" method="post" >  请输入景区名<input type="text" name="spaceName" style="width:400px" />
		      <input type="submit" value="查询"/>
		      <input type="hidden" name="_method"  value="PUT"/>
		</form>
		</div>
		<table border="1px" width="100%">
			<tr>
				<td width="10%">景区名</td>
				<td width="10%">所在地</td>
				<td>景区简介</td>
			</tr>
			<c:forEach var="viewSpace" items="${viewSpaces}">
				<tr>
					<td>
						<a href="<c:url value="/vs/${viewSpace.spaceId}.do"/>">
						   ${viewSpace.spaceName}
						</a>
					</td>
					<td>${viewSpace.address}</td>
					<td>${viewSpace.briefDesc}</td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</body>
</html>
