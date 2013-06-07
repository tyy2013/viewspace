<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript" src="<%=context %>/js/jwysiwyg/viewspace.js"></script>
<script>
	function mySubmit() {
		with (document) {
			var pointName = getElementById("pointName");
			if (pointName.value == null || pointName.value.length == 0) {
				alert("景点名称不能为空，请填上.");
				pointName.focus();
				return false;
			} else if (pointName.value.length > 100) {
				alert("景点名称最大长度不能超过50个字符，请调整.");
				pointName.focus();
				return false;
			}

			/* 	         var ticketPrice = getElementById("ticketPrice");
			 if(ticketPrice.value != null && ticketPrice.value.length > 0){
			 if(!/^(-|\+|([0-9]))([0-9])*\.?([0-9])*$/.test(ticketPrice.value)){
			 alert("景点票价不是合法的数字，请调整.");
			 ticketPrice.focus();
			 return false;
			 }
			 }  */

			return true;
		}

	}
</script>
<h1 class="pagetitle">空间要点信息</h1>
<div style="margin:10px 0;"></div>


<div class="column1-unit">


<%-- 	<c:if test="${!empty viewPoint}"> --%>
	<div class="contactform"> 
	<form action="${context}/vp/
			<c:if test="${!empty viewPoint}">${viewPoint.pointId}/update.do</c:if>
			<c:if test="${empty viewPoint}">save.do</c:if>"	
			method="post" onsubmit="return mySubmit()"
			enctype="multipart/form-data">
			
			<fieldset>
			<legend><c:if test="${!empty viewPoint}">更改空间要点信息</c:if>
				<c:if test="${empty viewPoint}">为空间添加新要点</c:if>
			</legend>
			<table>
				<tr>
					<td><label for="pointName" class="left">要点名称：</label></td>
					<td><input type="text" name="pointName" class="field" tabindex="1"
						value="${viewPoint.pointName}" /></td>
				</tr>
				<tr>
					<td ><label for="ticketPrice" class="left">要点备注：</label></td>
					<td ><input type="text" name="ticketPrice" class="field" tabindex="2"
						value="${viewPoint.ticketPrice}" /></td>
				</tr>
				<tr>
					<td ><label for="description" class="left">要点简介：</label></td>
					<td>
						<textarea name="description" id="wysiwyg" tabindex="3"
							>${viewPoint.description}</textarea>
					</td>
				</tr>
				<c:if test="${!empty viewPoint.imgFile}">
					<tr>
						<td ><label for="img" class="left">要点图片：</label></td>
						<td><img name="img"
							src="<c:url value="/uploads/${viewPoint.imgFile}"/>"></img></td>
					</tr>
				</c:if>
					<tr>
						<td><label for="imgFile" class="left">上传:</label></td>
						<td ><input type="file" name="imgFile" class="field" tabindex="4"></td>
					</tr>
				
<%-- 				<c:if test="${empty viewPoint.imgFile}"> --%>
<!-- 					<tr> -->
<!-- 						<td ><label for="imgFile" class="left">上传:</label></td> -->
<!-- 						<td ><input type="file" name="imgFile" class="field" tabindex="4"></td> -->
<!-- 					</tr> -->
<%-- 				</c:if> --%>

				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="保存" tabindex="5"> 
					<input type="reset" value="重置" tabindex="6"> 
					<c:if test="${!empty viewPoint}"><input type="hidden"
						name="spaceId" value="${viewPoint.viewSpace.spaceId}" /></c:if>
					<c:if test="${!empty viewSpace}"><input type="hidden"
						name="spaceId" value="${viewSpace.spaceId}" /></c:if>
					</td>
				</tr>
			</table>
			</fieldset>
		</form>
	</div>
<%-- 	</c:if> --%>
	
<%-- 	<c:if test="${empty viewPoint}"> --%>
<!-- 	<div class="easyui-panel" title="为空间添加新要点" style="width:600px; ">   -->
<!--     <div style="padding:10px 0 10px 20px;background-color:rgb(240,240,240);">  -->
<%-- 		<form action="${context}/vp/save.do" method="post" --%>
<!-- 			onsubmit="return mySubmit()" enctype="multipart/form-data"> -->
<!--  			<h3>为空间添加新要点</h3> --> 
<!-- 			<table> -->
<!-- 				<tr> -->
<!-- 					<td>要点名称：</td> -->
<!-- 					<td><input type="text" name="pointName" -->
<!-- 						class="easyui-validatebox"/></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td >要点备注：</td> -->
<!-- 					<td ><input type="text" name="ticketPrice" -->
<!-- 						class="easyui-validatebox"/></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>要点简介：</td> -->
<!-- 					<td><textarea name="description" id="wysiwyg" -->
<!-- 							style="width: 450; padding: 2px; height: 350;"></textarea> -->
<!-- 						</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td> 要点图片：</td> -->
<!-- 					<td ><input type="file"class="easyui-validatebox" name="imgFile"></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td colspan="2" align="center"><input type="submit" value="保存"> -->
<!-- 						<input type="reset" value="重置"> <input type="hidden" -->
<%-- 						name="spaceId" value="${viewSpace.spaceId}" /></td> --%>
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</form> -->
<!-- 		</div> -->
<!-- 	</div> -->
<%-- 	</c:if> --%>
</div>
<hr class="clear-contentunit">

