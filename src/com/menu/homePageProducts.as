package com.menu
{
	import com.products.productItem;
	import com.products.productListViewItem;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class homePageProducts extends Sprite
	{
		public var controller:Sephora = null;
		
		private var prodItems:Array = new Array();
		
		public function homePageProducts()
		{
			super();
			
			this.addEventListener(Event.ENTER_FRAME,drawItems);
		}//end of constructor
		
		public function loadItems():void
		{
			var itemLen:int = Sephora.productsList.length;
			var prodLeng:int = prodItems.length;
			if(itemLen>prodLeng)
			{
				for (var j:int = 0;j<itemLen;j++)
				{
					var plvi:productListViewItem = new productListViewItem();
					plvi.sourceItem = Sephora.productsList[j];
					
					if(!checkDup(Sephora.productsList[j]))
					{
						prodItems.push(plvi);
						
						var prodLen:int = prodItems.length;
						for(var i:int = 0;i<prodLen;i++)
						{
							this.addChild(prodItems[i]);
							prodItems[i].x = ((i%3)*300)+250;
							prodItems[i].y = (Math.floor(i/3)*350);
						}//end of for loop
						
					}//end of if
				}//end of for loop	
			}//end of if statement
		}//end of function
		
		public function drawItems(evt:Event):void
		{	
			loadItems();
			
		}//end of function drawItem
	
		private function checkDup(prod:productItem):Boolean
		{
			for each(var prodI:productListViewItem in prodItems)
			{
				if(prodI.sourceItem.name == prod.name)
					return true;
			}//end of for loop
			
			return false;
		}//end of function
		
	}//end of class
}//end of package