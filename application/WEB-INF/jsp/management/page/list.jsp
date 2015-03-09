<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>

<form id="pagerForm" action="/management/page!list.do" method="post">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
</form>

<div class="page">

	<div class="pageHeader">
		<H2>Page Content</H2>
	</div>

	<div class="pageContent">
	
		<div class="panelBar">
			<ul class="toolBar">
				<li><a class="add" rel="pageNav" target="navTab" href="/management/page!add.do" title="Add new Page"><span>Add</span></a></li>
				<li><a class="edit" rel="pageNav" target="navTab" href="/management/page!edit.do?pageId={slt_pageId}" ><span>Edit</span></a></li>
				<li><a class="delete" target="ajaxTodo" href="/management/page!delete.do?pageId={slt_pageId}" title="Are you sure remove?"><span>Remove</span></a></li>
				<li class="line">line</li>
			</ul>
		</div>
		<table class="list" width="100%" layoutH="58">
			<thead>
				<tr>
					<th width="50px"></th>
					<th>Title</th>
					<th width="120px">Name</th>
					<th width="120px">Sequnce</th>
					<th width="120px">Target</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="item" items="${pages}" varStatus="s">
				<tr target="slt_pageId" rel="${item.id}">
					<td>${s.index + 1}</td>
					<td><a rel="pageNav" target="navTab" title="Edit Page" href="/management/page!edit.do?pageId=${item.id}">${item.title}</a></td>
					<td>${item.name}</td>
					<td>${item.sequence}</td>
					<td>${item.targetStr}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>

	</div>
</div>
