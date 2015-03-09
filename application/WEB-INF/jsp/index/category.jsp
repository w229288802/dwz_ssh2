<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>

<div id="content">
			<div class="path">
				<ul>
					<li>
						<a href="#">Home</a>
					</li>
					<li><!-- 鼠标hover状态 添加 class="pathOpen"-->
			<a class="pathInner" href="#">Bluetooth Headsets</a>
			<ul>
				<li><a href="/index!category.do?id=xxx">Bluetooth Information</a></li>
				<li><a href="/index!category.do?id=xxx">Bluetooth Compatibility</a></li>
				<li><a href="/index!category.do?id=xxx">Truth About Bluetooth</a></li>
				<li><a href="/index!category.do?id=xxx">Bluetooth Audio Tests</a></li>
				<li><a href="/index!category.do?id=xxx">Bluetooth Headsets</a></li>
				<li><a href="/index!category.do?id=xxx">Editor's Top 10</a></li>
				<li><a href="/index!category.do?id=xxx">Bluetooth Glossary</a></li>
			</ul>
		</li>
		<li>
			<a class="pathInner" href="/index!category.do?id=xxx">Bluetooth Audio Tests</a>
			<ul>
				<li><a href="/index!category.do?id=xxx">Bluetooth Information</a></li>
				<li><a href="/index!category.do?id=xxx">Bluetooth Compatibility</a></li>
				<li><a href="/index!category.do?id=xxx">Truth About Bluetooth</a></li>
				<li><a href="/index!category.do?id=xxx">Bluetooth Audio Tests</a></li>
				<li><a href="/index!category.do?id=xxx">Bluetooth Headsets</a></li>
				<li><a href="/index!category.do?id=xxx">Editor's Top 10</a></li>
				<li><a href="/index!category.do?id=xxx">Bluetooth Glossary</a></li>
			</ul>
		</li>
		<li class="last">
			<a class="pathInner" href="/index!category.do?id=xxx">Bluetooth Glossary</a>
			<ul>
				<li><a href="/index!category.do?id=xxx">Bluetooth Information</a></li>
				<li><a href="/index!category.do?id=xxx">Bluetooth Compatibility</a></li>
				<li><a href="/index!category.do?id=xxx">Truth About Bluetooth</a></li>
				<li><a href="/index!category.do?id=xxx">Bluetooth Audio Tests</a></li>
				<li><a href="/index!category.do?id=xxx">Bluetooth Headsets</a></li>
				<li><a href="/index!category.do?id=xxx">Editor's Top 10</a></li>
				<li><a href="/index!category.do?id=xxx">Bluetooth Glossary</a></li>
			</ul>
		</li>
	</ul>
</div>
<article class="widgetArticle">
	<h2 class="widgetTitle">Lorem ipsum dolor sit amet</h2>
	<figure class="leftPicture"><!--rightPicture-->
		<img src="/styles/www/files/widget-picture.gif" alt="Picture Name">
	</figure>
	<section class="widgetParagraph">
		<p>Donec vitae lorem quis dui ultrices hendrerit. Proin vel turpis eu justo rutrum ultricies eu at neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu felis quis justo consequat interdum et at lorem. Aenean nulla lacus, pulvinar quis tempus ut, rutrum vitae odio. Morbi a urna dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc commodo leo id arcu varius ut aliquet velit scelerisque. Suspendisse et dolor eget nunc adipiscing imperdiet.</p>
	</section>
	<div class="clearBoth"><hr></div>
