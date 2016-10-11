package com.menu
{
	import flash.display.GradientType;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.SpreadMethod;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.net.URLRequest;
	
	public class MainMenu extends MovieClip
	{		
		
		private var products:MenuItem = new MenuItem();
		private var prodPage:productPage = new productPage();
		//private var fragrance:MenuItem = new MenuItem();
				
		public function MainMenu()
		{
			super();
						
			products.menuName = "PRODUCTS";
			//fragrance.menuName = "FRAGRANCE";	
			
			products.addEventListener(MouseEvent.CLICK,showProducts);
			
			this.addEventListener(Event.ADDED_TO_STAGE,drawMenu);
		}//end of constructor
		
		private function showProducts(e:MouseEvent):void
		{
			parent.stage.addChild(prodPage);
		}//end of function showProducts
		
		private function drawMenu(e:Event):void
		{
			var fillType:String = GradientType.LINEAR;
			var colors:Array = [0x000000, 0xFFFFFF];
			var alphas:Array = [.3, 0];
			var ratios:Array = [0x00, 0x20];
			var matr:Matrix = new Matrix();
			matr.createGradientBox(parent.stage.stageWidth,150, -Math.PI/2, 0, 0);
			var spreadMethod:String = SpreadMethod.PAD;
			this.graphics.beginGradientFill(fillType, colors, alphas, ratios, matr, spreadMethod); 
			this.graphics.drawRect(0,0,parent.stage.stageWidth,155);
			this.graphics.endFill();
			
			var imageLoader:Loader = new Loader();
			var image:URLRequest = new URLRequest("imgs/logo.png");
			imageLoader.load(image);
			addChild (imageLoader);
			imageLoader.x = 15;
			imageLoader.y = 0;
			imageLoader.scaleX = .5;
			imageLoader.scaleY = .5;
			
			addMenuItems();
		}//end of function drawMenu
	
		private function addMenuItems():void
		{
			this.addChild(products);
			//this.addChild(fragrance);
			
			products.x = 260;
			products.y = 85;
			/*
			fragrance.x = 480;
			fragrance.y = 85;
			*/
		}//end of function addMenuItems
		
		
		
	}//end of class
}//end of package