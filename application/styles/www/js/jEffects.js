/**
 * @author Roger Wu
 * @version 1.0
 * @param {Object} $.fn
 * @param {Object} {jBlindUp,jBlindDown,jSlideUp,jSlideDown,jFadeOut,jFadeIn}
 */
(function($){
	$.extend($.fn, {
		jBlindUp: function(options){
			var op = $.extend({duration: 500, easing: "swing", call: function(){}}, options);
			return this.each(function(){
				var $this = $(this);
				$(this).animate({height: 0}, {
					duration: op.duration,
					easing: op.easing,
					complete: function(){ $this.css({display: "none"});
						op.call();
					}
				});
			});
		},
		jBlindDown: function(options){
			var op = $.extend({to:0, duration: 500,easing: "swing",call: function(){}}, options);
			return this.each(function(){
				var $this = $(this);
				var	fixedPanelHeight = (op.to > 0)?op.to:$.Effect.getDimensions($this[0]).height;
				$this.css("height", "0px");
				$this.animate({height: fixedPanelHeight}, {
					duration: op.duration,
					easing: op.easing,
					complete: function(){ $this.css({display: "block"}); op.call(); }
				});
			});
		},
		jSlideUp:function(options) {
			var op = $.extend({to:0, duration: 1000,easing: "swing",call: function(){}}, options);
			return this.each(function(){
				var $this = $(this);
				$this.wrapInner("<div></div>");
				var	fixedHeight = (op.to > 0)?op.to:$.Effect.getDimensions($(">div",$this)[0]).height;
				$this.css({overflow:"visible",position:"relative"});
				$(">div",$this).css({position:"relative"}).animate({top: -fixedHeight}, {
					easing: op.easing,
					duration: op.duration,
					complete:function(){ $this.css({display: "none", height:""});$this.html($(this).html());}
				});
				$this.animate({height: 0}, {
					duration: op.duration+10,
					easing: op.easing,
					complete: function(){ $this.css({display: "none", height:""}); op.call(); }
				});
			});
		},
		jSlideDown:function(options) {
			var op = $.extend({to:0, duration: 500,easing: "swing",call: function(){}}, options);
			return this.each(function(){
				var $this = $(this);
				var	fixedHeight = (op.to > 0)?op.to:$.Effect.getDimensions($this[0]).height;
				$this.wrapInner("<div style=\"top:-" + fixedHeight + "px;\"></div>");
				$this.css({overflow:"visible",position:"relative", height:"0px"})
				.animate({height: fixedHeight}, {
					duration: op.duration,
					easing: op.easing,
					complete: function(){  $this.css({display: "",overflow:""}); op.call(); }
				});
				$(">div",$this).css({position:"relative"}).animate({top: 0}, {
					easing: op.easing,
					duration: op.duration,
					complete:function(){$this.html($(this).html());}
				});
			});
		},
		jFadeOut:function(options){
			var op = $.extend({to:0, duration: 1000,easing: "swing",call: function(){}}, options);
			return this.each(function(){
				var $this = $(this);
				$this.css({opacity:1}).animate({opacity: op.to},{
					easing:op.easing,
					duration:op.duration,
					complete:function(){
						op.call();
					}
				});
			});
		},
		jFadeIn:function(options){
			var op = $.extend({to:1, duration: 1000,easing: "swing",call: function(){}}, options);
			return this.each(function(){
				var $this = $(this);
				$this.css({opacity:0}).animate({opacity: op.to},{
					easing:op.easing,
					duration:op.duration,
					complete:function(){
						op.call();
					}
				});
			});
		}
	});
	$.Effect = {
		getDimensions: function(element, displayElement){
			// If the displayElement display property is set to 'none', we temporarily set its
			// visibility state to 'hidden' to be able to calculate the dimension.
			
			var dimensions = new $.Effect.Rectangle;
			var displayOrig = $(element).css('display');
			var visibilityOrig = $(element).css('visibility');
			var isZero = $(element).height()==0?true:false;
			if ($(element).is(":hidden")) {
				$(element).css({visibility: 'hidden', display: 'block'});
				if(isZero)$(element).css("height","");
				if ($.browser.opera)
					refElement.focus();
			}
			dimensions.height = $(element).height();
			dimensions.width = $(element).width();
			if (displayOrig == 'none'){
				$(element).css({visibility: visibilityOrig, display: 'none'});
				if(isZero) if(isZero)$(element).css("height","0px");
			}
			return dimensions;
		}
	}
	$.Effect.Rectangle = function(){
		this.width = 0;
		this.height = 0;
		this.unit = "px";
	}
})(jQuery);
