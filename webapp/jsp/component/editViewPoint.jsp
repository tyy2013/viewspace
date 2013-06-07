<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(function() {
		$('#wysiwyg').wysiwyg(
{controls: {
      strikeThrough : { visible : true },
      underline     : { visible : true },
      
      separator00 : { visible : true },
      
      justifyLeft   : { visible : true },
      justifyCenter : { visible : true },
      justifyRight  : { visible : true },
      justifyFull   : { visible : true },
      
      separator01 : { visible : true },
      
      indent  : { visible : true },
      outdent : { visible : true },
      
      separator02 : { visible : false },
      
      subscript   : { visible : false },
      superscript : { visible : false },
      
      separator03 : { visible : false },
      
      undo : { visible : true },
      redo : { visible : true },
      
      separator04 : { visible : true },
      
      insertOrderedList    : { visible : true },
      insertUnorderedList  : { visible : true },
      insertHorizontalRule : { visible : true },
      
      h4mozilla : { visible : true && $.browser.mozilla, className : 'h4', command : 'heading', arguments : ['h4'], tags : ['h4'], tooltip : "Header 4" },
      h5mozilla : { visible : true && $.browser.mozilla, className : 'h5', command : 'heading', arguments : ['h5'], tags : ['h5'], tooltip : "Header 5" },
      h6mozilla : { visible : true && $.browser.mozilla, className : 'h6', command : 'heading', arguments : ['h6'], tags : ['h6'], tooltip : "Header 6" },
      
      h4 : { visible : true && !( $.browser.mozilla ), className : 'h4', command : 'formatBlock', arguments : ['<H4>'], tags : ['h4'], tooltip : "Header 4" },
      h5 : { visible : true && !( $.browser.mozilla ), className : 'h5', command : 'formatBlock', arguments : ['<H5>'], tags : ['h5'], tooltip : "Header 5" },
      h6 : { visible : true && !( $.browser.mozilla ), className : 'h6', command : 'formatBlock', arguments : ['<H6>'], tags : ['h6'], tooltip : "Header 6" },
      
      separator07 : { visible : false },
      
      cut   : { visible : false },
      copy  : { visible : false },
      paste : { visible : false }
    }
  }
  
  	);
  });

	function mySubmit() {
		with (document) {
			var pointName = getElementById("pointName");
			if (pointName.value == null || pointName.value.length == 0) {
				alert("景点名称不能为空，请填上.");
				pointName.focus();
				return false;
			} else if (pointName.value.length > 100) {
				alert("景点名称最大长度不能超过50个字符，请调整.");
				pointName.focus();
				return false;
			}

			/* 	         var ticketPrice = getElementById("ticketPrice");
			 if(ticketPrice.value != null && ticketPrice.value.length > 0){
			 if(!/^(-|\+|([0-9]))([0-9])*\.?([0-9])*$/.test(ticketPrice.value)){
			 alert("景点票价不是合法的数字，请调整.");
			 ticketPrice.focus();
			 return false;
			 }
			 }  */

			return true;
		}

	}
</script>
<h1 class="pagetitle">更改空间要点信息</h1>
<div class="column1-unit">
	<c:if test="${!empty viewPoint}">
		<form action="${context}/vp/${viewPoint.pointId}/update.do"
			method="post" onsubmit="return mySubmit()"
			enctype="multipart/form-data">
			<table border="1px" width="100%">
				<tr>
					<td width="10%">要点名称：</td>
					<td width="90%"><input type="text" name="pointName"
						value="${viewPoint.pointName}" style="width: 100%" /></td>
				</tr>
				<tr>
					<td width="10%">要点备注：</td>
					<td width="90%"><input type="text" name="ticketPrice"
						value="${viewPoint.ticketPrice}" style="width: 100%" /></td>
				</tr>
				<tr>
					<td width="10%">要点简介：</td>
					<td width="90%">
						<textarea name="description" id="wysiwyg"
							style="width: 99%; padding: 1px; height: 400;">${viewPoint.description}</textarea>
					</td>
				</tr>
				<c:if test="${!empty viewPoint.imgFile}">
					<tr>
						<td width="10%">要点图片：</td>
						<td width="90%"><img
							src="<c:url value="/uploads/${viewPoint.imgFile}"/>"></img></td>
					</tr>
					<tr>
						<td width="10%">重新上传：</td>
						<td width="90%"><input type="file" name="imgFile"></td>
					</tr>
				</c:if>
				<c:if test="${empty viewPoint.imgFile}">
					<tr>
						<td width="10%">要点图片：</td>
						<td width="90%"><input type="file" name="imgFile"></td>
					</tr>
				</c:if>

				<tr>
					<td colspan="2" align="center"><input type="submit" value="保存"> <input
						type="reset" value="重置"> <input type="hidden"
						name="spaceId" value="${viewPoint.viewSpace.spaceId}" /></td>
				</tr>
			</table>
		</form>
	</c:if>
	
	<c:if test="${empty viewPoint}">
		<form action="${context}/vp/save.do" method="post"
			onsubmit="return mySubmit()" enctype="multipart/form-data">
			<h3>为空间添加新要点</h3>
			<table border="1px" width="100%">
				<tr>
					<td width="10%">要点名称：</td>
					<td width="90%"><input type="text" name="pointName"
						style="width: 100%" /></td>
				</tr>
				<tr>
					<td width="10%">要点备注：</td>
					<td width="90%"><input type="text" name="ticketPrice"
						style="width: 100%" /></td>
				</tr>
				<tr>
					<td width="10%">要点简介：</td>
					<td width="90%"><textarea name="description" id="wysiwyg"
							style="width: 99%; padding: 1px; height: 400;"></textarea>
						</td>
				</tr>
				<tr>
					<td width="10%">要点图片：</td>
					<td width="90%"><input type="file" name="imgFile"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="保存">
						<input type="reset" value="重置"> <input type="hidden"
						name="spaceId" value="${viewSpace.spaceId}" /></td>
				</tr>
			</table>
		</form>
	</c:if>
</div>
<hr class="clear-contentunit">

