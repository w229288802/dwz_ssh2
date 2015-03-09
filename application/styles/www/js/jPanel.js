/**
 * @author Roger Wu
 * @version 1.0
 */
(function($){
	$.extend($.fn, {
		jCollPanel:function(options){
			var op = $.extend({header:".collapsibleHd", content:".collapsibleCt", hover:"collapsibleHover", open:"collapsibleOpen", closed:"collapsibleClosed"}, options);
			return this.each(function(){
				$panel = $(this);
				$(op.header, $panel).hover(function(){
					$(this).addClass(op.hover);
				}, function(){
					$(this).removeClass(op.hover);
				}).click(function(){
					if($panel.hasClass(op.closed)){
						$panel.removeClass(op.closed);
						$(op.content, $panel).jFadeIn({
							call:function(){$panel.removeClass(op.closed);}
						});
						//$(op.content, $panel).jSlideDown();
						
//						$(op.content, $panel).jBlindDown({call:function(){
//							$panel.removeClass(op.closed);
//						}});
					} else {			
//						$(op.content, $panel).jFadeOut({call:function(){ 
//							$panel.addClass(op.closed);
//						}});
						$(op.content, $panel).jSlideUp({
							call: function(){
								$panel.addClass(op.closed);
							}	
						});
//						$(op.content, $panel).jBlindUp({
//							call: function(){
//								$panel.addClass(op.closed);
//							}
//						});
					}
					return false;
				});
			});
		}
	});
})(jQuery);     
