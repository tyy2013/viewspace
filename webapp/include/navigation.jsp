
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
					<input type="button" onclick="window.location.href='<c:url value="/managevs.do"/>'" name="contenManage" class="button" value="内容管理" />
			</dt>
			<dt>		
					<input type="button" onclick="window.location.href='<c:url value="/jsp/shareFile.jsp"/>'" name="fileManage" class="button" value="文件管理" />
			</dt>
<%-- 				<a href="<c:url value="/login/doLogout.do"/>">注销</a> --%>
<%-- 				<a href="<c:url value="/vs/index.do"/>">管理景区</a>管理景区 --%>
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

        <!-- Text formats -->
        <h1>Heading h1</h1>
        <h2>Heading h2</h2>
        <h3>Heading h3</h3>

        <h3>Paragraph text</h3>
        <p>Lorem ipsum dolor sit amet, consectetur elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>

        <h3>Bulleted list</h3>
        <ul>
          <li><a href="#">Link 1</a></li>
          <li><a href="#">Link 2</a></li>
          <li>Fact 1</li>
          <li>Fact 2</li>                            
        </ul>

        <h3>Ordered list</h3>
        <ol>
          <li><a href="#">Link 1</a></li>
          <li><a href="#">Link 2</a></li>
          <li>Fact 1</li>
          <li>Fact 2</li>                           
        </ol>

        <h3>Text orientation</h3>
        <p>Text left.</p>
        <p class="center">Text center.</p>
        <p class="right">Text right.</p>

        <h3>Image<br />(text align left)</h3>
        <p><img src="<c:url value="/img/image.jpg"/>" width="50" alt="Image description" title="Image title" />Here is place for text.</p>
        <p><img class="center" src="<c:url value="/img/image.jpg"/>" width="50" alt="Image description" title="Image title" /></p>
        <p><img class="right" src="<c:url value="/img/image.jpg"/>" width="50" alt="Image description" title="Image title" />Here is place for text.</p>

        <h3>Image<br />(text align right)</h3>
        <p class="right"><img src="<c:url value="/img/image.jpg"/>" width="50" alt="Image description" title="Image title" />Here is place for text.</p>
        <p class="right"><img class="center" src="<c:url value="/img/image.jpg"/>" width="50" alt="Image description" title="Image title" /></p>
        <p class="right"><img class="right" src="<c:url value="/img/image.jpg"/>" width="50" alt="Image description" title="Image title" />Here is place for text.</p>

        <!-- Image Links -->
        <h3>Text link</h3>
        <p><a href="#">Here is a link.</a></p>

        <!-- Image Links -->
        <h3>Image link</h3>
        <p><a href="#"><img src="<c:url value="/img/image.jpg"/>" width="50" alt="Image description" title="Image title" /></a>Text as in image sections above.</p>
        <p class="center"><a href="#"><img class="center" src="<c:url value="/img/image.jpg"/>" width="50" alt="Image description" title="Image title" /></a></p>
        <p><a href="#"><img class="right" src="<c:url value="/img/image.jpg"/>" width="50" alt="Image description" title="Image title" /></a>Text as in image sections above.</p>     
      </div>
