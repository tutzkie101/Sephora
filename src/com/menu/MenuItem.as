package com.menu
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class MenuItem extends Sprite
	{
		
		public var menuName:String = "";
		
		private var textF:TextField = new TextField();
		
		public function MenuItem()
		{
			super();
			this.addEventListener(Event.ADDED,drawBtn);
			
			
			this.addEventListener(Event.REMOVED,deconstruct);
		}//end of constructor
		
		private function drawBtn(e:Event):void
		{
			this.graphics.beginFill(0x000000);
			this.graphics.drawRect(0,0,200,50);
			this.graphics.endFill();			
			
			var tFormat:TextFormat = new TextFormat();
			tFormat.align = TextFormatAlign.CENTER;
			tFormat.size = 30;
			tFormat.font = "calibri";
			
			textF.text = menuName;
			textF.textColor = 0xFFFFFF;
			textF.selectable = false;
			textF.defaultTextFormat = tFormat;
			textF.wordWrap = true;
			textF.width = 200;
			this.addChild(textF);
			
			
			this.removeEventListener(Event.ADDED,drawBtn);
		}//end of function drawBrn
		
		private function deconstruct(e:Event):void
		{

		}//end of function deconstruct
		
	}//end of class
}//end of package