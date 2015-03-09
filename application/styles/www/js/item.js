/**
 * @author Roger Wu
 */
(function($){
	$.extend($.fn,{
		detail:function(){
			return this.each(function(){
				var $this = $(this);
				var tabHd = $(".tabHd",$this);
				var tabCt = $(".tabCt",$this);
				
				$(">ul>li", tabHd).each(function(i){
					$(this).click(function(){
						$("li.tabSelected", tabHd).removeClass("tabSelected");
						$(this).addClass("tabSelected");
						$(".itemDetailCt", tabCt).hide().eq(i).show();
						return false;
					});
				});
			});
		},
		images:function(){
			return this.each(function(){
				var booth = $(".booth",this);
				var list = $(".thumbList", this);
				
				$("li", list).each(function(){
					var $this = $(this);
					$this.click(function(){
						$(".selected",list).removeClass("selected");
						$this.addClass("selected");
					});
				});
			});
		}
	});
})(jQuery)