</article>
<section class="widgetList">
	<div class="catList">
		<ul>
			<li><a href="/index!category.do?id=xxx">Bluetooth Information</a></li>
			<li><a href="/index!category.do?id=xxx">Bluetooth Compatibility</a></li>
			<li><a href="/index!category.do?id=xxx">Truth About Bluetooth</a></li>
			<li><a href="/index!category.do?id=xxx">Bluetooth Audio Tests</a></li>
			<li><a href="/index!category.do?id=xxx">Bluetooth Headsets</a></li>
			<li><a href="/index!category.do?id=xxx">Editor's Top 10</a></li>
			<li><a href="/index!category.do?id=xxx">Bluetooth Glossary</a></li>
			<li><a href="/index!category.do?id=xxx">Bluetooth Information</a></li>
			<li><a href="/index!category.do?id=xxx">Bluetooth Compatibility</a></li>
			<li><a href="/index!category.do?id=xxx">Truth About Bluetooth</a></li>
			<li><a href="/index!category.do?id=xxx">Bluetooth Audio Tests</a></li>
			<li><a href="/index!category.do?id=xxx">Bluetooth Headsets</a></li>
			<li><a href="/index!category.do?id=xxx">Editor's Top 10</a></li>
			<li><a href="/index!category.do?id=xxx">Bluetooth Glossary</a></li>
		</ul>
	</div>
	<form id="pagerCatForm" method="post" action="category.html">
		
		<fieldset class="filter">
			<div class="oneColumn">
				<p class="searchWithin">
					<label>Search Within:</label>
					<input type="text" name="keywords" value="" class="textInput">
				</p>
				<p class="priceRange">
					<label>Price Range:</label>
					<input type="text" name="priceFrom" value="" class="textInput"><span>to</span><input type="text" name="priceTo" value="" class="textInput">
				</p>
			</div>
			<div class="towColumn">
				<p>
					<label>Free Shipping:</label>
					<input name="freeShipping" type="checkbox" value="Y">
				</p>
				<p><!--
					<label>User Rating:</label>
					<select>
						<option>1</option>
					</select>-->
				</p>
			</div>
			<div class="threeColumn">
				<button type="submit">Go</button>
			</div>
		</fieldset>
	</form>				
	<div class="itemList">
		<div class="toolbar">
			<dl class="view">
				<dt>View:</dt>
				<dd class="listButton"><a href="###" name="listView">List View</a></dd>
				<dd class="colButton"><a href="###" name="colView">Two Col View</a></dd>
				<dd class="gridButton"><a href="###" name="gridView">Grid View</a></dd>
				<dd class="pictureButton"><a href="###" name="pictureView">Picture View</a></dd>
				<!--<dd class="belowButton"><a href="#" name="belowView">Detail View</a></dd>
				<dd class="rightButton"><a href="#" name="rightView">Detail View</a></dd>-->
				<dd class="textButton"><a href="###" name="textView">Text View</a></dd>
			</dl>
			<dl class="itemNumber">
				<dd class="item20"><a href="###">20</a></dd>
				<dd class="item30"><a href="###">30</a></dd>
				<dd class="item50"><a href="###">50</a></dd>
			</dl>
			<dl class="sort">
				<dt>Sort by:</dt>
				<dd>
					<select name="sortBy">
						<option value="">Select One</option>
						<option value="INSERT_DATE">New Items</option>
						<option value="PRODUCT_NAME">Name A - Z</option>
						<option value="PRODUCT_NAME_DESC">Name Z - A</option>
						<option value="PRICE">Price Low to High</option>
						<option value="PRICE_DESC">Price High to Low</option>
						<option value="SELL_COUNT">Best Selling</option>
						<option value="HIT_COUNT">Hot Items</option>
						<option value="BRAND_NAME">Brand</option>
					</select>
				</dd>
			</dl>
			<!--<div class="pagination">
				<span class="pageInfo">Page 3 of 100</span>
				<span class="pageStart">First</span>
				<a class="pagePre" href="#">Previous</a>
				<a class="pageNext" href="#"><span>Next</span></a>
				<span class="pageEnd"><span>Last</span></span>
			</div>-->
		</div>

		<div class="listView">
			<div class="listHd"><div class="listHCt"></div></div>
			<div class="listCt">
				<ul class="mediumPic">
