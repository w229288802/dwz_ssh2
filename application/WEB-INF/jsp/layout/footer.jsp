<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>

<footer id="footer">
	<div class="footerInner">
		<nav class="footerNav">
			<ul>
			<c:forEach var="item" items="${info:pages('footer')}" varStatus="s">
				<li><a href="/index!page.do?pageId=${item.id}">${item.name}</a></li>
			</c:forEach>
			</ul>
		</nav>
		<ul class="shippingInfo">
			<li class="FedEx"><img alt="FedEx" src="/styles/www/themes/default/images/fedex_logo.gif"></li>
			<li class="UPS"><img alt="UPS" src="/styles/www/themes/default/images/ups_logo.gif"></li>
			<li class="USPostalService"><img alt="United States Postal Service" src="/styles/www/themes/default/images/usps_logo.gif"></li>
		</ul>
		<ul class="paymentInfo">
			<li class="visa"><img alt="visa" src="/styles/www/themes/default/images/visa_logo.gif"></li>
			<li class="masterCard"><img alt="masterCard" src="/styles/www/themes/default/images/masterCard_logo.gif"></li>
			<li class="discover"><img alt="discover" src="/styles/www/themes/default/images/discover_logo.gif"></li>
			<li class="americanExpress"><img alt="americanExpress" src="/styles/www/themes/default/images/americanExpress_logo.gif"></li>
		</ul>
		<ul class="paymentType">
			<li class="paypal"><img alt="Paypal" src="/styles/www/themes/default/images/paypal_logo.gif"></li>
			<li class="googleCheckout"><img alt="Google Checkout" src="/styles/www/themes/default/images/googlecheckout_logo.gif"></li>
		</ul>
		<div class="copyright">
			<s:text name="ui.copyrights"></s:text>
		</div>
		<div class="poweredBy">
			Powered by DWZ.
		</div>
	</div>
</footer>

