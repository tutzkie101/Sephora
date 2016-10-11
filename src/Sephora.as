
package
{	
	[SWF(width="1300", height="900", backgroundColor="#FFFFFF", frameRate="60")]
	[Embed(source="fonts/calibri.ttf", fontFamily="calibri", embedAsCFF="false")]
	
	import com.graphix.BackGround;
	import com.menu.MainMenu;
	import com.menu.homePageProducts;
	import com.products.productItem;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Sephora extends MovieClip
	{
		public static var productsList:Array = new Array();
		
		public var backGround:BackGround = new BackGround();
		public var mainMenu:MainMenu = new MainMenu();
		public var homePage:homePageProducts = new homePageProducts();
		
		//private var loader:URLLoader = new URLLoader();
		private var itemXML:Array = ["AquaDiGio.xml","DylanBlue.xml","NirvanaBourbon.xml","OudWood.xml","Suavage.xml"];//if this was done with an apache server then i could dynamically load the xml data through php, for now its static
		
		public function Sephora()
		{		
			//assign sephora so it can be referenced
			homePage.controller = this;
			
			initializeComponents();//initialize the visuals	
			populateItems();
			//loader.addEventListener(Event.COMPLETE,addItemOnList);
			//loader.load(new URLRequest("sephoraProducts/productXmldata/"+itemXML.pop()));//load the items
			
			stage.addEventListener(MouseEvent.CLICK,changeColor);//test stuff
			
		}//end of constructor
		
		private function changeColor(e:MouseEvent):void
		{
			backGround.redIn = Math.random()*255;
			backGround.greenIn = Math.random()*255;
			backGround.blueIn = Math.random()*255;
			
			backGround.redOut = Math.random()*255;
			backGround.greenOut = Math.random()*255;
			backGround.blueOut = Math.random()*255;
		}//end of test function
		
		private function initializeComponents():void
		{			
			//initialize the background
			stage.addChild(backGround);
			backGround.drawRadial();
			backGround.alpha = .3;
			//initializing main menu
			stage.addChild(mainMenu);
			stage.addChild(homePage);
			homePage.y = 200;
		}//end of function initializeComponents
				
		public function populateItems():void
		{
			for each(var xmlName:String in itemXML)
			{
				var prodItem:productItem = new productItem("sephoraProducts/productXmldata/"+xmlName)				
					prodItem.initilizeLoad();
			}//end of for eahc loop
			
			//homePage.drawItems();
		}//end of function populateItems
		
		
		
	}//end of class
	
}//end of package