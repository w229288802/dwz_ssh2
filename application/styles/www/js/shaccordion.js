(function($){
	$.fn.extend({
		shaccord :function(){
			var  accors = $(">div",this);
			accors.each(function(index){
				var $this = $(this);
				$this.click(function(){
					if($this.hasClass("accordionOpen")) return false;
					accors.each(function(wh){
						if(wh != index){
							if($(this).hasClass("accordionOpen")){
								$(this).removeClass("accordionOpen").addClass("accordionClosed");
								return false;
							}
						}
					
					});
					$this.removeClass("accordionClosed").addClass("accordionOpen");
					return false;
				});
			});
		}
	});
})(jQuery);
