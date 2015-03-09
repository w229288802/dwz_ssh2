/**
 * @author Roger Wu
 */
(function($){
	$.extend($.fn, {
		viewList:function(options){
			var tBar = $(".toolbar",$(this));
			var vlist = tBar.next();
			tBar.toolBar();
			var clazz = vlist.attr("class");
			vlist.list({clazz:clazz});
			$("fieldset.filter").filter();
		},
		toolBar:function(options) {
			return this.each(function(){
				var bar = $(this);
				var form = $("#pagerCatForm")[0];
				if(!form) return;
				var view = $(".view",bar);
				$(">dd", view).click(function(){
					$(".viewSelected",view).removeClass("viewSelected");
					$(this).addClass("viewSelected");
					var clazz = $(">a",this).attr("name");
					form.viewMark.value = clazz;
					bar.next().list({clazz:clazz});
					return false;
				});
				var num = $(".itemNumber", bar);
				$(">dd", num).click(function(){
					$(".viewSelected",num).removeClass("viewSelected");
					$(this).addClass("viewSelected");
					var pnum = parseInt($(">a", this).text());
					form.numPerPage.value = pnum;
					form.pageNum.value = 1;
					form.submit();
				});
				var sort = $(".sort select", bar);
				sort.change(function(){
					form.submit();
				});
				var pagi = $(".pagination",bar);
				var pNum = form.pageNum.value;
				var pPage = form.numPerPage.value;
				var count = parseInt(pagi.attr("totalCount"));
				var pages = parseInt(count / pPage) + 1;
				if(pages == 1) {
					pagi.hide();
					if(count < 20)
						num.hide();
				} else {
					if(pNum == 1) {
						$(".pageStart", pagi).show();
						$(".pagePre", pagi).hide();
					} else if(pNum == pages){
						$(".pageNext", pagi).hide();
						$(".pageEnd", pagi).show();
					}
					$(".pageNext", pagi).click(function(){
						form.pageNum.value = parseInt(pNum) + 1;
						form.submit();
						return false;
					});
					$(".pagePre", pagi).click(function(){
						form.pageNum.value = parseInt(pNum) - 1;
						form.submit();
						return false;
					});					
				}	
			});
		},
		list:function(options) {
			var op = $.extend({clazz:""}, options);
			var form = $("#pagerCatForm")[0];
			if(!form) return;
			var view = $(this).attr("class", op.clazz);
			var $list = $(".listCt>ul",this);
			switch(op.clazz){
				case "listView":
					$list.attr("class", "smallPic priceRight");
					$("dd.image", $list).each(function(){
						$("img",this).attr("width","100").attr("height","100");
					});
					break;
				default:
					$list.attr("class", "mediumPic");
					$("dd.image", $list).each(function(){
						$("img",this).attr("width","160").attr("height","160");
					});
					break;
			}
			var count = $(">li", $list).size();
			$(">li", $list).each(function(i){
				var item = $(this);
				if (op.clazz == "pictureView") {
					var left = (i + 1) % 4 == 0?"-70px":"-30px";
					var top = "";
					var rows = count % 4 == 0?(count / 4):parseInt((count / 4)) + 1;
					(i > (rows -1)*4)?top = "-90px":top = "-20px";
					item.mouseover(function(){
						item.addClass("itemHover largePic");
						$(">dl", item).css({
							top: top,
							left: left
						});
						$(".image img", item).attr("width", "230").attr("height", "230");
						return false;
					}).mouseout(function(){
						item.removeClass("itemHover largePic");
						$(">dl", item).css({
							top: "",
							left: ""
						});
						$(".image img", item).attr("width", "160").attr("height", "160");
						return false;
					});
				} else {
					item.unbind("mouseover").unbind("mouseout");
				}
			});
			var pagi = $(".pagination", this);
			var pNum = parseInt(form.pageNum.value);
			var pPage = parseInt(form.numPerPage.value);
			var count = parseInt(pagi.attr("totalCount"));
			var pages = parseInt(count / pPage) + 1;
			var pShown = parseInt(pagi.attr("pageNumShown"));
			if(pages == 1) {
				pagi.hide();
			} else {
				if(pNum == 1) {
					$("li.pagePre", pagi).each(function(){
						if($(">a", this)[0]) $(this).hide();
						else $("span",this).css("display","block");
					});
				} else if(pages == pNum){
					$("li.pageNext", pagi).each(function(){
						if($(">a", this)[0]) $(this).hide();
						else $("span",this).css("display","block");
					});
				}
				$("li>a", pagi).each(function(){
					var $a = $(this);
					var $li = $a.parent();
					var val = 0;
					if($li.hasClass("pagePre")){
						val = pNum - 1;
					} else if($li.hasClass("pageNext")){
						val = pNum + 1;
					} else {
						val = parseInt($a.text());
						if(val == pNum) {
							$li.addClass("selected");
						}
						if(pages > pShown){
							var lDiff = parseInt((pShown - 4) / 2);
							var rDiff = parseInt(pShown % 2)==0?lDiff - 1:lDiff;
							
							if(val > 2 && val <= pages - 2){
								var min = pNum - lDiff < (pages - pShown + 3)?pNum - lDiff:(pages - pShown + 3);
								var max = (pNum + rDiff)>pShown-2?(pNum + rDiff):pShown-2;
								if(val < min || val > max){
									if(val == min -1 || val == max + 1)
										$li.html("...");
									else
										$li.remove();
								}
							}
						}
					}
					$a.click(function(){
						form.pageNum.value = val;
						form.submit();
						return false;
					});
				});
			}
		},
		filter:function(){
			var $this  = $(this);
			$("button[type=submit]", $this).click(function(){
				var go = false;
				$("input.textInput", $this).each(function(){
					var input = $(this);
					if(input.val().trim() != "")
						go = true;
				});
				if(!go) {
					$("input[type=checkbox]", $this).each(function(){
						var box = $(this);
						if(box[0].checked)
							go = true;
					});
				}
				if(!go) {
					alert("Warning: Your Search Criteria is empty!");
					return false;
				}
				var priceF = $("input[name=priceFrom]",$this).val().trim();
				var priceT = $("input[name=priceTo]", $this).val().trim();
				if(priceF != "" && priceT != ""){
					if(parseFloat(priceT) < parseFloat(priceF)){
						alert("Warning: Price to must be greater than Price From!");
						$("input[name=priceTo]",$this)[0].select();
						return false;
					}
				}
			});
		}
	});
})(jQuery);