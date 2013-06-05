<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
		<title>光纤通信技术和网络国家重点实验室</title>
		<%@ include file="/include/head4.jsp"%>
	<script type="text/javascript">  
        var toolbar = [{  
            text:'新增',  
            iconCls:'icon-add',  
            handler:function(){window.location.href='<c:url value="/vs/add.do"/>'}  
        },{  
            text:'修改',  
            iconCls:'icon-edit',  
            handler:function(){var row = $('#spacedg').datagrid('getSelected');
            	if(row == null){
            		alert("请先选择");
            		return;
            	}
            	//alert(row.spaceId); 
            	var editUrl = "<%=context%>"+"/vs/"+row.spaceId+"/edit.do";
            	//alert(editUrl);
            	window.location.href=editUrl;
            	}  
        },'-',{  
            text:'删除',  
            iconCls:'icon-remove',  
            handler:function(){var row = $('#spacedg').datagrid('getSelected');
            	if(row == null){
            		alert("请先选择");
            		return;
            	}
            	//alert(row.spaceId); 
            	var url = "<%=context%>"+"/vs/"+row.spaceId+"/delete.do";
            	//alert(url);
            	window.location.href=url;

            	
            }  
        }];  

    </script>
</head>
<body>
 <!-- Main Page Container -->
  <div class="page-container">
	<%@ include file="/include/top.jsp"%>
		 
		 <!-- B. MAIN -->
    	<div class="main">
    	<%@ include file="/include/navigation.jsp" %>
    	
    	<div class="main-content">
    	<h1 class="pagetitle">内容管理</h1>
    	
        <h1 class="block" >管理空间</h1>
    	<div class="column1-unit">
    	
    	<div style="margin:10px 0;"></div>
    	
    	<table id="spacedg" class="easyui-datagrid" style="width:auto;height:auto" title="管理空间"
    		data-options="singleSelect:true,collapsible:true,toolbar:toolbar">
    	
<!-- 			<tr><th colspan="4" ><div style="float: right"> -->
<%-- 			<a href="<c:url value="/vs/add.do"/>">新增空间</a></div> --%>
<!-- 			</th></tr> -->
			 <thead>
			<tr>
				<th data-options="field:'spaceId'" align="right" width="50">空间ID</th>
				<th data-options="field:'spaceName'"align="right" width="100">空间名</th>
				<th data-options="field:'address'" width="50">所在地</th>
				<th data-options="field:'description'" width="auto">简介</th>
<!-- 				<th data-options="field:'attr1'" >操作</th> -->
			</tr>
			</thead>
			<tbody>
			<c:forEach var="viewSpace" items="${viewSpaces}" varStatus="status">
<%-- 				<form id="form${status.count}" method="post" action="${context}/vs/${viewSpace.spaceId}/delete.do"> --%>
				<tr>
					<td>${viewSpace.spaceId}</td>
					<td>
						<a href="<c:url value="/vs/${viewSpace.spaceId}.do"/>">
						   ${viewSpace.spaceName}
						</a>
					</td>
					<td>${viewSpace.address}</td>
					<td>${viewSpace.description}</td>
<!-- 					<td> -->
<%-- 					   <a href="<c:url value="/vs/${viewSpace.spaceId}/edit.do"/>">更改</a> --%>
<!-- 					   <input type="hidden" name="_method" value="DELETE" /> -->
<%-- 					   <a href="javascript:document.getElementById('form${status.count}').submit();">删除</a> --%>
<!-- 					</td>					 -->
				</tr>
<!-- 				</form> -->
			</c:forEach>

			</tbody>
		</table>
		
		</div>
		
		</div>
		</div>
		<%@ include file="/include/footer.jsp" %>
	</div>
</body>
</html>
