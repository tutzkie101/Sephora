package com.menu
{
	import com.products.productItem;
	import com.products.productView;
	import com.greensock.*;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class productPage extends Sprite
	{	
		public var products:Array = new Array();
						
		private var nextProduct:Sprite = new Sprite();
		private var prevProduct:Sprite = new Sprite();
		private var closeMe:MenuItem = new MenuItem();
		private var prodLoc:int = 0;//product view location index
		private var lastProd:productView = null;//reference for the last product opened
		
		public function productPage()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,drawProducts);
			
			closeMe.menuName = "BACK";
			closeMe.x = 875;
			closeMe.y = 90;
			closeMe.addEventListener(MouseEvent.CLICK,closeThis);
			
			nextProduct.addEventListener(MouseEvent.CLICK,nextProd);
			prevProduct.addEventListener(MouseEvent.CLICK,prevProd);
			
			nextProduct.buttonMode = true;
			prevProduct.buttonMode = true;
			
		}//end of constructor
		
		public function loadProducts():void
		{
			var itemLen:int = Sephora.productsList.length;
			var prodLeng:int = products.length;
			if(itemLen>prodLeng)
			{
				for (var j:int = 0;j<itemLen;j++)
				{
					var plvi:productView = new productView();
					plvi.sourceProduct = Sephora.productsList[j];
					
					if(!checkDup(Sephora.productsList[j]))
					{
						products.push(plvi);			
						
					}//end of if
				}//end of for loop	
			}//end of if statement
			
		}//end of function load products
		
		private function checkDup(prod:productItem):Boolean
		{			
			for each(var prodI:productView in products)
			{
				if(prodI.sourceProduct.name == prod.name)
					return true;
			}//end of for loop
			
			return false;
		}//end of function
		
		private function nextProd(evt:Event):void
		{
			if(prodLoc<products.length-1)
			{
				prodLoc++;
				prevProduct.alpha = 1;
			}//end of if statement
			
			if(prodLoc>=products.length-1)
				nextProduct.alpha = 0;

			drawProduct();
		}//end of function nextProd
		
		private function prevProd(evt:Event):void
		{
			if(prodLoc>0)
			{
				prodLoc--;
				nextProduct.alpha = 1;
			}//end of if statement
			
			if(prodLoc<=0)
				prevProduct.alpha = 0;
			
			drawProduct();
		}//end of function prevProd
		
				
		private function drawProducts(e:Event):void
		{
			loadProducts();
			this.graphics.clear();
			this.graphics.beginFill(0x000000);
			this.graphics.drawRect(0,0,parent.stage.stageWidth,parent.stage.stageHeight);
			this.graphics.endFill();
							
			this.addChild(closeMe);
			
			drawButtons();
			drawProduct();
		}//end of function drawProducts
		
		private function drawProduct(prod:productItem = null):void
		{
			if(prod==null)//if null draw first product
			{
				if(products.length>0)
				{
					if(lastProd!=null && lastProd.parent!=null)
						this.removeChild(lastProd);
					
					lastProd = (products[prodLoc] as productView);					
					this.addChild(lastProd);		
					lastProd.alpha = 0.7;
					TweenLite.to(lastProd, .5, {alpha:1});
					
				}//end of if			
				
			}else //else draw selected one
			{				
				if(lastProd.parent!=null)
					this.removeChild(lastProd);
				for (var i:int = 0; i<products.length;i++)
				{
					if((products[i] as productView).sourceProduct == prod)
					{
						prodLoc = i;
						break;
					}//end of if statemetn
				}//end of for loop
				
				lastProd = (products[prodLoc] as productView);						
				this.addChild(lastProd);
				lastProd.alpha = 0.7;
				TweenLite.to(lastProd, .5, {alpha:1});
			}//end of if else
			
			//disable buttons if either end is reached
			if(prodLoc==0)
				prevProduct.alpha = 0;
			if(prodLoc==products.length)
				nextProduct.alpha = 0;
			
			//make sure they are always on top
			this.addChild(prevProduct);
			this.addChild(nextProduct);				
			this.addChild(closeMe);
			
		}//end of function
		
		private function drawButtons():void
		{
			
			//draw prev button
			prevProduct.graphics.clear();
			prevProduct.graphics.beginFill(0x0000000,.5);
			prevProduct.graphics.lineStyle(1,0xFFFFFF,.5);
			prevProduct.graphics.moveTo(120,200);
			prevProduct.graphics.lineTo(30,450);			
			prevProduct.graphics.lineTo(120,700);
			prevProduct.graphics.endFill();
			
			//draw prev button
			nextProduct.graphics.clear();
			nextProduct.graphics.beginFill(0x000000,0.5);
			nextProduct.graphics.lineStyle(1,0xFFFFFF,0.5);
			nextProduct.graphics.moveTo(1180,200);
			nextProduct.graphics.lineTo(1270,450);			
			nextProduct.graphics.lineTo(1180,700);
			nextProduct.graphics.endFill();
			
			this.addChild(prevProduct);
			this.addChild(nextProduct);
			
		}//end of function drawButtons		
		
		
		private function closeThis(e:MouseEvent):void
		{			
			parent.removeChild(this);
		}//end of function closeMe
	
	}//end of class
}//end of package