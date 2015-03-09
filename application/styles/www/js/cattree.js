/**
 * @author Roger Wu
 */
(function($){
	$.extend($.fn, {
		catTree:function(){
			return this.each(function(){
				var tree = $(this);
				$(">ul>li", tree).each(function(){
					
					$(">ul>li", $(this)).each(function(){
						var snote = $(this);
						snote.mouseover(function(){
							snote.addClass("current");
						}).mouseout(function(){
							snote.removeClass("current");
						});
						
					});
				});
			});
		}
	});
})(jQuery);