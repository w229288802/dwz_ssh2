<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<h2 class="contentTitle">Add Category</h2>

<form action="/management/category!insert.do?navTabId=categoryLiNav&callbackType=closeCurrent" method="post" class='required-validate pageForm' onsubmit="return iframeCallback(this, navTabAjaxDone);">

<div class="pageFormContent" layoutH="97">
	<div class="unit">
		<label>Name</label>
		<input type="text" name="category.name" class="textInput required" maxlength="100" />
	</div>
	
	<div class="unit">
		<label>lft</label>
		<input type="text" name="category.lft" class="textInput required" maxlength="50" />
	</div>
	
	<div class="unit">
		<label>rgt</label>
		<input type="text" name="category.rgt" class="textInput required" maxlength="50"></textarea>
	</div>
	<div class="unit">
		<label>Description</label>
		<textarea class="editor" name="category.description" rows="10" cols="80" maxlength="200" tools="simple" ></textarea>
	</div>
	
</div>
<div class="formBar">
	<ul>
		<li><div class="buttonActive"><div class="buttonContent"><button type="submit">Save</button></div></div></li>
		<li><div class="button"><div class="buttonContent"><button type="button" class="close">Close</button></div></div></li>
	</ul>
</div>


</form>