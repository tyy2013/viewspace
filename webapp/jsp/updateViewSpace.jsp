<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/include/head4.jsp"%>
<title>${viewForm.viewSpace.spaceName}</title>
<script>
	   function mySubmit(){
	      with(document){
	         var spaceName = getElementById("spaceName");
	         if(spaceName.value == null || spaceName.value.length ==0){
	            alert("景区名称不能为空，请填上.");
	            spaceName.focus();
	            return false;
	         }else if(spaceName.value.length > 50){
	            alert("景区名称最大长度不能超过50个字符，请调整.");
	            spaceName.focus();
	            return false;
	         }
	          
	         var address = getElementById("address");
	         if(address.value == null || address.value.length==0){
	            alert("景区地址不能为空，请填上.");
	            address.focus();
	            return false;
	         }else if(address.value.length > 50){
	            alert("景区名称最大长度不能超过150个字符，请调整.");
	            address.focus();
	            return false;
	         }
	         
	         var website = getElementById("website");
	         if(website.value != null){
	            if(website.value.length > 100){
	               alert("网址的长度不能超过100个字符。");
	               website.focus();
	               return false;
	            }else if(website.value.toUpperCase().indexOf("HTTP://") != 0){
				   alert("网址必须以http://开头。");
				   website.focus();
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
		<!-- Pagetitle -->
        <h1 class="pagetitle">管理页面</h1>

 		<h1 class="block"> Contact form</h1>
				<div class="column1-unit">
					<div class="contactform">
						<form method="post"
							action="${context}/vs/${viewSpace.spaceId}/update.do"
							onsubmit="return mySubmit()">
							<fieldset>
								<legend>&nbsp;${viewSpace.spaceName} CONTENT&nbsp;</legend>

								<p>
									<label for="spaceName" class="left">SpaceName:</label> <input
										type="text" name="spaceName" value="${viewSpace.spaceName}"
										class="field" value="" tabindex="1" />
								</p>
								<p>
									<label for="address" class="left">Address:</label> <input
										type="text" name="address" value="${viewSpace.address}"
										class="field" value="" tabindex="2" />
								</p>
								<p>
									<label for="website" class="left">Website:</label> <input
										type="text" name="website" value="${viewSpace.website}"
										class="field" value="" tabindex="3" />
								</p>
								<p>
									<label for="description" class="left">Description:</label> 
									<textarea name="description" 
										tabindex="4" style="padding:2px;">${viewSpace.description}</textarea>
									
								</p>
								<p>
									<input type="submit" name="submit" id="submit" class="button"
										value="保存" tabindex="5"> <input type="reset"
										value="重置" class="button" tabindex="6"> <input
										type="hidden" name="wantNum" value="${viewSpace.wantNum}" />
									<input type="hidden" name="beenNum"
										value="${viewSpace.beenNum}" /> <input type="hidden"
										name="notwantNum" value="${viewSpace.notwantNum}" /> <input
										type="hidden" name="_method" value="PUT"> <input
										type="hidden" name="spaceId" value="${viewSpace.spaceId}" />
								</p>
							</fieldset>
						</form>
					</div>
				</div>
				
				<div class="column1-unit">
				<table width="100%">
						<tr>
							<td colspan="4">
								<div style="float: left">景区景点</div>
								<div style="float: right">
									<a href="<c:url value="/vp/${viewSpace.spaceId}/add.do"/>">新增</a>
								</div>
							</td>
						</tr>
						<tr>
							<td width="5%">序号</td>
							<td width="10%">景点名</td>
							<td width="5%">票价(元)</td>
							
							<td width="5%">操作</td>
						</tr>
						
						<c:forEach var="viewPoint" varStatus="status"
							items="${viewSpace.viewPoints}">
						
						<form id="form${status.count}" method="post"
											action="${context}/vp/${viewPoint.pointId}/delete.do">
							<tr>
								<td>${status.count}</td>
								<td>${viewPoint.pointName}</td>
								<td>${viewPoint.ticketPrice}</td>
								
								<td><a
									href="<c:url value="/vp/${viewPoint.pointId}/edit.do"/>">更改</a> <input
									type="hidden" name="_method" value="DELETE" /> <a
									href="javascript:document.getElementById('form${status.count}').submit();">删除</a>
								</td>
							</tr>
						</form>
							<tr><td>简介</td><td colspan="3"> ${viewPoint.description}</td>
							</tr>
							<c:if test="${!empty viewPoint.imgFile}">
								<tr>
									<td>景区图片</td>
									<td colspan="3"><img
										src="<c:url value="/uploads/${viewPoint.imgFile}"/>"></img>
									</td>
								</tr>
							</c:if>
							
						</c:forEach>
					</table>
				</div>

			</div>

			<%@ include file="/include/right.jsp"%>
		</div>
		<%@ include file="/include/footer.jsp"%>
	</div>
</body>
</html>
