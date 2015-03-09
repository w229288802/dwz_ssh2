(function($){
	$.getWinH = function(){
		var dh = $(document).height();
		var wh = $(window).height();
		return dh > wh ? dh : wh;
	}
	
	$.pdialog = {
		_op: {box$:"#dialog", boxCt$:".dialogCCt", close$:".dialogClose", overlay$:"#overlay", width:700, height:380},
		open: function(url, options){
			var op = $.extend({data:{}}, this._op, options);
			
			var $dialog = $(op.box$);
			$dialog.show().css({
				width: op.width + "px",
				marginLeft: (-op.width/2) + "px"
			}).find(op.boxCt$).css({
				height: op.height + "px"
			}).loadUrl(url, op.data);
			
			$dialog.find(op.close$).click(function(){
				$.pdialog.close();
			});
			
			$(op.overlay$).show().height($.getWinH());
		},
		close:function(){
			$(this._op.box$).hide().find(this._op.boxCt$).html("");
			$(this._op.overlay$).hide();
		}
	}
})(jQuery);
