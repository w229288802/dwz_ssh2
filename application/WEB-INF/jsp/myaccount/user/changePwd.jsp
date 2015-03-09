<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>

<div class="pageContent">
<form method="post" action="/myaccount/user!changePwd.do" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogAjaxDone);">
	<div class="pageFormContent" layouth="50">
		<p>
			<label>
				<s:text name="form.pwd"/>
			</label><input type="password" name="oldPassword" class="required"/>
		</p>
		<p>
			<label>
				<s:text name="form.newPwd"/>
			</label><input type="password" name="password" id="newPassword" class="required"/>
		</p>
		<p>
			<label>
				<s:text name="form.confirmPwd"/>
			</label><input type="password" name="rPassword" class="required" equalTo="#newPassword"/>
		</p>
	</div>
	<div class="formBar">
		<div class="button"><div class="buttonContent"><button type="button" onclick="closeDialog()"><s:text name="button.cancel"/></button></div></div>
		<div class="button"><div class="buttonContent"><button type="submit"><s:text name="button.save"/></button></div></div>
	</div>
</form>
</div>