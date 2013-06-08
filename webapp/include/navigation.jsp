
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!-- B.1 MAIN NAVIGATION -->
      <div class="main-navigation">

        <!-- Navigation Level 3 -->
        <div class="round-border-topright"></div>
                            
		<c:if test="${!empty USER_CONTEXT.userName}">
			<h1 class="first">用户</h1>
			
			<div class="manage">
			<dl class="nav3-nobullet">
			
			<dt>	
				<span style="color:#0080FF;font-size:larger;font-weight:bold;">${USER_CONTEXT.userName},欢迎您的到来</span>
			</dt>
			<dt>
					<input type="button" onclick="window.location.href='<c:url value="/login/doLogout.do"/>'" name="logout" class="button" value="注销" />
			</dt>
			<dt>		
					<input type="button" onclick="window.location.href='<c:url value="/admin.do"/>'" name="contenManage" class="button" value="内容管理" />
			</dt>
			<dt>		
					<input type="button" onclick="window.location.href='<c:url value="/showFileManage.do"/>'" name="fileManage" class="button" value="文件管理" />
			</dt>
<%-- 				<a href="<c:url value="/login/doLogout.do"/>">注销</a> --%>
<%-- 				<a href="<c:url value="/admin.do"/>">管理景区</a>管理景区 --%>
			</dl>
			</div>
		</c:if>
                        
        <!-- Login -->
        <c:if test="${empty USER_CONTEXT.userName}">
			<h1 class="first">登录</h1>
			<div class="loginform">
				<form action="${context}/login/doLogin.do" method="post">
					<p>
						<input type="hidden" value="0" name="rememberme">
					</p>
					<fieldset>
						<p>
						<br/>
							<label class="top" for="username_2">用户名</label><br> <input
								type="text" value=""
								class="field" tabindex="1" id="userName" name="userName">
						</p>
						<p>
							<label class="top" for="password_2">密码</label><br> <input
								type="password" value=""
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

        <!-- Search form -->                  
        <h1>Search</h1>
        <div class="searchform">
          <form action="index.html" method="get">
            <fieldset>
              <input name="field" class="field"  value=" Search..." />
              <input type="submit" name="button" class="button" value="GO!" />
            </fieldset>
          </form>
        </div>
	<c:if test="${!empty viewSpace}">
		<h1>内容导航</h1>
		<!-- Navigation with grid style -->
	<dl class="nav3-grid">
		<c:forEach var="viewPoint" varStatus="status"
			items="${viewSpace.viewPoints}">
			<dt>
				<a href="#"> ${viewPoint.pointName} </a>
			</dt>
		</c:forEach>
	</dl>
	</c:if>
</div>
