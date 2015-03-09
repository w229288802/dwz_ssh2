<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>


<div id="bread">
	<ul>
		<li><a href="/"><s:text name="ui.home"/></a></li>
		<li><a href="/myaccount/index!overview.do" target="ajax"><s:text name="ui.controlPanel"/></a></li>
		<li><span><s:text name="pc.myaccount.h1"/></span></li>
		<li><span>My Details</span></li>
	</ul>
</div>

<c:import url="/WEB-INF/jsp/myaccount/layout/sidebar.jsp"></c:import>

<div id="mainContent">

<div class="box">
	<div class="box_header">
		<div class="box_header_r">
			<div class="box_header_c">
				<h1>My Details</h1>
			</div>
		</div>
	</div>
	<div class="box_content">
		<div class="box_content_r">
			<div class="box_content_c">
				<div class="box_info_content">


<form method="post" action="/myaccount/user!updUser.do" class="required-validate pageForm" onsubmit="return validateCallback(this);">
	<div class="pageFormContent">
		<p>Welcome to your account information.</p>
		<p class="line"></p>
		
		<p class="title">Contact Details</p>
		<p>
			<label>Accreditation Number</label>
			${contextUser.userName}
		</p>
		<p>
			<label><s:text name="form.title"/></label>
			<select name="title">
				<c:forEach var="item" items="${model.titles}">
				<option value="${item}" ${item eq contextUser.title ? 'selected="selected"' : ''}>${item.name}</option>
				</c:forEach>
			</select>
		</p>
		<p>
			<label><s:text name="form.email"/></label>
			<input type="text" name="email" class="required email" size="30" value="${contextUser.email}"/>
		</p>
		<p>
			<label><s:text name="form.firstName"/></label>
			<input type="text" name="firstName" class="required" size="30" value="${contextUser.firstName}"/>
		</p>
		<p>
			<label><s:text name="form.lastName"/></label>
			<input type="text" name="lastName" class="required" size="30" value="${contextUser.lastName}"/>
		</p>
		<p>
			<label><s:text name="form.postcode"/></label>
			<input type="text" name="postcode" class="required" size="30" value="${contextUser.lastName}"/>
		</p>
		<p>
			<label><s:text name="form.phone"/></label>
			<input type="text" name="phone" class="required" size="30" value="${contextUser.phone}"/>
		</p>
		<p>
			<label><s:text name="form.dob"/></label>
			<input type="text" name="birthDate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${contextUser.birthDate}"/>" class="date"/>
		</p>

		<p class="line"></p>
		<p class="title">
			<s:text name="pc.myaccount.changePassword"/>
		</p>
		<p>
			Please <b><a href="/myaccount/index!changePwd.do" target="dialog">click here</a></b> to Change Password. 
		</p>
	</div>
	
	<div class="subbar">
		<div class="subbar_c">
			<div class="button"><div class="buttonContent"><button type="submit"><s:text name="button.save"/></button></div></div>
			<div class="button"><div class="buttonContent"><button type="button" onclick="toControlPanel()"><s:text name="button.cancel"/></button></div></div>
		</div>
	</div>

</form>

					<div style="clear:both"></div>
				</div>
				<div class="toolsubbar">
					<div class="subbar_c">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="box_footer">
		<div class="box_footer_r">
			<div class="box_footer_c">
			</div>
		</div>
	</div>
</div>

</div>