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
				width: 200px;
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
				alert(file);
				
				$.get("t.jsp?filepath="+file,function(data,status){
				    //alert("Data: " + data + "\nStatus: " + status);
				});
				// $.post("d.jsp",{filepath:file},function(data,status){});
			}
			/* function downloadFile(url){
				  var elemIF = document.createElement("iframe");
				  elemIF.src = url;
				  elemIF.style.display = "none";
				  document.body.appendChild(elemIF);
				} */
			
			$(document).ready(function() {

				$('#fileTreeDemo_1').fileTree({
					root : 'D:/apache-tomcat-7.0.27/wtpwebapps/viewspace/uploads/',
					script : 'connectors/jqueryFileTree.jsp'
				}, function(file) {
					openFile(file);
				});



				$('#fileTreeDemo_2').fileTree({
					root : 'D:/apache-tomcat-7.0.27/wtpwebapps/viewspace/',
					script : 'connectors/jqueryFileTree.jsp',
					folderEvent : 'dblclick',
					expandSpeed : 750,
					collapseSpeed : 750,
					expandEasing : 'easeOutBounce',
					collapseEasing : 'easeOutBounce',
					loadMessage : 'Loading...',
					multiFolder : false
				}, function(file) {
					alert(file);
				});

			});
		</script>

	</head>
	
	<body>
		
		<h1>jQuery File Tree Demo</h1>
		<p>
			Feel free to view the source code of this page to see how the file tree is being implemented.
		</p>
		<form action="<c:url value="/download.do"/>" method="get" />
		<div class="example">
			<h2>Default options</h2>
			<div id="fileTreeDemo_1" class="demo"></div>
		</div>
		
		<div class="example">
			<h2>multiFolder = false</h2>
			<div id="fileTreeDemo_2" class="demo"></div>
		</div>
		
		<div class="example">
			<h2>Custom load message &amp; easing</h2>
			<div id="fileTreeDemo_3" class="demo"></div>
		</div>
		
		<div class="example">
			<h2>Double click &amp; no animation</h2>
			<div id="fileTreeDemo_4" class="demo"></div>
		</div>
		
	</body>
	
</html>