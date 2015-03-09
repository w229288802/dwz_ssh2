/**
 * @author  gaozl
 */

var store_ids = new Array();
(function($){
	$.extend($.fn,{
		editCartList : function(){
			return $(">li",this).each(function(){
				store_ids.push($(this).attr("id"));
				$.ShoppingCart.bindEvent($(this));
			});
		},
		bindCartEvent : function(options){
			return this.each(function(){
				$(this).click(function(){
					$.ajax({
						url:"shoppingcart.xml",
						type:"post",
						data:"",
						dataType:"xml",
						success : function(xml){
							var $xml = $(xml);
							if($xml.find("response").attr("status") == 200){
								addToCart($(xml));
							}
						}
					});
					return false;
				});
			});
			function hasId(id){
				for(var i=0;i<store_ids.length;i++){
					if(store_ids[i] == id){
						return true;
					}
				}
				return false;
			}
			function addToCart(){
				var $item = $("item",arguments[0]);
				if(hasId($item.attr("id"))){
					$.ShoppingCart.updateItem($item.attr("id"),$item.attr("qty"),$item.attr("price"))
				}else{
					var  li = replaceToStr($item.attr("name"),$item.attr("pic"),$item.attr("description"),$item.attr("price"),$item.attr("qty"),$item.attr("id"),$item.attr("stock"));
					$.ShoppingCart.addItem($(li));
					store_ids.push($item.attr("id"));//must store the add element's id
				}
			
			}
			function replaceToStr(){
				return "<li id=\""+arguments[5]+"\"><div class=\"cartItem\">"+
						"<h3><a href=\"#\">"+arguments[0]+"</a></h3>"+
						"<div class=\"cartPic\"><a class=\"picture\" href=\"#\"><img src=\""+arguments[1]+"\" alt=\"\" width=\"50\" height=\"50\"></a></div>"+
						"<p>"+arguments[2]+"</p></div><div class=\"cartToolbar\">"+
						"<span class=\"price\" pri=\""+arguments[3]+"\"> US  $"+arguments[3]+"</span>"+
						"<a class=\"edit\" href=\"###\" num=\""+arguments[4]+"\">Edit Qty</a>"+
						"<a class=\"remove\" href=\"###\" num=\""+arguments[4]+"\">Remove</a>"+
						"<span class=\"quantity\" stock=\""+arguments[6]+"\">( Qyt:"+arguments[4]+")</span></div></li>"
			}
		}
	});
	
	/**
	 * ShoppingCart
	 */
	$.ShoppingCart = {
	    ops :{headerInfor:'.cartInner',className:'.cartInfo'},
		_changeTotalInfo : function(payment){
			var $span = $("span:odd",".totalInfo");
			$($span[0]).text("US $" + payment);
			payment = numFixed(parseFloat(payment)+parseFloat($($span[1]).attr("shprice"))+ parseFloat($($span[2]).attr("taprice")));
			$($span[3]).text("US $ " + payment);
		},
		_changeCarInfo : function(qty,payment){
			var header = $(this.ops.headerInfor,this.ops.className);
			var totalQty = numInt($(".amount",header).attr("amount"));
			var totalPayment = numFixed($(".total",header).attr("total"));
			totalQty -= qty;
			totalPayment = numFixed(totalPayment-payment);
			var text = totalQty >1 ? totalQty+" item<span>s</span>" : totalQty+" item";
			$(".amount",header).attr("amount",totalQty).html(text);
			$(".total",header).attr("total",totalPayment).text("US  $ "+totalPayment);
			this._changeTotalInfo(totalPayment);
		},
		_changeCarToolBar : function(element,qty,payment){
			payment = numFixed(payment);
			$(".price",element).attr("pri",payment).html("US $"+ payment);
			$(".edit",element).attr("num",qty).html("Edit Qty");
			$(".remove",element).attr("num",qty);
			$(".quantity",element).html("(Qyt:"+qty+")");
		},
		_getItemValue : function(element,className){
			var temp = "";
			switch(className){
				case "price":
				    temp = $(".price",element).attr("pri");
					if(!isNaN(temp)){temp = parseFloat(temp);}
				    break;
				case "edit":
				    temp = $(".edit",element).attr("num");
					if(!isNaN(temp)){temp = parseInt(temp);}
					break;
			}
			return temp;
		},
		_bindEditEvent : function(element){
			var editElement = $(".edit",element);
			$(editElement).click(function(){
				var inputs = $("<input type=\"text\" size=\"2\" style=\"height:10px;width:22px;\" value=\"\" maxlength=\"3\"/>  ");
				$(this).parent().prepend(inputs);
				$(this).hide();
				$(inputs).blur(function(){
					changeQty(this,$.ShoppingCart._getItemValue(element,"price"),editElement.attr("num"));
					editElement.show();
					$(">input",editElement.parent()).remove();
					return false;
				});
				return false;
			});
			
			function changeQty(inputs,price,resQty){
				var qty = $(inputs).val();
				var stock = $(".quantity",editElement.parent()).attr("stock");
				if(qty < 1){
					alert("number must be more than one");
					return false;
				}
				if(qty > stock){
					alert("the number must less than "+ stock);
					return false;
				}
				$.post("done.xml",{},doneCallBackEdit,'xml');
				function doneCallBackEdit(xml){
					if($(xml).find("response").attr("status") == 200){
						var unitprice = price/resQty;
						$.ShoppingCart._changeCarInfo(resQty-qty,(resQty-qty)*unitprice);
						$.ShoppingCart._changeCarToolBar(element,qty,qty*unitprice);
					}
				}
			}
		},
		_bindRemoveEvent : function(element){
			var removeElement = $(".remove",element);
			removeElement.click(function(){
				if(!confirm("Are you sure to remove ?")){return false;}
				$.post("done.xml",{},doneCallBack,'xml');
				return false;
			});
			function doneCallBack(xml){
				if($(xml).find("response").attr("status") == 200){
					var qty = numInt(removeElement.attr("num"));
					var price = numFixed($(".price",element).attr("pri"));
					$(removeElement).parent().parent().remove();//not to remove it via element
					//here can put change total mount
					$.ShoppingCart._changeCarInfo(qty,price);
				}
			}
		},
		showShoppingCart:function(){
			$(this.ops.className).addClass("openCartInfo");
		},
		updateItem : function(element,argqty,payment){
			element = $("#"+element,this.ops.className);
			if(element[0]){
				var qty = this._getItemValue($(element),"edit");
				var price = this._getItemValue($(element),"price");
				qty = qty + parseInt(argqty);
				price = price + parseFloat(payment);
				this._changeCarInfo(argqty*(-1),payment*(-1));
				this._changeCarToolBar(element,qty,price);
				this.showShoppingCart();
			}else{
				this._changeCarInfo(argqty*(-1),payment*(-1));
				this._changeCarToolBar(element,argqty,payment);
				this.showShoppingCart();
			}
		},
		bindEvent : function(element){//if element exists in container
			this._bindRemoveEvent(element);
			this._bindEditEvent(element);
		},
		hasItemList : function(){
			return $(arguments[0],this.ops.className)[0] ? true : false;
		},
		addItem : function(element){//the argument must be an object of jqury
			//change the total information
			var qty = this._getItemValue($(element),"edit");
			var price = this._getItemValue($(element),"price");
			this.updateItem(element.attr("id"),qty,price);
			//add to container
			if(this.hasItemList(".itemList")){
				$(".itemList",this.ops.className).prepend(element);
			}else{
				var ul = $("<ul class=\"itemList\"></ul>");
				$(".cartPanel",this.ops.className).prepend($(ul));
				$(ul).prepend(element);
			}
			//bind the event ,not to add event before add that will lost the event
			this.bindEvent(element);
		}
	}
})(jQuery);

function numInt(data){
	if(isNaN(data))	return 0;
	return parseInt(data);
}

function  numFixed(data){
	if(isNaN(data))  return 0;
	return parseFloat(new Number(data)).toFixed(2);
}