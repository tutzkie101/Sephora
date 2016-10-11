package com.products
{
	import com.menu.homePageProducts;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class productListViewItem extends MovieClip
	{
		public var sourceItem:productItem = new productItem();
		
		private var imgHolder:Sprite = new Sprite();
		private var prodName:TextField = new TextField();
		private var brandName:TextField = new TextField();
		private var prodPrice:TextField = new TextField();
		
		private var itemView:productView = new productView();
		
		
		public function productListViewItem()
		{
			super();
			
			this.addEventListener(Event.ADDED,showDetails);
			this.addEventListener(MouseEvent.CLICK,showProduct);
			this.addEventListener(MouseEvent.MOUSE_OVER,mOver);
			this.addEventListener(MouseEvent.MOUSE_OUT,mOut);
		}//end of constructor
		
		private function mOver(evt:MouseEvent):void
		{
			if((this.parent as homePageProducts)!=null)
			{
				var seph:Sephora = (this.parent as homePageProducts).controller;
				seph.backGround.redIn = sourceItem.redIn;
				seph.backGround.greenIn = sourceItem.greenIn;
				seph.backGround.blueIn = sourceItem.blueIn;
				
				seph.backGround.redOut = sourceItem.redOut;
				seph.backGround.greenOut = sourceItem.greenOut;
				seph.backGround.blueOut = sourceItem.blueOut;
				
			}//end of if statement
			
			
		}//end of function mOver
		
		private function mOut(evt:MouseEvent):void
		{
			if((this.parent as homePageProducts)!=null)
			{
				var seph:Sephora = (this.parent as homePageProducts).controller;
				seph.backGround.redIn = 255;
				seph.backGround.greenIn = 255;
				seph.backGround.blueIn = 255;
				
				seph.backGround.redOut = 255;
				seph.backGround.greenOut = 255;
				seph.backGround.blueOut = 255;
				
			}//end of if statement
		}//end of function mOver
		
		
		private function showProduct(e:MouseEvent):void
		{
			itemView.sourceProduct = sourceItem;
			parent.stage.addChild(itemView);
		}//end of function showProduct
		
		private function showDetails(e:Event):void
		{
			//imgHolder.graphics.beginBitmapFill();
			//imgHolder.graphics.beginFill(0x000000);
			//imgHolder.graphics.drawRect(0,0,200,250);
			//imgHolder.graphics.endFill();
			//this.addChild(imgHolder);			
			this.addChild(brandName);
			this.addChild(prodName);
			this.addChild(prodPrice);			
			
			var tFormat:TextFormat = new TextFormat();
			tFormat.align = TextFormatAlign.CENTER;
			tFormat.size = 17;
			tFormat.font = "calibri";
			
			brandName.x = 0;
			brandName.y = 240;
			brandName.text = sourceItem.brandName;
			brandName.width = 235;
			brandName.defaultTextFormat = tFormat;
			
			prodName.x = 0;
			prodName.y = 260;
			prodName.text = sourceItem.productName;
			prodName.width = 235;
			prodName.defaultTextFormat = tFormat;
			
			prodPrice.x = 0;
			prodPrice.y = 280;
			prodPrice.text = "$"+sourceItem.productPrice.toString();
			prodPrice.width = 235;
			prodPrice.defaultTextFormat = tFormat;
			
			this.addChild(sourceItem.image);
			
		}//end of function showDetails
		
	}//end of class
}//end of package