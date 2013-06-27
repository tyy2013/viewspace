<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>光纤通信技术和网络国家重点实验室</title>
		<%@ include file="/include/head4.jsp"%>
<script type="text/javascript" src="<%=context %>/js/easyui/datagrid-detailview.js"></script>		
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
    	
    	<table id="spacedg" class="easyui-datagrid" style="width:630;height:auto" 
    		title="管理空间" nowrap="false" fitColumns="false"
    		url="<%=context%>/getViewSpaceList.do"
    		data-options="singleSelect:true,collapsible:true,toolbar:toolbar">
    	
<!-- 			<tr><th colspan="4" ><div style="float: right"> -->
<%-- 			<a href="<c:url value="/vs/add.do"/>">新增空间</a></div> --%>
<!-- 			</th></tr> -->
<!-- 			 <thead> -->
<!-- 			<tr> -->
<!-- 				<th data-options="field:'spaceId'" align="right" width="50">空间ID</th> -->
<!-- 				<th data-options="field:'spaceName'"align="right" width="100">空间名</th> -->
<!-- 				<th data-options="field:'address'" width="50">所在地</th> -->
<!-- 				<th data-options="field:'description'" width="430">简介</th> -->

<!-- 			</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<%-- 			<c:forEach var="viewSpace" items="${viewSpaces}" varStatus="status"> --%>
<%-- 				<form id="form${status.count}" method="post" action="${context}/vs/${viewSpace.spaceId}/delete.do"> --%>
<!-- 				<tr> -->
<%-- 					<td>${viewSpace.spaceId}</td> --%>
<!-- 					<td> -->
<%-- 						<a href="<c:url value="/vs/${viewSpace.spaceId}.do"/>"> --%>
<%-- 						   ${viewSpace.spaceName} --%>
<!-- 						</a> -->
<!-- 					</td> -->
<%-- 					<td>${viewSpace.address}</td> --%>
<%-- 					<td>${viewSpace.description}</td> --%>
<!-- 					<td> -->
<%-- 					   <a href="<c:url value="/vs/${viewSpace.spaceId}/edit.do"/>">更改</a> --%>
<!-- 					   <input type="hidden" name="_method" value="DELETE" /> -->
<%-- 					   <a href="javascript:document.getElementById('form${status.count}').submit();">删除</a> --%>
<!-- 					</td>					 -->
<!-- 				</tr> -->
<!-- 				</form> -->
<%-- 			</c:forEach> --%>

<!-- 			</tbody> -->
		</table>
		
		</div>
		
		</div>
		</div>
		<%@ include file="/include/footer.jsp" %>
	</div>
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
            	if(!confirm("确认要删除吗？")) 
            		return;
            	var url = "<%=context%>"+"/vs/"+row.spaceId+"/delete.do";
            	//alert(url);
            	window.location.href=url;			
            	
            }  
        }]; 
        
$('#spacedg').datagrid({
     title:'管理空间',  
    width:640,  
    height:'auto',  
    rownumbers:false,  
    remoteSort:false,  
    nowrap:false,  
    fitColumns:false,
    singleSelect:true,collapsible:true,toolbar:toolbar,
     url:'<%=context%>/getViewSpaceList.do' ,
     columns:[[  
        {field:'spaceId',title:'空间ID',width:50},  
        {field:'spaceName',title:'空间名',width:100,align:'right',sortable:true},  
        {field:'address',title:'地址',width:460,sortable:true}
    ]],  
    view: detailview,  
    detailFormatter: function(rowIndex, rowData){  
        return '<div><p>简介:'+rowData.description+'</p></div>';  
    }  
}); 
    </script>
</body>
</html>
