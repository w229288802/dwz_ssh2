<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<form id="pagerForm" action="/management/category!list.do" method="post">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
</form>


<div class="page">

	<div class="pageHeader">
		<H2>Category Content</H2>
	</div>

	<div class="pageContent">
	
		<div class="panelBar">
			<ul class="toolBar">
				<li><a class="add" rel="pageNav" target="navTab" href="/management/category!add.do" title="Add new Category"><span>Add</span></a></li>
				<li><a class="edit" rel="pageNav" target="navTab" href="/management/category!edit.do?pageId={slt_pageId}" ><span>Edit</span></a></li>
				<li><a class="delete" target="ajaxTodo" href="/management/category!delete.do?pageId={slt_pageId}" title="Are you sure remove?"><span>Remove</span></a></li>
				<li class="line">line</li>
			</ul>
		</div>
		<table class="list" width="100%" layoutH="58">
			<thead>
				<tr>
					<th width="50px"></th>
					<th width="120px">Name</th>
					<th width="120px">lft</th>
					<th width="120px">rgt</th>
				</tr>
			</thead>
			<tbody>
			
			<c:forEach var="item" items="${categorys}" varStatus="s">
				<tr target="slt_pageId" rel="${item.id}">
					<td>${s.index + 1}</td>
					<td>${item.name}</td>
					<td>${item.lft}</td>
					<td>${item.rgt}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>

	</div>
</div>
