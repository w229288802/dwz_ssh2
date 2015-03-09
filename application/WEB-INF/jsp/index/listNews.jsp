<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>

<section id="content">
	<c:set var="page" value="${empty param.pageNum ? 1 : param.pageNum}"></c:set>
	<pager:info totalItems="${totalCount}" collection="${model.newsList}" numPerPage="${numPerPage}" currentPageNum="${page}" pageNumShown="10">

	<h1>News</h1>

	<c:set var="ulCount" value="5"></c:set>
	<ul>
	<c:forEach items="${model.newsList}" var="item" varStatus="s"> 
		<li>
			<a href="${item.href}" target="_blank">${item.title}</a><span>(<fmt:formatDate value="${item.insertDate}" pattern="dd MMMM yyyy hh:mm"/>)</span>
		</li>
	</c:forEach>
	</ul>
	<div class="listFooter">
		<div class="footerPagination">
			<pager:first>
				<a href="/index!listNews.do?type=${param.type}&pageNum=${firstPage}">First</a>
			</pager:first>

			<pager:previous>
				<a class="previous" href="/index!listNews.do?type=${param.type}&pageNum=${prePage}">Previous</a>
			</pager:previous>
			<pager:pages>
				<a ${page eq pageNum ? "class='selected'":""} href="/index!listNews.do?type=${param.type}&pageNum=${pageNum}">${pageNum}</a>
			</pager:pages>
			<pager:next>
				<a class="next" href="/index!listNews.do?type=${param.type}&pageNum=${nextPage}">Next</a>
			</pager:next>
			<pager:last>
				<a href="/index!listNews.do?type=${param.type}&pageNum=${lastPage}">Last</a>
			</pager:last>
		</div>
	</div>

	</pager:info>
</section>
