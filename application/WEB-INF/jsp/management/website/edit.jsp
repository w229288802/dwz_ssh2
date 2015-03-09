<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<h2 class="contentTitle">Home Page &amp; Site Content</h2>

<form action="/management/website!update.do" method="post" class='required-validate pageForm' onsubmit="return validateCallback(this, navTabAjaxDone);">

<div class="pageFormContent" layoutH="94">
	
	<div class="unit">
		<label>Title</label>
		<input type="text" name="website.title" value="${website.title}" class="textInput required" maxlength="100" size="60" />
	</div>
	
	<div class="unit">
		<label>Keywords</label>
		<textarea name="website.metaKeyword" cols="80" maxlength="200">${website.metaKeyword}</textarea>
	</div>
	<div class="unit">
		<label>Description</label>
		<textarea name="website.metaDescription" cols="80" maxlength="200">${website.metaDescription}</textarea>
	</div>

</div>
<div class="formBar">
	<ul>
		<li><div class="buttonActive"><div class="buttonContent"><button type="submit">Save</button></div></div></li>
		<li><div class="button"><div class="buttonContent"><button type="button" class="close">Close</button></div></div></li>
	</ul>
</div>


</form>