<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>title</title>
<%@ include file="/include/head4.jsp"%>
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
				<!-- Pagetitle -->
				<h1 class="pagetitle">main-content</h1>

				<!-- Content unit - One column -->
				<div class="main-content">
					<table class="easyui-datagrid" title="DataGrid with Toolbar" style="width:600px;height:250px"  
            data-options="rownumbers:true,singleSelect:true,url:'../js/datagrid_data1.json',toolbar:toolbar">  
        <thead>  
            <tr>  
                <th data-options="field:'itemid',width:80">Item ID</th>  
                <th data-options="field:'productid',width:100">Product</th>  
                <th data-options="field:'listprice',width:80,align:'right'">List Price</th>  
                <th data-options="field:'unitcost',width:80,align:'right'">Unit Cost</th>  
                <th data-options="field:'attr1',width:240">Attribute</th>  
                <th data-options="field:'status',width:60,align:'center'">Status</th>  
            </tr>  
        </thead>  
    </table>  
    <script type="text/javascript">  
        var toolbar = [{  
            text:'Add',  
            iconCls:'icon-add',  
            handler:function(){alert('add')}  
        },{  
            text:'Cut',  
            iconCls:'icon-cut',  
            handler:function(){alert('cut')}  
        },'-',{  
            text:'Save',  
            iconCls:'icon-save',  
            handler:function(){alert('save')}  
        }];  
    </script>  
				</div>
			</div>

		</div>
		<%@ include file="/include/footer.jsp"%>
	</div>
</body>
</html>
