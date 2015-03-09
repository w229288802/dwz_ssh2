$(document).ready(function(){
	
	$("nav.navigation").menu();
	$(".storeSearch").searchBox();
	
	$("li:first", "#header .navigation").addClass("home");
	
	$(".cartInfo").hoverClass("openCartInfo");

	initUI();
});

function initUI(_box){
	var $p = $(_box || document);
	
	$(".widgetCategory", $p).catTree();
	$(".path li", $p).hoverClass("pathOpen");
	$("form.forgotPanel", $p).hoverClass("openForgot");
	$("input[type=text], input[type=password]", $p).filter("[alt]").inputAlert();

//	$(".itemList",".cartInfo").editCartList();
//	$(".cart",".listView").bindCartEvent();
//	$(".accordion").shaccord();
//	$(".signup","#header").siginup();
//	$("#loginBox").loginBox();
//	$(".accordion").accordion({fillSpace:true,alwaysOpen:true,active:0});
//	$(".collapsiblePanel").jCollPanel();
	
	$("div.tabs", $p).each(function(){
		var $this = $(this);
		var options = {};
		options.currentIndex = $this.attr("currentIndex") || 0;
		options.eventType = $this.attr("eventType") || "click";
		$this.tabs(options);
	});
	
	$("a[target=ajax]", $p).each(function(){
		$(this).click(function(event){
			var $this = $(this);
			var rel = $this.attr("rel") || "container";
			if (rel) $("#"+rel).loadUrl($this.attr("href"));

			event.preventDefault();
		});
	});
	
	//dialogs
	$("a[target=dialog]", $p).each(function(){
		$(this).click(function(event){
			var $this = $(this);

			var options = {};
			var w = $this.attr("width");
			var h = $this.attr("height");
			if (w) options.width = w;
			if (h) options.height = h;
			
			var url = unescape($this.attr("href")).replaceTmById($p);
			DWZ.debug(url);
			if (!url.isFinishedTm()) {
				alert($this.attr("warn") || DWZ.msg("alertSelectMsg"));
				return false;
			}
			$.pdialog.open(url, options);
			
			return false;
		});
	});
	
	$("div.pagination", $p).each(function(){
		var $this = $(this);
		$this.pagination({
			targetType:$this.attr("targetType"),
			totalCount:$this.attr("totalCount"),
			numPerPage:$this.attr("numPerPage"),
			pageNumShown:$this.attr("pageNumShown"),
			currentPage:$this.attr("currentPage")
		});
	});
}
  
