<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<h2 class="contentTitle">Add News</h2>

<form action="/management/news!insert.do?navTabId=newsLiNav&callbackType=closeCurrent" method="post" class='required-validate pageForm' onsubmit="return iframeCallback(this, navTabAjaxDone);">

<div class="pageFormContent" layoutH="97">
	<div class="unit">
		<label>Title</label>
		<input type="text" name="news.title" class="textInput required" maxlength="200" size="100"/>
	</div>
	<div class="unit">
		<label>Type</label>
		<select class="required" name="news.type">
			<option value="">Please Select</option>
			<c:forEach var="item" items="${newsTypes}">
			<option value="${item.id}">${item.name}</option>
			</c:forEach>
		</select>
	</div>
	<div class="unit">
		<label>Content</label>
		<textarea class="editor" name="news.content" rows="10" cols="80" tools="simple"></textarea>
	</div>
</div>
<div class="formBar">
	<ul>
		<li><div class="buttonActive"><div class="buttonContent"><button type="submit">Save</button></div></div></li>
		<li><div class="button"><div class="buttonContent"><button type="button" class="close">Close</button></div></div></li>
	</ul>
</div>


</form>