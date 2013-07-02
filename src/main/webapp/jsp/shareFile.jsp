<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/include/head4.jsp"%>
<title>文件共享</title>
	<script>	  
	   function mySubmit(){
	      with(document){
          
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

			<%@ include file="/include/navigation.jsp"%>

			
			<!-- B.2 MAIN CONTENT -->
			<div class="main-content">
			<h1 class="pagetitle">文件共享</h1>

			<h1 class="block" >上传文件</h1>
			
			<div class="column1-unit">
				<div id="uploadfile" class="contactform">
				<form action="${context}/admin/uploadFile.do" method="post" onsubmit="return mySubmit()" enctype="multipart/form-data" >
					<fieldset>
					<legend>&nbsp;上传文件&nbsp;</legend>
					
					<p>
						<label for="description" class="left">文件简介:</label> 
						<input type="text" name="description" class="field" value="" tabindex="1" />
					</p>
					<p>
						<label for="file" class="left">文件路径:</label> 
						<input type="file" name="file" alt="文件大小不能超过10M"
							class="field" value="" tabindex="2" />
					</p>
					<p>	
					<label>&nbsp;&nbsp;&nbsp;上传到共享文件夹:</label>
					<input type="checkbox" name="share" value="true">
					</p>	
					<p>
						<input type="submit" name="submit" id="submit" class="button"
							value="上传" tabindex="3"> 
						<input type="reset" value="重置"
							class="button" tabindex="4"> 
								
					</p>
					</fieldset>
				</form>
				</div>
			</div>
			<hr class="clear-contentunit">
			
			<h1 class="block" >下载文件</h1>
			<div class="column1-unit">
				<div id="filetree">
					<iframe src="<c:url value="/filetree/fs.jsp"/>"   name="mainFrame" frameborder="0" marginheight="1" marginwidth="1" height="500" width="100%"></iframe>
				</div>
			</div>
			<hr class="clear-contentunit">
		</div>

			
		</div>
		<%@ include file="/include/footer.jsp"%>
	</div>
</body>
</html>
