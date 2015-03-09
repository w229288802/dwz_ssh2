<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><decorator:title/><c:import url="/WEB-INF/jsp/layout/title.inc.jsp" charEncoding="UTF-8"/></title>
<c:import url="/WEB-INF/jsp/layout/meta.inc.jsp" charEncoding="UTF-8"/>

<link href="/styles/www/themes/css/core.css" rel="stylesheet" />
<link href="/styles/www/themes/default/style.css" rel="stylesheet" />
<!--[if IE]>
<link href="/styles/www/themes/css/ieHack.css" rel="stylesheet" />
<script src="/styles/www/js/html5.js"></script>
<![endif]-->
<script src="/styles/www/js/import.js"></script>
<decorator:head/>
</head>
<body id="body" class="home">
<c:import url="/WEB-INF/jsp/layout/header.jsp" charEncoding="UTF-8"/>
<c:if test="${not empty param.dwzBanner}">
<section id="banner">
	<figure>
		<img src="/styles/www/themes/default/images/banner.jpg" alt="Picture Name">
	</figure>
</section>
</c:if>
<article id="container">
	<c:if test="${not empty param.dwzSidebar}">
	<c:import url="/WEB-INF/jsp/layout/sidebar.jsp" charEncoding="UTF-8"/>
	</c:if>
	<decorator:body/>
</article>
<c:import url="/WEB-INF/jsp/layout/footer.jsp" charEncoding="UTF-8"/>

<div>
	<div id="dialog">
		<div class="dialogHd"><div class="dialogHCt"><button class="dialogClose">Close</button></div></div>
		<div class="dialogCt">
			<div class="dialogCCt"></div>
		</div>
		<div class="dialogFt"><div class="dialogFCt"></div></div>
	</div>
	<div id="overlay"></div>
</div>
</body>

</html>
