package com.products
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class productItem extends MovieClip
	{
		public var xmlString:String = "";
		public var brandName:String = "Brand Name";
		public var productName:String = "Product Name";
		public var productPrice:Number = 0;
		public var imageLink:String = "";
		public var description:String = "";
		public var about:String = "";		
		public var image:Loader = new Loader();
		public var bitmapData:BitmapData = null;
		public var webLink:String = "";
		
		public var redIn:int = 0;
		public var greenIn:int = 0;
		public var blueIn:int = 0;
		
		public var redOut:int = 0;
		public var greenOut:int = 0;
		public var blueOut:int = 0;
		
		private var loader:URLLoader = new URLLoader();
		private var imgLoader:Loader = new Loader();
				
		public function productItem(xmlData:String = "")
		{
			xmlString = xmlData;
			super();
						
			loader.addEventListener(Event.COMPLETE,loadXMLData);
			
			imgLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,applyBitmap);
			
		}//end of function productItem - Constructor
		
		private function applyBitmap(e:Event):void
		{
			var bitmap:Bitmap = e.target.content;
			bitmapData = bitmap.bitmapData;
			// remove listener
			e.target.removeEventListener(Event.COMPLETE, applyBitmap);
		}
		
		public function initilizeLoad():void
		{
			loader.load(new URLRequest(xmlString));
		}//end of function initializeLoad
		
		private function loadXMLData(evt:Event):void
		{
			var xml:XML = new XML(evt.target.data);
			brandName = xml.item.brand;
			productName = xml.item.name;
			productPrice = xml.item.price;	
			imageLink = xml.item.imageLocation;
			description = xml.item.details;
			about = xml.item.about;
			webLink = xml.item.weblink;
			
			redIn = xml.item.colorIn.@red;
			greenIn = xml.item.colorIn.@green;
			blueIn = xml.item.colorIn.@blue;
			
			redOut = xml.item.colorOut.@red;
			greenOut = xml.item.colorOut.@green;
			blueOut = xml.item.colorOut.@blue;
			
			imgLoader.load(new URLRequest(imageLink));
			image.load(new URLRequest(imageLink));
			image.scaleX = .5;
			image.scaleY = .5;
			Sephora.productsList.push(this);
		}//end of function loadXMLdata
		
	}//end of class
}//end of package