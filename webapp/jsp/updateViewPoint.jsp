<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/include/head4.jsp"%>
<title>更改景区的景点</title>
	<script>
	   function mySubmit(){
	      with(document){
	         var pointName = getElementById("pointName");
	         if(pointName.value == null || pointName.value.length ==0){
	            alert("景点名称不能为空，请填上.");
	            pointName.focus();
	            return false;
	         }else if(pointName.value.length > 100){
	            alert("景点名称最大长度不能超过50个字符，请调整.");
	            pointName.focus();
	            return false;
	         }
	          
	         var ticketPrice = getElementById("ticketPrice");
	         if(ticketPrice.value != null && ticketPrice.value.length > 0){
	            if(!/^(-|\+|([0-9]))([0-9])*\.?([0-9])*$/.test(ticketPrice.value)){
				    alert("景点票价不是合法的数字，请调整.");
					ticketPrice.focus();
					return false;
				}
	         }
	           
	         return true;
	      }
	      
	   }
	</script>
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
				<form action="${context}/vp/${viewPoint.pointId}/update.do" method="post"  onsubmit="return mySubmit()" enctype="multipart/form-data">
<div>更改景区景点信息</div>
<table border="1px" width="100%">
	<tr>
		<td width="20%">景点的名称：</td>
		<td width="80%"><input type="text" name="pointName" value="${viewPoint.pointName}" style="width:100%"/></td>
	</tr>
	<tr>
		<td width="20%">景点票价：</td>
		<td width="80%"><input type="text" name="ticketPrice" value="${viewPoint.ticketPrice}" style="width:100%"/></td>
	</tr>
	<tr>
		<td width="20%">景点简介：</td>
		<td width="80%"><textarea name="description" style="padding:2px;">"${viewPoint.description}</textarea></td>
	</tr>
	<c:if test="${!empty viewPoint.imgFile}">
		<tr>
			<td width="20%">景点图片：</td>
			<td width="80%"><img src="<c:url value="/static/uploads/${viewPoint.imgFile}"/>"></img></td>
		</tr>
		<tr>
		   <td width="20%">重新上传：</td>
		   <td width="80%"><input type="file" name="imgFile"></td>
	    </tr>
	</c:if>
	<c:if test="${empty viewPoint.imgFile}">
		<tr>
		   <td width="20%">景点图片：</td>
		   <td width="80%"><input type="file" name="imgFile"></td>
	    </tr>
	</c:if>	

	<tr>
		<td colspan="2">
		   <input type="submit" value="保存">
		   <input type="reset" value="重置">
		   <input type="hidden" name="spaceId"  value="${viewPoint.viewSpace.spaceId}"/>
		</td>
	</tr>
</table>
</form>
			</div>

			<%@ include file="/include/right.jsp"%>
		</div>
		<%@ include file="/include/footer.jsp"%>
	</div>
</body>
</html>