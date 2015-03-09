<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:forTokens items="${param.dwzjs}" delims="|" var="tech">
<script src="js/${tech}.js" type="text/javascript"></script>
</c:forTokens>