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
			<dd>
				<input type="button" onclick="window.location.href='<c:url value="/login/doLogout.do"/>'" name="logout" class="button" value="注销" />	
				<input type="button" onclick="window.location.href='<c:url value="/admin/shareFilePage.do"/>'" name="fileManage" class="button" value="文件管理" />
			</dd>
			<c:if test="${USER_CONTEXT.userName=='admin'}">
			<dd>		
				<input type="button" onclick="window.location.href='<c:url value="/admin.do"/>'" name="contentManage" class="button" value="内容管理" />	
				<input type="button" onclick="window.location.href='<c:url value="/user/admin.do"/>'" name="userManage" class="button" value="用户管理" />
			</dd>
			</c:if>
<%-- 				<a href="<c:url value="/login/doLogout.do"/>">注销</a> --%>
<%-- 				<a href="<c:url value="/admin.do"/>">管理景区</a>管理景区 --%>
			</dl>
			</div>
		</c:if>
                        
        <!-- Login -->
        <c:if test="${empty USER_CONTEXT.userName}">
			<h1 class="first">用户登录</h1>
			<div class="loginform">
				<form action="${context}/login/doLogin.do" name="logonUser" method="post">
					<p>
						<input type="hidden" value="0" name="rememberme">
					</p>
					<fieldset>
						<p>
						<br/>
							<label class="top" for="userName">用户名</label><br> 
							<input type="text" value=""
								class="field" tabindex="1" id="userName" name="userName">
						</p>
						<p>
							<label class="top" for="password">密码</label><br> 
							<input type="password" value=""
								class="field" tabindex="2" id="password" name="password">
						</p>
						<p>
							<input type="checkbox" onclick="webLoginCheckRemember()" value=""
								size="1" tabindex="3" class="checkbox" id="checkbox_2"
								name="checkbox">
							<label class="right" for="checkbox_1">Remember me</label>
						</p>
						<p>
							<input type="submit" value="LOGIN" class="button"
								name="cmdweblogin">
						</p>
<!-- 						<p> -->
<!-- 							<a id="forgotpsswd_2" onclick="webLoginShowForm(2);return false;" -->
<!-- 								href="#">Password forgotten?</a> -->
<!-- 						</p> -->
					</fieldset>
				</form>
			</div>
		</c:if>

        <!-- Search form -->                  
        <h1>搜索</h1>
        <div class="searchform">
          <form action="${context}/search.do" method="post">
            <fieldset>
              <input name="spaceName" class="field"  value="搜索空间" />
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
	
	<h1>邮箱登录</h1>
			<div class="loginform">
				<form onsubmit="return(formsubmit());" name="loginEmail" method="post">
					<p>
						

					</p>
					<fieldset>
						<p>
						<br/>
							<label class="top" for="username">用户名</label><br> <input
								type="text" value=""
								class="field" tabindex="4" name="username">@wri.com.cn
							<input type="hidden" value="wri.com.cn" name="logindomain">
							<input type="hidden" value="1" name="sameip">
						</p>
						<p>
							<label class="top" for="password">密码</label><br> <input
								type="password" value=""
								class="field" tabindex="5" name="password">
						</p>
						<p>
							<input type="checkbox" value=""
								size="1" tabindex="6" class="checkbox" 
								name="sslchk" checked>	
							<label class="right" for="sslchk">加密传送用户名和口令</label>
						</p>
						<p>
							<input type="submit" value="LOGIN" class="button"
								name="maillogin">
						</p>
<!-- 						<p> -->
<!-- 							<a id="forgotpsswd_2" onclick="webLoginShowForm(2);return false;" -->
<!-- 								href="#">Password forgotten?</a> -->
<!-- 						</p> -->
					</fieldset>
				</form>
			</div>
			
        <h1>员工之窗</h1>
        <dl class="nav3-bullet">
         <dt><a href="http://intra.wri.com.cn/news/shownews.asp?newsid=2141">武汉市医疗保险常见问题 </a></dt>
		 <dt><a href="http://intra.wri.com.cn/file/%E9%82%AE%E7%A7%91%E9%99%A2%E6%9C%8D%E5%8A%A1%E6%89%8B%E5%86%8C6.11.doc">邮科院补充医疗服务手册 </a></dt>
		 <dt><a href="http://cs.taikang.com:2008/qrybonus/Pages/index.jsp">泰康人寿医保查询 </a></dt>
		 <dt><a href="http://intra.wri.com.cn/news/shownews.asp?newsid=4076">烽火班车线路 </a></dt>
		 <dt><a href="http://www.wuhanbus.com/Services/Line/LineList.aspx">公交查询 </a></dt>
		 <dt><a href="http://intra.wri.com.cn/file/recipe.xls">烽火职工食堂菜谱 </a></dt>
		 <dt><a href="http://intra.wri.com.cn/member/index.asp">集团电话查询 </a></dt>
		</dl>
		
        <h1>内部链接</h1>
        <dl class="nav3-bullet">
          <dt><a href="http://intra.wri.com.cn/yb/">综合办公信息服务平台 </a></dt>
          <dt><a href="http://intra.wri.com.cn/department/qygl/index.htm">企业管理</a></dt>
          <dt><a href="http://intra.wri.com.cn/department/kejifz/kejifz.asp">科技发展 </a></dt>
          <dt><a href="http://intra.wri.com.cn/department/cw.asp">财务管理</a></dt>
          <dt><a href="http://intra.wri.com.cn/department/fz.asp">发展策划</a></dt>
          <dt><a href="http://intra.wri.com.cn/department/HR.asp">人力资源</a></dt>
          <dt><a href="http://intra.wri.com.cn/department/HR.asp">工会</a></dt>                        
        </dl>

<script language="JavaScript" type="text/javascript">
function formsubmit(){
	var eform = document.loginEmail;
	if (eform.username.value.length == 0) {
		alert("请填写您的信箱名，谢谢！");
		eform.username.focus();
		return false;
	}
	if (eform.password.value.length == 0) {
		alert("请填写您的口令，谢谢！");
		eform.password.focus();
		return false;
	}
	if (eform.sslchk.checked) {
		eform.action = "https://mail.wri.com.cn/cgi-bin/eqwebmail";
	} else {
		eform.action = "http://mail.wri.com.cn/cgi-bin/eqwebmail";
	}
	return true;
}
</script>       
</div>
