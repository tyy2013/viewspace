<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/include/head4.jsp"%>
<title>用户管理</title>
	<script>	  
	   function mySubmit(){
	      with(document){
	         return true;
	      }
	      
	   }
	</script>
<script type="text/javascript" src="<%=context %>/js/easyui/datagrid-detailview.js"></script>
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
				<h1 class="pagetitle">用户管理</h1>
	
				<h1 class="block" >管理用户</h1>
				
				<div class="column1-unit">
				<table id="userdg" class="easyui-datagrid" style="width:630;height:auto" 
		    		nowrap="false" fitColumns="false" title=""
		    		url="<%=context%>/user/json//getUserList.do"
		    		data-options="singleSelect:true,collapsible:true,toolbar:toolbar">
		    		
				</table>
				</div>	
				<hr class="clear-contentunit">
			
			</div>

			
		</div>
		<%@ include file="/include/footer.jsp"%>
	</div>
<script type="text/javascript">  
        var toolbar = [{  
            text:'新增',  
            iconCls:'icon-add',  
            handler:function(){window.location.href='<c:url value="/user/add.do"/>'}  
        },{  
            text:'修改',  
            iconCls:'icon-edit',  
            handler:function(){var row = $('#userdg').datagrid('getSelected');
            	if(row == null){
            		alert("请先选择");
            		return;
            	}
            	var editUrl = "<%=context%>"+"/user/"+row.userId+"/edit.do";
            	//alert(editUrl);
            	window.location.href=editUrl;
            	}  
        },'-',{  
            text:'删除',  
            iconCls:'icon-remove',  
            handler:function(){var row = $('#userdg').datagrid('getSelected');
            	if(row == null){
            		alert("请先选择");
            		return;
            	}
            	if(!confirm("确认要删除吗？")) 
            		return; 
            	var url = "<%=context%>"+"/user/"+row.userId+"/delete.do";
            	//alert(url);
            	window.location.href=url;

            	
            }  
        }]; 
        
$('#userdg').datagrid({ 
    width:640,  
    height:'auto',  
    rownumbers:false,  
    remoteSort:false,  
    nowrap:false,  
    fitColumns:false,
    singleSelect:true,collapsible:true,toolbar:toolbar,
    columns:[[  
        {field:'userId',title:'ID',width:50},  
        {field:'userName',title:'名称',width:100,align:'right',sortable:true},  
        {field:'lastIp',title:'地址',width:460,sortable:true}
    ]],  
    view: detailview,  
    detailFormatter: function(rowIndex, rowData){  
        return '<div><p>最后访问时间:'+rowData.lastVisit+'</p></div>';  
    }  
}); 
    </script>
</body>
</html>
