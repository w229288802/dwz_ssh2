/**
 * @author Roger Wu
 * @version 1.0
 */
var DWZ = {
	// sbar: show sidebar
	keyCode: {
		ENTER: 13, ESC: 27, END: 35, HOME: 36,
		SHIFT: 16, TAB: 9,
		LEFT: 37, RIGHT: 39, UP: 38, DOWN: 40,
		DELETE: 46, BACKSPACE:8
	},
	statusCode: {ok:200, error:300, timeout:301},
	ui:{sbar:true},
	frag:{}, //page fragment
	_msg:{}, //alert message
	_set:{
		loginUrl:"", //session timeout
		loginTitle:"", //if loginTitle open a login dialog
		debug:false
	},
	msg:function(key, args){
		var _format = function(str,args) {
			args = args || [];
			var result = str
			for (var i = 0; i < args.length; i++){
				result = result.replace(new RegExp("\\{" + i + "\\}", "g"), args[i]);
			}
			return result;
		}
		return _format(this._msg[key], args);
	},
	debug:function(msg){
		if (this._set.debug) alert(msg);
	},
	loadLogin: function(){
		if ($.pdialog && DWZ._set.loginTitle) {
			$.pdialog.open(DWZ._set.loginUrl, "login", DWZ._set.loginTitle, {mask:true,width:400,height:200});
		} else {
			window.location = DWZ._set.loginUrl;
		}
	},

	jsonEval:function (json) {
		try{
			return eval('(' + json + ')');
		} catch (e){
			return {};
		}
	},
	ajaxError:function (xhr, ajaxOptions, thrownError){
		if (alertMsg) {
			alertMsg.error("<div>Http status: " + xhr.status + " " + xhr.statusText + "</div>" 
				+ "<div>ajaxOptions: "+ajaxOptions + "</div>"
				+ "<div>thrownError: "+thrownError + "</div>"
				+ "<div>"+xhr.responseText+"</div>");
		} else {
			alert("Http status: " + xhr.status + " " + xhr.statusText + "\najaxOptions: " + ajaxOptions + "\nthrownError:"+thrownError + "\n" +xhr.responseText);
		}
	},
	ajaxDone:function (json){
		if(json.statusCode == DWZ.statusCode.error) {
			if(json.message && alertMsg) alertMsg.error(json.message);
		} else if (json.statusCode == DWZ.statusCode.timeout) {
			if(json.message && alertMsg) alertMsg.error(json.message, {okCall:DWZ.loadLogin});
			else loadLogin();
		} else {
			if(json.message && alertMsg) alertMsg.correct(json.message);
		};
	}
};

(function($){
	$.extend(String.prototype, {
		isPositiveInteger:function(){
			return (new RegExp(/^[1-9]\d*$/).test(this));
		},
		isInteger:function(){
			return (new RegExp(/^\d+$/).test(this));
		},
		isNumber: function(value, element) {
			return (new RegExp(/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/).test(this));
		},
		trim:function(){
			return this.replace(/(^\s*)|(\s*$)|\r|\n/g, "");
		},
		trans:function() {
			return this.replace(/&lt;/g, '<').replace(/&gt;/g,'>').replace(/&quot;/g, '"');
		},
		replaceAll:function(os, ns) {
			return this.replace(new RegExp(os,"gm"),ns);
		},
		replaceAll:function(os, ns) {
			return this.replace(new RegExp(os,"gm"),ns);
		},
		replaceTm:function($data) {
			if (!$data) return this;
			return this.replace(RegExp("({[A-Za-z_]+[A-Za-z0-9_]*})","g"), function($1){
				return $data[$1.replace(/[{}]+/g, "")];
			});
		},
		replaceTmById:function(_box) {
			var $parent = _box || $(document);
			return this.replace(RegExp("({[A-Za-z_]+[A-Za-z0-9_]*})","g"), function($1){
				var $input = $parent.find("#"+$1.replace(/[{}]+/g, ""));
				return $input.size() > 0 ? $input.val() : $1;
			});
		},
		isFinishedTm:function(){
			return !(new RegExp("{[A-Za-z_]+[A-Za-z0-9_]*}").test(this)); 
		},
		skipChar:function(ch) {
			if (!this || this.length===0) {return '';}
			if (this.charAt(0)===ch) {return this.substring(1).skipChar(ch);}
			return this;
		},
		/**
		 * check if Valid password
		 */
		isValidPwd:function() {
			return (new RegExp(/^([_]|[a-zA-Z0-9]){6,32}$/).test(this)); 
		},
		/**
		 * check if Valid email
		 */
		isValidMail:function(){
			return(new RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test(this.trim()));
		},
		isSpaces:function() {
			for(var i=0; i<this.length; i+=1) {
				var ch = this.charAt(i);
				if (ch!=' '&& ch!="\n" && ch!="\t" && ch!="\r") {return false;}
			}
			return true;
		},
		isPhone:function() {
			return (new RegExp(/(^([0-9]{3,4}[-])?\d{3,8}(-\d{1,6})?$)|(^\([0-9]{3,4}\)\d{3,8}(\(\d{1,6}\))?$)|(^\d{3,8}$)/).test(this));
		},
		isURL:function(){
			return (new RegExp(/^[a-zA-z]+:\/\/(\w+(-\w+)*)(\.(\w+(-\w+)*))*(\?\S*)?$/).test(this)); 
		}
	});

	$.fn.extend({
		loadUrl: function(url,data,callback){
			var $this = $(this);
			$.ajax({
				type: 'POST',
				url: url,
				cache: false,
				data: data,
				success: function(html){
					$this.html(html).initUI();
					if ($.isFunction(callback)) callback();
				},
				error: DWZ.ajaxError
			});
		},
		initUI: function(){
			return this.each(function(){
				if($.isFunction(initUI)) initUI(this);
			});
		},
		loadCss:function(url, callback) {
			var $this = $(this);
			$.ajax({
				type:'POST',
				url:url,
				cache:false,
				success:function(html) {
					callback(html);
				}
			});
		},
		hoverClass: function(className){
			var _className = className || "hover";
			return this.each(function(){
				$(this).hover(function(){
					$(this).addClass(_className);
				},function(){
					$(this).removeClass(_className);
				});
			});
		},
		focusClass: function(className){
			var _className = className || "focus";
			return this.each(function(){
				$(this).focus(function(){
					$(this).addClass(_className);
				}).blur(function(){
					$(this).removeClass(_className);
				});
			});
		},
		inputAlert: function(){
			return this.each(function(){
				
				var $this = $(this);
				
				function getAltBox(){
					return $this.parent().find("label.alt");
				}
				function altBoxCss(opacity){
					if ($this.is(":hidden")) return {};
					
					var position = $this.position();
					return {
						width:$this.width(),
						top:position.top+'px',
						left:position.left +'px',
						opacity:opacity || 1
					}
				}
				if (!$this.val() && getAltBox().size() < 1) {
					if (!$this.attr("id")) $this.attr("id", $this.attr("name") + "_" +Math.round(Math.random()*10000));
					$('<label class="alt" for="'+$this.attr("id")+'">'+$this.attr("alt")+'</label>').appendTo($this.parent()).css(altBoxCss(1));
				}
				$this.focus(function(){
					getAltBox().css(altBoxCss(0.3));
				}).blur(function(){
					if (!$(this).val()) getAltBox().show().css("opacity",1);
				}).keydown(function(){
					getAltBox().hide();
				});		
			});
		},
		isTag:function(tn) {
			if(!tn) return false;
			return $(this)[0].tagName.toLowerCase() == tn?true:false;
		}
	});
	
})(jQuery);
