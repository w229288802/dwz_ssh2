/**
 * @author Roger Wu
 */
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
						$(op.header, $panel).css({position:"relative",zIndex:1000});
						$(op.header).parent().css({overflow:"hidden"});
						$(op.content, $panel).css({position:"relative", zIndex:999});
						$panel.removeClass(op.closed);
						$(op.content, $panel).animate({top:0}, 900, function(){});
					}else{			
						$(op.header, $panel).css({position:"relative",zIndex:1000});
						$(op.header).parent().css({overflow:"hidden"});
						$(op.content, $panel).css({position:"relative", zIndex:999});
						$(op.content, $panel).animate({top: -389}, 500, function(){ 
							$(op.content, $panel).css({display: ""});
							$panel.addClass(op.closed);
						});
					}
					return false;
				});
			});
		}
	});
})(jQuery);     
