<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>

<div id="bread">
	<ul>
		<li><a href="/"><s:text name="ui.home"/></a></li>
		<li><span><s:text name="ui.controlPanel"/></span></li>
	</ul>
</div>

<c:import url="/WEB-INF/jsp/myaccount/layout/sidebar.jsp">
	<c:param name="versionSb" value="1"></c:param>
</c:import>

<div id="mainContent">

	<div class="box">
		<div class="box_header">
			<div class="box_header_r">
				<div class="box_header_c">
					<h1><s:text name="pc.controlPanel.systemNews"/></h1>
				</div>
			</div>
		</div>
		<div class="box_content">
			<div class="box_content_r">
				<div class="box_content_c">
					<div class="box_info_content pageFormContent" style="min-height: 320px">
						<c:forEach var="item" items="${info:news('NOTICE',0,10)}">
						<p class="title"><a href="${item.href}" target="_blank">${item.title}</a> (<fmt:formatDate value="${item.updateDate}" pattern="yyyy-MM-dd"/>)</p>
						</c:forEach>
						
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
