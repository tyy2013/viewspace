<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript" src="<%=context %>/js/jwysiwyg/viewspace.js"></script>
<script>
	function mySubmit() {
		with (document) {
			var spaceName = getElementById("spaceName");
			if (spaceName.value == null || spaceName.value.length == 0) {
				alert("景区名称不能为空，请填上.");
				spaceName.focus();
				return false;
			} else if (spaceName.value.length > 50) {
				alert("景区名称最大长度不能超过50个字符，请调整.");
				spaceName.focus();
				return false;
			}

			var address = getElementById("address");
			if (address.value == null || address.value.length == 0) {
				alert("景区地址不能为空，请填上.");
				address.focus();
				return false;
			} else if (address.value.length > 50) {
				alert("景区名称最大长度不能超过150个字符，请调整.");
				address.focus();
				return false;
			}

			var website = getElementById("website");
			if (website.value != null) {
				if (website.value.length > 100) {
					alert("网址的长度不能超过100个字符。");
					website.focus();
					return false;
				} else if (website.value.toUpperCase().indexOf("HTTP://") != 0) {
					alert("网址必须以http://开头。");
					website.focus();
					return false;
				}
			}
			return true;
		}

	}
</script>
<h1 class="block">编辑空间内容</h1>
<div class="column1-unit">
	<div class="contactform">
<%-- 	<c:if test="${!empty viewSpace}"> --%>
		<form method="post"	action="${context}/vs/
			<c:if test="${!empty viewSpace}">${viewSpace.spaceId}/update.do</c:if>
			<c:if test="${empty viewSpace}">save.do</c:if>
			"
			onsubmit="return mySubmit()">
			<fieldset>
				<legend>&nbsp;${viewSpace.spaceName} 内容&nbsp;</legend>

				<table>
				<tr>
					<td><label for="spaceName" class="left">空间名称:</label> </td>
					<td><input type="text" name="spaceName" value="${viewSpace.spaceName}"
						class="field" tabindex="1" /></td>
				</tr>
				<tr>
					<td><label for="address" class="left">地址:</label> </td>
					<td><input type="text" name="address" value="${viewSpace.address}"
						class="field" tabindex="2" /></td>
				</tr>
				<tr>
					<td><label for="website" class="left">网址:</label> </td>
					<td><input type="text" name="website" value="${viewSpace.website}"
						class="field" tabindex="3" /></td>
				</tr>
				<tr>
					<td><label for="description" class="left">简介:</label> </td>
					<td><textarea name="description" id="wysiwyg" tabindex="4">
						${viewPoint.description}</textarea></td>
<!-- 					<input	type="text" class="field" name="description" tabindex="4" -->
<%-- 						value="${viewSpace.description}" /> --%>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" name="submit" id="submit" class="button"
						value="保存" tabindex="5"> 
					<input type="reset" value="重置"
						class="button" tabindex="6"> 
					<input type="hidden" name="_method" value="PUT"> 
					</td>
					<c:if test="${!empty viewSpace}">
					<input type="hidden"
						name="wantNum" value="${viewSpace.wantNum}" /> 
					<input
						type="hidden" name="beenNum" value="${viewSpace.beenNum}" /> 
					<input
						type="hidden" name="notwantNum" value="${viewSpace.notwantNum}" />
					<input type="hidden" name="spaceId" value="${viewSpace.spaceId}" />
					</c:if>
				</tr>
				</table>
			</fieldset>
		</form>
<%-- 	</c:if> --%>
<%-- 	<c:if test="${empty viewSpace}">		 --%>
<%-- <form action="${context}/vs/save.do" method="post"> --%>
<!-- 	<fieldset> -->
<%-- 				<legend>&nbsp;${viewSpace.spaceName} 内容&nbsp;</legend> --%>
<!-- 				<p> -->
<!-- 					<label for="spaceName" class="left">空间名称:</label>  -->
<!-- 					<input type="text" name="spaceName"  -->
<!-- 						class="field" value="" tabindex="1" /> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<label for="address" class="left">地址:</label>  -->
<!-- 					<input type="text" name="address"  -->
<!-- 						class="field" value="" tabindex="2" /> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<label for="website" class="left">网址:</label>  -->
<!-- 					<input type="text" name="website"  -->
<!-- 						class="field" value="" tabindex="3" /> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<label for="description" class="left">简介:</label>  -->
<!-- 					<input	type="text" class="field" name="description" tabindex="4"/> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<input type="submit" value="保存" class="button" tabindex="5" > -->
<!-- 				   <input type="reset" value="重置" class="button" tabindex="6" > -->
<!-- 				   <input type="hidden" name="_method" value="PUT"> -->
<!-- 				</p> -->
<!-- 			</fieldset> -->

<!-- </form> -->
<%-- </c:if> --%>

	</div>
</div>
<hr class="clear-contentunit">