<!-- 设置图片大小：smallPic，mediumPic，largePic
listView 默认smallPic, priceRight 价格放到了右边，其他列表不需要
colView 默认mediumPic
gridView 默认mediumPic
pictureView 默认mediumPic
belowView 列表默认smallPic, 展示高度500像素
rightView 列表默认smallPic, 展示高度500像素
textView 无需设置图片
-->
								<li id="3">
									<dl class="widgetItem sale"><!-- 当显示促销是添加 sale -->
							<dt class="name"><a href="/index!item.do?id=xxx">Plantronics Voyager 520 Bluetooth Headset - Recertified by Plantronics</a></dt>
							<dd class="image"><a class="picture" href="/index!item.do?id=xxx"><img src="/styles/www/themes/default/images/picture100x100.jpg" alt="Name"></a></dd>
							<dd class="description">Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc commodo leo id arcu varius ut aliquet velit scelerisque.</dd>
							<dd class="price">
								<p class="listPrice"><span>List Price: </span>US $29.95</p>
								<p class="ourPrice"><span>Our Price: </span>US $26.95</p>
								<p class="onSale"><span>On Sale: </span>US $26.95</p>
								<p class="yourSave"><span>Savings: </span>US $23.00 (12.3%)</p>
							</dd>
							<dd class="shipping"><span class="free">Free Shipping</span></dd><!-- 如果发布产品时，选择的是free shipping 就添加这个 span class="free" -->
							<dd class="starrating"><span>User Rating: </span><img src="/styles/www/themes/default/images/stars-4.5.gif" alt="4.5 Star"></dd>
							<dd class="cart">
								<a href="###"><img src="/styles/www/themes/default/images/addToCart.gif" alt="Add To Cart"></a>
							</dd>
						</dl>
					</li>
					<li id="4" class=""><!-- pictureView 鼠标悬停添加 itemHover, largePic -->
						<dl class="widgetItem sale"><!--计算位置 style="top:-20px; left:-30px;" -->
							<dt class="name"><a href="/index!item.do?id=xxx">Plantronics Voyager 520 Bluetooth Headset - Recertified by Plantronics</a></dt>
							<dd class="image"><a class="picture" href="/index!item.do?id=xxx"><img src="/styles/www/themes/default/images/picture100x100.jpg" alt="Name"></a></dd>
							<dd class="description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu felis quis justo consequat interdum et at lorem. Aenean nulla lacus, pulvinar quis tempus ut, rutrum vitae odio. Morbi a urna dui.</dd>
							<dd class="price">
								<p class="listPrice"><span>List Price: </span>US $29.95</p>
								<p class="ourPrice"><span>Our Price: </span>US $26.95</p>
								<p class="onSale"><span>On Sale!: </span>US $26.95</p>
								<p class="yourSave"><span>Savings: </span>US $23.00 (12.3%)</p>
							</dd>
							<dd class="shipping"><span class="free">Free Shipping</span></dd>
							<dd class="starrating"><span>User Rating: </span><img src="/styles/www/themes/default/images/stars-4.5.gif" alt="4.5 Star"></dd>
							<dd class="cart">
								<a href="###"><img src="/styles/www/themes/default/images/addToCart.gif" alt="Add To Cart"></a>
							</dd>
						</dl>
					</li>
					<li>
						<dl class="widgetItem">
							<dt class="name"><a href="/index!item.do?id=xxx">Aliph Jawbone 2 Bluetooth Headset with Noise Assassin (Black)</a></dt>
							<dd class="image"><a class="picture" href="/index!item.do?id=xxx"><img src="/styles/www/themes/default/images/picture100x100.jpg" alt="Name"></a></dd>
							<dd class="price">
								<p class="ourPrice"><span>Our Price: </span>US $26.95</p>
							</dd>
							<dd class="shipping"><span class="free">Free Shipping</span></dd>
							<dd class="starrating"><span>User Rating: </span><img src="/styles/www/themes/default/images/stars-4.gif" alt="4 Star"></dd>
							<dd class="cart">
								<a href="###"><img src="/styles/www/themes/default/images/addToCart.gif" alt="Add To Cart"></a>
							</dd>
						</dl>
					</li>
					<li>
						<dl class="widgetItem sale">
							<dt class="name"><a href="/index!item.do?id=xxx">Plantronics Explorer 390 Bluetooth Headset (Refurbished)</a></dt>
							<dd class="image"><a class="picture" href="/index!item.do?id=xxx"><img src="/styles/www/themes/default/images/picture100x100.jpg" alt="Name"></a></dd>
							<dd class="price">
								<p class="onSale"><span>On Sale!: </span>US $19.95</p>
							</dd>
							<dd class="shipping">Eligible for FREE  Super Saver Shipping.</dd>
							<dd class="starrating"><span>User Rating: </span><img src="/styles/www/themes/default/images/stars-5.gif" alt="5 Star"></dd>
							<dd class="cart">
								<a href="###"><img src="/styles/www/themes/default/images/addToCart.gif" alt="Add To Cart"></a>
							</dd>
						</dl>
					</li>
					<li>
						<dl class="widgetItem">
							<dt class="name"><a href="/index!item.do?id=xxx">Plantronics Voyager 520 Bluetooth Headset - Recertified by Plantronics</a></dt>
							<dd class="image"><a class="picture" href="/index!item.do?id=xxx"><img src="/styles/www/themes/default/images/picture100x100.jpg" alt="Name"></a></dd>
							<dd class="price">
								<p class="listPrice"><span>List Price: </span>US $29.95</p>
								<p class="ourPrice"><span>Our Price: </span>US $26.95</p>
								<p class="yourSave"><span>Savings: </span>US $23.00 (12.3%)</p>
							</dd>
							<dd class="shipping"><span class="free">Free Shipping</span></dd>
							<dd class="starrating"><span>User Rating: </span><img src="/styles/www/themes/default/images/stars-4.5.gif" alt="4.5 Star"></dd>
							<dd class="cart">
								<a href="###"><img src="/styles/www/themes/default/images/addToCart.gif" alt="Add To Cart"></a>
							</dd>
						</dl>
					</li>
					<li>
						<dl class="widgetItem sale">
							<dt class="name"><a href="/index!item.do?id=xxx">Plantronics Explorer 390 Bluetooth Headset (Refurbished)</a></dt>
							<dd class="image"><a class="picture" href="/index!item.do?id=xxx"><img src="/styles/www/themes/default/images/picture100x100.jpg" alt="Name"></a></dd>
							<dd class="price">
								<p class="onSale"><span>On Sale!: </span>US $19.95</p>
							</dd>
							<dd class="shipping">Eligible for FREE  Super Saver Shipping.</dd>
							<dd class="starrating"><span>User Rating: </span><img src="/styles/www/themes/default/images/stars-5.gif" alt="5 Star"></dd>
							<dd class="cart">
								<a href="###"><img src="/styles/www/themes/default/images/addToCart.gif" alt="Add To Cart"></a>
							</dd>
						</dl>
					</li>
					<li>
						<dl class="widgetItem sale">
							<dt class="name"><a href="/index!item.do?id=xxx">Plantronics Explorer 390 Bluetooth Headset (Refurbished)</a></dt>
							<dd class="image"><a class="picture" href="/index!item.do?id=xxx"><img src="/styles/www/themes/default/images/picture100x100.jpg" alt="Name"></a></dd>
							<dd class="price">
								<p class="onSale"><span>On Sale!: </span>US $19.95</p>
							</dd>
							<dd class="shipping">Eligible for FREE  Super Saver Shipping.</dd>
							<dd class="starrating"><span>User Rating: </span><img src="/styles/www/themes/default/images/stars-5.gif" alt="5 Star"></dd>
							<dd class="cart">
								<a href="###"><img src="/styles/www/themes/default/images/addToCart.gif" alt="Add To Cart"></a>
							</dd>
						</dl>
					</li>
					<li>
						<dl class="widgetItem">
							<dt class="name"><a href="/index!item.do?id=xxx">Aliph Jawbone 2 Bluetooth Headset with Noise Assassin (Black)</a></dt>
							<dd class="image"><a class="picture" href="/index!item.do?id=xxx"><img src="/styles/www/themes/default/images/picture100x100.jpg" alt="Name"></a></dd>
							<dd class="price">
								<p class="ourPrice"><span>Our Price: </span>US $26.95</p>
							</dd>
							<dd class="shipping"><span class="free">Free Shipping</span></dd>
							<dd class="starrating"><span>User Rating: </span><img src="/styles/www/themes/default/images/stars-4.gif" alt="4 Star"></dd>
							<dd class="cart">
								<a href="###"><img src="/styles/www/themes/default/images/addToCart.gif" alt="Add To Cart"></a>
							</dd>
						</dl>
					</li>
					<li>
						<dl class="widgetItem sale">
							<dt class="name"><a href="/index!item.do?id=xxx">Plantronics Explorer 390 Bluetooth Headset (Refurbished)</a></dt>
							<dd class="image"><a class="picture" href="/index!item.do?id=xxx"><img src="/styles/www/themes/default/images/picture100x100.jpg" alt="Name"></a></dd>
							<dd class="price">
								<p class="onSale"><span>On Sale!: </span>US $19.95</p>
							</dd>
							<dd class="shipping">Eligible for FREE  Super Saver Shipping.</dd>
							<dd class="starrating"><span>User Rating: </span><img src="/styles/www/themes/default/images/stars-5.gif" alt="5 Star"></dd>
							<dd class="cart">
								<a href="###"><img src="/styles/www/themes/default/images/addToCart.gif" alt="Add To Cart"></a>
							</dd>
						</dl>
					</li>
					<li>
						<dl class="widgetItem">
							<dt class="name"><a href="/index!item.do?id=xxx">Aliph Jawbone 2 Bluetooth Headset with Noise Assassin (Black)</a></dt>
							<dd class="image"><a class="picture" href="/index!item.do?id=xxx"><img src="/styles/www/themes/default/images/picture100x100.jpg" alt="Name"></a></dd>
							<dd class="price">
								<p class="ourPrice"><span>Our Price: </span>US $26.95</p>
							</dd>
							<dd class="shipping"><span class="free">Free Shipping</span></dd>
							<dd class="starrating"><span>User Rating: </span><img src="/styles/www/themes/default/images/stars-4.gif" alt="4 Star"></dd>
							<dd class="cart">
								<a href="###"><img src="/styles/www/themes/default/images/addToCart.gif" alt="Add To Cart"></a>
							</dd>
						</dl>
					</li>
					<li>
						<dl class="widgetItem">
							<dt class="name"><a href="/index!item.do?id=xxx">Aliph Jawbone 2 Bluetooth Headset with Noise Assassin (Black)</a></dt>
							<dd class="image"><a class="picture" href="/index!item.do?id=xxx"><img src="/styles/www/themes/default/images/picture100x100.jpg" alt="Name"></a></dd>
							<dd class="price">
								<p class="ourPrice"><span>Our Price: </span>US $26.95</p>
							</dd>
							<dd class="shipping"><span class="free">Free Shipping</span></dd>
							<dd class="starrating"><span>User Rating: </span><img src="/styles/www/themes/default/images/stars-4.gif" alt="4 Star"></dd>
							<dd class="cart">
								<a href="###"><img src="/styles/www/themes/default/images/addToCart.gif" alt="Add To Cart"></a>
							</dd>
						</dl>
					</li>
					<li>
						<dl class="widgetItem">
							<dt class="name"><a href="/index!item.do?id=xxx">Aliph Jawbone 2 Bluetooth Headset with Noise Assassin (Black)</a></dt>
							<dd class="image"><a class="picture" href="/index!item.do?id=xxx"><img src="/styles/www/themes/default/images/picture100x100.jpg" alt="Name"></a></dd>
							<dd class="price">
								<p class="ourPrice"><span>Our Price: </span>US $26.95</p>
							</dd>
							<dd class="shipping"><span class="free">Free Shipping</span></dd>
							<dd class="starrating"><span>User Rating: </span><img src="/styles/www/themes/default/images/stars-4.gif" alt="4 Star"></dd>
							<dd class="cart">
								<a href="###"><img src="/styles/www/themes/default/images/addToCart.gif" alt="Add To Cart"></a>
							</dd>
						</dl>
					</li>
					<li>
						<dl class="widgetItem">
							<dt class="name"><a href="/index!item.do?id=xxx">Aliph Jawbone 2 Bluetooth Headset with Noise Assassin (Black)</a></dt>
							<dd class="image"><a class="picture" href="/index!item.do?id=xxx"><img src="/styles/www/themes/default/images/picture100x100.jpg" alt="Name"></a></dd>
							<dd class="price">
								<p class="ourPrice"><span>Our Price: </span>US $26.95</p>
							</dd>
							<dd class="shipping"><span class="free">Free Shipping</span></dd>
							<dd class="starrating"><span>User Rating: </span><img src="/styles/www/themes/default/images/stars-4.gif" alt="4 Star"></dd>
							<dd class="cart">
								<a href="###"><img src="/styles/www/themes/default/images/addToCart.gif" alt="Add To Cart"></a>
							</dd>
						</dl>
					</li>
					<li>
						<dl class="widgetItem">
							<dt class="name"><a href="/index!item.do?id=xxx">Aliph Jawbone 2 Bluetooth Headset with Noise Assassin (Black)</a></dt>
							<dd class="image"><a class="picture" href="/index!item.do?id=xxx"><img src="/styles/www/themes/default/images/picture100x100.jpg" alt="Name"></a></dd>
							<dd class="price">
								<p class="ourPrice"><span>Our Price: </span>US $26.95</p>
							</dd>
							<dd class="shipping"><span class="free">Free Shipping</span></dd>
							<dd class="starrating"><span>User Rating: </span><img src="/styles/www/themes/default/images/stars-4.gif" alt="4 Star"></dd>
							<dd class="cart">
								<a href="###"><img src="/styles/www/themes/default/images/addToCart.gif" alt="Add To Cart"></a>
							</dd>
						</dl>
					</li>
				</ul>
				<div class="pagination" totalCount="200" numPerPage="20" pageNumShown="10" currentPage="1"></div>
			</div>
			<div class="listFt"><div class="listFCt"></div></div>
		</div>
		
	</div>
</section>
</div>
