/**
 * @author ZhangHuihua@msn.com
 * 
 */
(function($){
	$.fn.extend({

		/**
		 * options: reverse[true, false], eventType[click, hover], currentIndex[default index 0]
		 * 			stTab[tabs selector], stTabPanel[tab panel selector]
		 * 			ajaxClass[ajax load], closeClass[close tab]
		 */ 
		tabs: function (options){
			var op = $.extend({reverse:false, eventType:"click", currentIndex:0, stTab:">.tabHd>ul", stTabPanel:"> .tabCt", ajaxClass:"j-ajax", closeClass:"close"}, options);
			
			return this.each(function(){
				initTab($(this));
			});
			
			function initTab(jT){
				var jTabs = $(op.stTab + " li", jT);
				var jGroups = $(op.stTabPanel + " > *", jT);
				
				jTabs.each(function(iTabIndex){
					if (op.currentIndex == iTabIndex) $(this).addClass("tabSelected");
					else $(this).removeClass("tabSelected");
					
					if (op.eventType == "hover") $(this).hover(function(event){switchTab(jT, iTabIndex)});
					else $(this).click(function(event){switchTab(jT, iTabIndex)});

					$("a", this).each(function(){
						if ($(this).hasClass(op.ajaxClass)) {
							$(this).click(function(event){
								var jGroup = jGroups.eq(iTabIndex);
								if (this.href) jGroup.loadUrl(this.href,{},function(){
									jGroup.find("[layoutH]").layoutH();
								});
								event.preventDefault();
							});
							if (op.currentIndex == iTabIndex) { $(this).trigger("click"); }
							
						} else if ($(this).hasClass(op.closeClass)) {
							$(this).click(function(event){
								jTabs.eq(iTabIndex).remove();
								jGroups.eq(iTabIndex).remove();
								if (iTabIndex == op.currentIndex) {
									op.currentIndex = (iTabIndex+1 < jTabs.size()) ? iTabIndex : iTabIndex - 1;
								} else if (iTabIndex < op.currentIndex){
									op.currentIndex = iTabIndex;
								}
								initTab(jT);
								return false;
							});
						}
					});
				});

				switchTab(jT, op.currentIndex);
			}
			
			function switchTab(jT, iTabIndex){
				var jTabHeader = $(op.stTabHeader, jT);
				var jTabs = $(op.stTab + " li", jT);
				var jGroups = $(op.stTabPanel + " > *", jT);
				
				var jTab = jTabs.eq(iTabIndex);
				var jGroup = jGroups.eq(iTabIndex);
				if (op.reverse && (jTab.hasClass("tabSelected") )) {
					jTabs.removeClass("tabSelected");
					jGroups.hide();
				} else {
					op.currentIndex = iTabIndex;
					jTabs.removeClass("tabSelected");
					jTab.addClass("tabSelected");
					
					jGroups.hide().eq(op.currentIndex).show();
				}
				
//				if (!jGroup.attr("inited")){
//					jGroup.attr("inited", 1000).find("input[type=text]").filter("[alt]").inputAlert();
//				}
			}
			
		}
	});
})(jQuery);