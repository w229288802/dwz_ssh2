<%@ include file="/include.inc.jsp" %>
<c:choose>
<c:when test="${empty model.title}"><s:text name="ui.title"/></c:when>
<c:otherwise><c:out value="${model.title}"></c:out></c:otherwise>
</c:choose>