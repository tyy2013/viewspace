<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/include/head4.jsp"%>
<title>更改空间内容</title>
<script type="text/javascript">  

        var toolbar = [{  
            text:'新增',  
            iconCls:'icon-add',  
            handler:function(){window.location.href='<c:url value="/vp/<%=viewPoint.pointId%>/add.do"/>'}  
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

			<%@ include file="/include/navigation.jsp"%>
	
			<!-- B.2 MAIN CONTENT -->
			<div class="main-content">
			<!-- Pagetitle -->
	        <h1 class="pagetitle">管理页面</h1>

			<%@ include file="component/editViewSpace.jsp"%>
			
			<h1 class="block">空间要点</h1>

				<div class="column1-unit">

					<div style="margin: 10px 0;"></div>
					<table id="pointdg" class="easyui-datagrid"
						style="width: auto; height: auto" title="空间要点"
						data-options="singleSelect:true,collapsible:true,toolbar:toolbar">
						<!-- 					<tr> -->
						<!-- 						<td colspan="4"> -->
						<!-- 							<div style="float: left">空间要点</div> -->
						<!-- 							<div style="float: right"> -->
						<%-- 								<a href="<c:url value="/vp/${viewSpace.spaceId}/add.do"/>">新增</a> --%>
						<!-- 							</div> -->
						<!-- 						</td> -->
						<!-- 					</tr> -->
						<!-- 					<tr> -->
						<!-- 						<td width="5%">序号</td> -->
						<!-- 						<td width="10%">要点名称</td> -->
						<!-- 						<td width="5%">备注</td> -->

						<!-- 						<td width="5%">操作</td> -->
						<!-- 					</tr> -->
						<thead>
							<tr>
								<th data-options="field:'spaceId'" align="right" width="50">序号</th>
								<th data-options="field:'spaceName'" align="right" width="100">要点名称</th>
								<th data-options="field:'address'" width="50">备注</th>
								<th data-options="field:'description'" width="450">简介</th>
								<!-- 				<th data-options="field:'attr1'" >操作</th> -->
							</tr>
						</thead>
						<tbody>
							<c:forEach var="viewPoint" varStatus="status"
								items="${viewSpace.viewPoints}">

								<form id="form${status.count}" method="post"
									action="${context}/vp/${viewPoint.pointId}/delete.do">
									<tr>
										<td>${status.count}</td>
										<td>${viewPoint.pointName}</td>
										<td>${viewPoint.ticketPrice}</td>

										<td><a
											href="<c:url value="/vp/${viewPoint.pointId}/edit.do"/>">更改</a>
											<input type="hidden" name="_method" value="DELETE" /> <a
											href="javascript:document.getElementById('form${status.count}').submit();">删除</a>
										</td>
									</tr>
								</form>
								<tr>
									<td>简介</td>
									<td colspan="3">${viewPoint.description}</td>
								</tr>
								<c:if test="${!empty viewPoint.imgFile}">
									<tr>
										<td>要点图片</td>
										<td colspan="3"><img
											src="<c:url value="/uploads/${viewPoint.imgFile}"/>"></img></td>
									</tr>
								</c:if>

							</c:forEach>
						</tbody>
					</table>
				</div>

				<hr class="clear-contentunit">
			</div>

			
		</div>
		<%@ include file="/include/footer.jsp"%>
	</div>
</body>
</html>
