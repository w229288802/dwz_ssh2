/**
 * @author Roger Wu
 */
(function($){
	$.extend($.fn, {
		siginup:function(){
			return this.each(function(){
				var lBut = $("a:first",this);
				lBut.click(function(){
					$("#loginBox").loginBox();
					return false;
				});
			});
		},
		loginBox:function(){
			return this.each(function(){
				var $this = $(this);
				$this.show();
				var allocation = function(){
					var width = $this.outerWidth();
					var height = $this.outerHeight();
					var dimensions = getWindowSize();
					var left = (dimensions.width - width) / 2; 
					var top = (dimensions.height - height) / 2 + getPageScroll()[1];
					$this.css({top:top+"px", left:left+"px"});
				}
				allocation();
				
				$(window).scroll(allocation);
				$(window).resize(allocation);
			});
		}
	});
})(jQuery);

function getWindowSize() {
	if ($.browser.opera) { return { width: window.innerWidth, height: window.innerHeight }; }
	return { width: $(window).width(), height: $(window).height() };
}

function getPageScroll(){
   var yScroll;
   if (self.pageYOffset) {
     yScroll = self.pageYOffset;
   } else if (document.documentElement && document.documentElement.scrollTop){// Explorer 6 Strict
     yScroll = document.documentElement.scrollTop;
   } else if (document.body) {// all other Explorers
     yScroll = document.body.scrollTop;
   }

   arrayPageScroll = new Array('',yScroll)
   return arrayPageScroll;
}