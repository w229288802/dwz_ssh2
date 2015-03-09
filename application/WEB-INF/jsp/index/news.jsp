<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>

<c:set var="prevNews" value="${model.news.prev}"></c:set>
<c:set var="nextNews" value="${model.news.next}"></c:set>

<section id="content">
	<h1>${model.news.title}<span><fmt:formatDate value="${model.news.updateDate}" pattern="yyyy-MM-dd hh:mm:ss"/></span></h1>
	<p class="nextPage">
		<c:if test="${!empty prevNews}">
			<a href="${prevNews.href}">Prev: ${prevNews.title}</a>
		</c:if>
		<c:if test="${!empty nextNews}">
			<a href="${nextNews.href}">Next: ${nextNews.title}</a>
		</c:if>
	</p>
	<div>
		${model.news.content}
	</div>
</section>