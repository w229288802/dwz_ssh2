/**
 * @author Roger Wu
 * @version 1.0
 * @param {Object} $.fn
 * @param {Object} {searchBox}
 */
(function($){
	$.extend($.fn, {
		searchBox:function() {
			var $this = $(this).click(function(){
				return false;
			});
			var aBox = $(".advancedDrawer", $this);
			var hideBox = function(){
				aBox.jBlindUp({call:function(){
					$("form", $this).removeClass("searchOpen");
				}});
				$(document).unbind("click",hideBox);
				$("input", aBox).each(function(){
					var $this = $(this);
					$this.val("");
					if($this.attr("name") != "priceTo"){
						$this.prev().text($this.data("label"));
					}
				});
			}
			$(".advancedButton", $this).click(function(){
				if (aBox.is(":hidden")) {
					$("form", $this).addClass("searchOpen");
					aBox.jBlindDown();
					$(document).click(hideBox);
				} else {
					hideBox();
				}
				return false;
			});
			$("input", $this).not("input[name=priceTo]").each(function(){
				var input = $(this);
				input.data("label", input.prev().text());
				if(input.val().trim() != "") input.prev().text("");
				input.focus(function(){
					input.prev().text("");
				}).blur(function(){
					if(input.val().trim() == ""){
						input.prev().text(input.data("label"));
					}
				});
			});
			$("button.searchSubmit", $this).click(function(){
				if(aBox.is(":hidden")){
					var key = $("input[name=keywords]");
					if (key.val().trim() == "") {
						alert(key.prev().text() + " is required!");
						key[0].focus();
						return false;
					}
				} else {
					var submit = false;
					$("input", $this).each(function(){
						if ($(this).val().trim() != "")
							submit = true;
					});
					if(!submit) {
						$("select", $this).each(function(){
							if ($(this).val().trim() != "")
								submit = true;
						});
					}
					if (!submit) {
						alert("Warning: Your Search Criteria is empty!");
						return false;
					}
					var priceF = $("input[name=priceFrom]", $this).val().trim();
					var priceT = $("input[name=priceTo]",$this).val().trim();
					if(priceF != "" && priceT !="" && parseFloat(priceT) < parseFloat(priceF)){
						alert("Warning: Price to must be greater than Price From!");
						$("input[name=priceTo]",$this)[0].select();
						return false;
					}
				}
				$("form", $this)[0].submit();
			});
		}
	});
})(jQuery);

