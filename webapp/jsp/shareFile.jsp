<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
			
			<div id="uploadfile">
			<form action="${context}/uploadFile.do" method="post" onsubmit="return mySubmit()" enctype="multipart/form-data" >
				<div>文件共享</div>
				<table border="1px" width="100%">
						
				<tr>
					<td width="20%">文件简介：</td>
					<td width="80%"><input type="text" name="description" style="width:100%"/></td>
				</tr>
				<tr>
					<td width="20%">文件路径：</td>
					<td width="80%"><input type="file" name=file></td>
				</tr>	
				<tr>
					<td colspan="2" align="center">
					   <input type="submit" value="上传">
					   <input type="reset" value="重置">
					</td>
				</tr>
				</table>
			</form>
			</div>
			<div id="filetree">
				<iframe src="<c:url value="/filetree/fs.jsp"/>"   name="mainFrame" frameborder="0" marginheight="0" marginwidth="0" height="700" width="100%"></iframe>
			</div>
			
		</div>

			
		</div>
		<%@ include file="/include/footer.jsp"%>
	</div>
</body>
</html>
