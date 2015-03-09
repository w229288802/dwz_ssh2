<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>

<header id="header">
	<h1 class="logo">
		<a href="/"><img src="/styles/www/themes/default/images/logo.gif" alt="Store Title"></a>
	</h1>
	<nav class="navigation">
		<ul>
			<li class="home current"><a href="/"><s:text name="ui.home"/></a></li>
			<li><a href="/index!listNews.do"><s:text name="ui.news"/></a></li>
			<c:forEach var="item" items="${info:pages('header')}">
			<li>
				<a ${param.pageId eq item.id ? 'class="selected"' : ''} href="/index!page.do?pageId=${item.id}"><span><span><span>${item.name}</span></span></span></a>
			</li>
			</c:forEach>
		</ul>
	</nav>
	<div class="secondary">
		<ul>
			<li><a href="/"><s:text name="ui.home"/></a></li>
			<c:choose>
			<c:when test="${!empty contextUser}">
				<li><a href="/myaccount/index!index.do"><s:text name="ui.controlPanel"/></a></li>
				<li><a href="/passport!logout.do"><s:text name="ui.logout"/></a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/index!login.do"><s:text name="ui.login"/></a></li>
			</c:otherwise>
			</c:choose>
			<li><a href="sitemap.html">Site Map</a></li>
		</ul>
	</div>
	<fieldset class="storeSearch">
		<form action="category.html" method="post" class="searchBar"><!-- 添加 searchOpen -->
			<p>
				<label for="searchKeywords" class="searchTitle">Search Store</label>
				<input type="text" name="keywords" value="" title="Search for" id="searchKeywords" class="searchKeywords">
				<button type="submit" class="searchSubmit" title="Search">Search</button>
				<a href="#advancedDrawer" title="Advanced Search" class="advancedButton">Advanced Search</a>
			</p>
			<div class="advancedDrawer" >
				<div>
				<div class="searchCt">
					<p class="itemName">
						<label for="searchName">Product Name</label>
						<input type="text" name="productName" value="" class="textInput" id="searchName">
					</p>
					<p class="byCategory">
						<label for="searchCategory">Category</label>
						<select id="searchCategory" name="categoryId">
							<option>All Categories</option>
						</select>
					</p>
					<p class="byBrand">
						<label for="searchBrand">Brand</label>
						<select id="searchBrand" name="brandId">
							<option>All Brands</option>
						</select>
					</p>
					<p class="itemPrice">
						<label for="searchPrice">Price</label>
						<input type="text" class="textInput" name="priceFrom" value="" id="searchPrice"><span class="to">to</span><input type="text" name="priceTo" class="textInput">
					</p>
					<p class="itemNum">
						<label for="searchNo">Product # </label>
						<input type="text" class="textInput" name="sku" value="" id="searchNo">
					</p>
				</div>
				</div>
			</div>
		</form>
	</fieldset>
	<div class="cartInfo"><!--显示面板添加 openCartInfo-->
		<div class="cartInner">
			<span class="amount">5 item<span>s</span></span>
			<span class="total">US $293.50</span>
		</div>
		<div class="cartPanel boxShadow">
			<ul class="itemList">
				<li><div class="cartImage"><a class="picture" href="#"><img src="/styles/www/themes/default/images/banner.jpg" alt="" width="45" height="45"></a></div>
					<div class="cartItem">
						<h3><a href="#">Prime Bluetooth Headset</a></h3>
						<div class="priceInfo">
							<span class="price">US $132.00</span>
							<span class="quantity"><input class="textInput" type="text" maxlength="10" value="1"></span>
							<a class="remove" href="#remove" title="Remove">Remove</a>
						</div>
					</div>
				</li>
				<li>
					<div class="cartImage"><a class="picture" href="#"><img src="/styles/www/themes/default/images/banner.jpg" alt="" width="45" height="45"></a></div>
					<div class="cartItem">
						<h3><a href="#">Aliph Jawbone Prime JBT03 Bluetooth Head...</a></h3>
						<div class="priceInfo">
							<span class="price">US $132.00</span>
							<span class="quantity"><input class="textInput" type="text" maxlength="10" value="1"></span>
							<a class="remove" href="#remove" title="Remove">Remove</a>
						</div>
					</div>
				</li>
			</ul>
			<div class="accordion" style="display:none;">
				<div class="accordionPanel openAccordion">
					<h2 class="accordionHd">Zip/Postal Code</h2>
					<div class="accordionCt">
						<input type="text">
					</div>
				</div>
				<div class="accordionPanel">
					<h2 class="accordionHd">Shipping Methods</h2>
					<div class="accordionCt">Content 2</div>
				</div>
				<div id="Panel-3" class="accordionPanel">
					<h2 class="accordionHd">Coupon Code</h2>
					<div class="accordionCt">Content 3</div>
				</div>
			</div>
			<div class="cartTotal">
				<div class="couponCode "><!-- openCoupon -->
					<label class="couponHandle"><input type="checkbox" name="apply" value="Y"/>Coupon Code</label>
					<input class="textInput" type="text" size="10" >
				</div>
				<ul class="totalList">
					<li><span>Subtotal</span>US $253.50</li>
					<li class="total"><span>Subtotal</span>US $253.50</li>
				</ul>
			</div>
			<div class="cartCheckout">
				<button class="checkoutBt" title="Proceed to Checkout">Checkout</button>
				<a href="#" title="Google Checkout"><img src="/styles/www/themes/default/images/googleCheckoutBt.gif" width="174" height="44" alt="Google Checkout"></a>
				<a href="#" title="PayPal Checkout"><img src="/styles/www/themes/default/images/paypalCheckoutBt.gif" width="145" height="42" alt="PayPal Checkout"></a>
			</div>
		</div>
	</div>
</header>

