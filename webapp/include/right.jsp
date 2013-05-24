
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- B.3 SUBCONTENT -->
<div class="main-subcontent">

	<!-- Login -->
	<div class="subcontent-unit-border">
		<div class="round-border-topleft"></div>
		<div class="round-border-topright"></div>
		<c:if test="${!empty USER_CONTEXT.userName}">
			<h1>用户</h1>
			<p>${USER_CONTEXT.userName},欢迎您的到来,
			<a href="<c:url value="/login/doLogout.do"/>">注销</a>&nbsp;&nbsp;
						   <a href="<c:url value="/vs/index.do"/>">管理景区</a>
		</c:if>
		<c:if test="${empty USER_CONTEXT.userName}">
			<h1>Login</h1>
			<div class="loginform">
				<form action="${context}/login/doLogin.do" method="post">
					<p>
						<input type="hidden" value="0" name="rememberme">
					</p>
					<fieldset>
						<p>
							<label class="top" for="username_2">User:</label><br> <input
								type="text" value=""
								onkeypress="return webLoginEnter(document.loginfrm.password);"
								class="field" tabindex="1" id="userName" name="userName">
						</p>
						<p>
							<label class="top" for="password_2">Password:</label><br> <input
								type="password" value=""
								onkeypress="return webLoginEnter(document.loginfrm.cmdweblogin);"
								class="field" tabindex="2" id="password" name="password">
						</p>
						<p>
							<input type="checkbox" onclick="webLoginCheckRemember()" value=""
								size="1" tabindex="3" class="checkbox" id="checkbox_2"
								name="checkbox"><label class="right" for="checkbox_1">Remember
								me</label>
						</p>
						<p>
							<input type="submit" value="LOGIN" class="button"
								name="cmdweblogin">
						</p>
						<p>
							<a id="forgotpsswd_2" onclick="webLoginShowForm(2);return false;"
								href="#">Password forgotten?</a>
						</p>
					</fieldset>
				</form>
			</div>
		</c:if>
		</p>
	</div>

	<!-- Subcontent unit -->
	<div class="subcontent-unit-border">
		<div class="round-border-topleft"></div>
		<div class="round-border-topright"></div>
		<h1>Layout Options</h1>
		<p>Multiflex-3 has five layout styles, for 1-column, 2-column and
			3-column pages.</p>
		<p>Multiflex-3 also has seven header layout styles.</p>
		<p>See links in navigation bar for more details.</p>
	</div>
</div>