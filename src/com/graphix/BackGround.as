package com.graphix
{
	import flash.display.GradientType;
	import flash.display.InterpolationMethod;
	import flash.display.Shape;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BlurFilter;
	import flash.geom.Matrix;
	import flash.utils.Timer;
	
	
	public class BackGround extends Sprite
	{
		//target Colors
		public var redOut:int = 255;
		public var greenOut:int = 255;
		public var blueOut:int = 255;
		
		public var redIn:int = 255;
		public var greenIn:int = 255;
		public var blueIn:int = 255;
		
		//currentColors
		private var curRedOut:int = 0;
		private var curGreenOut:int = 0;
		private var curBlueOut:int = 0;
		
		private var curRedIn:int = 0;
		private var curGreenIn:int = 0;
		private var curBlueIn:int = 0;
		//main BG
		private var backgroundObj:Shape = new Shape();
		
		//properties		
		private var type:String = GradientType.RADIAL; 
		private var alphas:Array = [1, 1]; 
		private var focalPtRatio:Number = 5;
		
		//Timer
		//private var changeTimer:Timer = new Timer(50);
		
		public function BackGround()
		{
			this.addEventListener(Event.REMOVED_FROM_STAGE,deconstruct);
			this.addEventListener(Event.ADDED_TO_STAGE,initialize);
		}//end of constructor
		
		public function drawRadial():void
		{
			this.addChild(backgroundObj);
			backgroundObj.cacheAsBitmap = true;
			//Initialize();
		}//end of function
		
		private function initialize(evt:Event):void
		{			
			this.addEventListener(Event.ENTER_FRAME,update);
		}//end of function initialize
		/*
		private function Initialize():void
		{
			changeTimer.addEventListener(TimerEvent.TIMER,update);
			changeTimer.start();
		}//end of function Initialize
		*/
		private function changeBGcolor():Array
		{
			var colorArr:Array = new Array();
			var targetOut:uint = getColor(redOut,greenOut,blueOut);
			var targetIn:uint = getColor(redIn,greenIn,blueIn);
			var curOut:uint = getColor(curRedOut,curGreenOut,curBlueOut);
			var curIn:uint = getColor(curRedIn,curGreenIn,curBlueIn);			
			
			if(targetOut!=curOut && targetIn!=curIn)
			{
				curRedOut = median(curRedOut,redOut);
				curGreenOut = median(curGreenOut,greenOut);
				curBlueOut = median(curBlueOut,blueOut);
				
				curRedIn = median(curRedIn,redIn);
				curGreenIn = median(curGreenIn,greenIn);
				curBlueIn = median(curBlueIn,blueIn);
				
				curOut = getColor(curRedOut,curGreenOut,curBlueOut);
				curIn = getColor(curRedIn,curGreenIn,curBlueIn);				
			}//end of if statement
			
			colorArr = [curOut,curIn];			
			return colorArr;
		}//end of function changeBGcolor

		private function median(val1:int = 0,val2:int = 0):int
		{
			var val:int = val1;
			if(val1>val2)
				val = val1-Math.ceil((val1-val2)/10);
			else
				val = val2-Math.ceil((val2-val1)/10);
			return val;
		}//end of function

		private function update(evt:Event):void
		{						
			var colors:Array = changeBGcolor();//[0xFFAA12, 0x000088]; 
			
			var matrix:Matrix = new Matrix(); 
			var boxWidth:Number = parent.stage.stageWidth; 
			var boxHeight:Number = parent.stage.stageHeight; 
			var boxRotation:Number = Math.PI/2; // 90° 
			var tx:Number = 0; 
			var ty:Number = 0; 
			matrix.createGradientBox(boxWidth, boxHeight, boxRotation, tx, ty); 
			
			backgroundObj.graphics.clear();
			
			backgroundObj.graphics.beginGradientFill(type,  
				colors, 
				alphas, 
				[0,0xFF],  
				matrix,  
				SpreadMethod.PAD,  
				InterpolationMethod.RGB,  
				focalPtRatio); 
			backgroundObj.graphics.drawRect(0, 0, parent.stage.stageWidth, parent.stage.stageHeight); 
			backgroundObj.filters=[new BlurFilter(5,5,10)];
			
			backgroundObj.graphics.endFill();
			
		}//end of function update
		
		private function getColor(r:int = 0,g:int = 0,b:int = 0):uint
		{
			var resultColor:uint;			
			resultColor = r<<16 | g<<8 | b;
			return resultColor;
		}//end of function getColor
			
		private function deconstruct(e:Event):void
		{			
			//changeTimer.stop();
			this.removeEventListener(Event.ENTER_FRAME,update);
		}//end of function deconstruct
		
	}//end of class
}//end of package