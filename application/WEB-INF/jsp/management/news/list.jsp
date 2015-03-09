<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<form id="pagerForm" method="post" action="/management/news!list.do">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
</form>

<form method="post" rel="pagerForm" action="/management/news!list.do" onsubmit="return navTabSearch(this)">
<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				<label>Keywords：</label>
				<input type="text" name="keywords" value="${param.keywords}"/>
			</li>
			<li>
				<label>Type：</label>
				<select name="type">
					<option value="">All</option>
					<c:forEach var="item" items="${newsTypes}">
					<option value="${item}" ${item.id eq param.newsType ? 'selected="selected"' : ''}>${item.name}</option>
					</c:forEach>
				</select>
			</li>
			
		</ul>
		<div class="subBar">
			<span style="margin-left: 5px; line-height: 25px; float: left">Matching Records Found: <strong>${totalCount}</strong></span>
			<ul>						
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">Search</button></div></div></li>
			</ul>
		</div>
	</div>
</div>
</form>

<div class="pageContent">

	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" target="navTab" rel="newsNav" href="/management/news!add.do" title="Add News"><span>Add</span></a></li>
			<li><a class="edit" target="navTab" rel="newsNav" href="/management/news!edit.do?newsId={slt_newsId}" title="Edit News"><span>Edit</span></a></li>
			<li><a class="delete" target="ajaxTodo" href="/management/news!delete.do?newsId={slt_newsId}" title="Are you sure remove?"><span>Remove</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table class="list" width="100%">
		<thead>
			<tr>
				<th width="50px"></th>
				<th>Title</th>
				<th width="140px">Date</th>
				<th width="100px">Type</th>
				<th width="100px">Status</th>
				<th width="100px">Operate</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${newsList}" varStatus="s">
			<tr target="slt_newsId" rel="${item.id }">
				<td>${s.index + 1}</td>
				<td><a rel="newsNav" target="navTab" title="Edit News" href="/management/news!edit.do?newsId=${item.id}">${item.title}</a></td>
				<td><fmt:formatDate value="${item.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${item.type.name}</td>
				<td>${item.status.name}</td>
				<td>
					<c:choose>
						<c:when test="${item.status eq 'PENDING' or item.status eq 'DISABLED'}">
							<a class="button" target="ajaxTodo" href="/management/news!publish.do?newsId=${item.id}"><span>Publish</span></a>
						</c:when>
						<c:when test="${item.status eq 'ACTIVE'}">
							<a class="button" target="ajaxTodo" href="/management/news!disable.do?newsId=${item.id}"><span>Disable</span></a>
						</c:when>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

</div>