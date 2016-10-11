package com.products
{
	import com.graphix.BackGround;
	import com.menu.MenuItem;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class productView extends MovieClip
	{
		public var backGround:BackGround = new BackGround();
				
		private var closeMe:MenuItem = new MenuItem();
		private var viewInWeb:MenuItem = new MenuItem();
		
		private var imgHolder:Sprite = new Sprite();
		
		private var priceTF:TextField = new TextField();
		private var nameTF:TextField = new TextField();
		private var detailsTF:TextField = new TextField();		
		public var sourceProduct:productItem = new productItem();
		private var imageBMP:Bitmap = new Bitmap();
		
		
		public function productView()
		{
			super();
						
			closeMe.menuName = "BACK";
			closeMe.x = 875;
			closeMe.y = 90;
			closeMe.addEventListener(MouseEvent.CLICK,closeThis);
			viewInWeb.menuName = "Buy NOW";
			viewInWeb.x = 200;
			viewInWeb.y = 90;
			viewInWeb.addEventListener(MouseEvent.CLICK,openInNewTab);
			
			this.addEventListener(Event.ADDED,showItemDetails);
		}//end of constructor
						
		private function openInNewTab(evt:Event):void
		{
			var urlRequest:URLRequest = new URLRequest(sourceProduct.webLink);
			navigateToURL(urlRequest,"_blank");
		
		}//end of function openInNewTab
		
		private function showItemDetails(e:Event):void
		{			
			this.addChild(backGround);
			backGround.drawRadial();
			backGround.alpha = 1;
			backGround.redOut = sourceProduct.redOut;
			backGround.greenOut = sourceProduct.greenOut;
			backGround.blueOut = sourceProduct.blueOut;
			
			backGround.redIn = sourceProduct.redIn;
			backGround.greenIn = sourceProduct.greenIn;
			backGround.blueIn = sourceProduct.blueIn;
						
			showPicture();
			showTextData();
			
			this.addChild(closeMe);
			this.addChild(viewInWeb);
			
		}//end of function showItemDetails	
		
		private function showTextData():void
		{
			var detTFormat:TextFormat = new TextFormat();
			detTFormat.align = TextFormatAlign.JUSTIFY;
			detTFormat.size = 17;
			detTFormat.font = "calibri";
			
			this.addChild(detailsTF);
			//detailsTF.border = true;
			detailsTF.wordWrap = true;
			detailsTF.width = 500;
			detailsTF.height = 500;
			detailsTF.x = 570;
			detailsTF.y = 150;
			detailsTF.text = "\n\n\n\n\n"+sourceProduct.description + "\n\n"+sourceProduct.about;
			detailsTF.defaultTextFormat = detTFormat;
			detailsTF.selectable = false;
			
			var prodTFormat:TextFormat = new TextFormat();
			prodTFormat.align = TextFormatAlign.CENTER;
			prodTFormat.size = 20;
			prodTFormat.font = "calibri";
			prodTFormat.bold = true;
						
			this.addChild(nameTF);
			//nameTF.border = true;
			nameTF.wordWrap = true;
			nameTF.width = 350;
			nameTF.height = 70;
			nameTF.x = 200;
			nameTF.y = 510;
			nameTF.text = sourceProduct.brandName+"\n"+sourceProduct.productName;
			nameTF.defaultTextFormat = prodTFormat;
			
			this.addChild(priceTF);
			//priceTF.border = true;
			priceTF.wordWrap = true;
			priceTF.width = 350;
			priceTF.height = 40;
			priceTF.x = 200;
			priceTF.y = 560;
			priceTF.text = "$"+sourceProduct.productPrice.toString();
			priceTF.defaultTextFormat = prodTFormat;
			
		}//end of function showTextData
		
		private function showPicture():void
		{	
			imageBMP.bitmapData = sourceProduct.bitmapData;
			imageBMP.smoothing = true;
			imageBMP.scaleX = .78;
			imageBMP.scaleY = .78;
			imageBMP.x = 200;
			imageBMP.y = 150;
			this.addChild(imageBMP);
			
		}//end of function showPicture
		
		private function closeThis(e:MouseEvent):void
		{			
			parent.removeChild(this);
		}//end of function closeMe
		
	}//end of class
}//end of package