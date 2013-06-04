<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<title>jQuery File Tree Demo</title>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		
		<style type="text/css">
			BODY,
			HTML {
				padding: 0px;
				margin: 0px;
			}
			BODY {
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-size: 11px;
				background: #EEE;
				padding: 15px;
			}
			
			H1 {
				font-family: Georgia, serif;
				font-size: 20px;
				font-weight: normal;
			}
			
			H2 {
				font-family: Georgia, serif;
				font-size: 16px;
				font-weight: normal;
				margin: 0px 0px 10px 0px;
			}
			
			.example {
				float: left;
				margin: 15px;
			}
			
			.demo {
				width: 500px;
				height: 400px;
				border-top: solid 1px #BBB;
				border-left: solid 1px #BBB;
				border-bottom: solid 1px #FFF;
				border-right: solid 1px #FFF;
				background: #FFF;
				overflow: scroll;
				padding: 5px;
			}
			
		</style>
		
		<script src="jquery.min.js" type="text/javascript"></script>
		<script src="jquery.easing.min.js" type="text/javascript"></script>
		<script src="jqueryFileTree.js" type="text/javascript"></script>
		<link href="jqueryFileTree.css" rel="stylesheet" type="text/css" media="screen" />
		
		<script type="text/javascript">
			
			function openFile(file) {
			    // do something with file
			    alert(file);
			    //window.open("<c:url value="/download.do"/>?filepath="+file);
			    window.location.href="<c:url value="/download.do"/>?filepath="+file;
			}
			
			function downloadFile(file) {
				window.location.href="<c:url value="/downloadFile.do"/>?filepath="+file;			
			}
			
			$(document).ready(function() {

				$('#fileTreeDemo_1').fileTree({
					//root : 'D:/apache-tomcat-7.0.27/wtpwebapps/viewspace/uploads/',
					root:'<%=request.getServletContext().getRealPath("/")%>+uploads/',
					script : 'connectors/jqueryFileTree.jsp'
				}, function(file) {
					openFile(file);
				});



				$('#fileTree').fileTree({
					root : 'D:/apache-tomcat-7.0.27/wtpwebapps/viewspace/uploads/',
					script : 'connectors/jqueryFileTree.jsp',
					folderEvent : 'dblclick',
					expandSpeed : 750,
					collapseSpeed : 750,
					expandEasing : 'easeOutBounce',
					collapseEasing : 'easeOutBounce',
					loadMessage : 'Loading...',
					multiFolder : false
				}, function(file) {
					downloadFile(file);
				});

			});
		</script>

	</head>
	
	<body>
		<div class="example">
			<h1>用户文件列表</h1>
			<div id="fileTree" class="demo"></div>
		</div>
				
	</body>
	
</html>