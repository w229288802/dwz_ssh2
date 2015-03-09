<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:forTokens items="${param.dwzcss}" delims="|" var="tech">
<link href="css/${tech}.css" rel="stylesheet" type="text/css" />
</c:forTokens>