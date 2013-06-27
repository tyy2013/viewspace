<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jwysiwyg/viewspace.js"></script>
<script>
	function mySubmit(){}
</script>
<h1 class="block">编辑空间内容</h1>
<div class="column1-unit">
	<div class="contactform">

		<form method="post"	action="${context}/user/
			<c:if test="${!empty user}">${user.userId}/update.do</c:if>
			<c:if test="${empty user}">save.do</c:if>
			"
			onsubmit="return mySubmit()">
			<fieldset>
				<legend>&nbsp;${user.userName} 信息&nbsp;</legend>

				<table>
				<tr>
					<td><label for="userName" class="left">名称:</label> </td>
					<td><input type="text" name="userName" value="${user.userName}"
						class="field" tabindex="1" /></td>
				</tr>
				<tr>
					<td><label for="password" class="left">密码:</label> </td>
					<td><input type="text" name="password" value="${user.password}"
						class="field" tabindex="2" /></td>
				</tr>

				<tr>
					<td colspan="2" align="center">
					<input type="submit" name="submit" id="submit" class="button"
						value="保存" tabindex="5"> 
					<input type="reset" value="重置"
						class="button" tabindex="6"> 
					</td>
					<c:if test="${!empty user}">
						<input type="hidden" name="userId" value="${user.userId}" />
						<input type="hidden" name="_method" value="PUT"> 
					</c:if>
					<c:if test="${empty user}">
						<input type="hidden" name="_method" value="POST"> 
					</c:if>
				</tr>
				</table>
			</fieldset>
		</form>

	</div>
</div>
