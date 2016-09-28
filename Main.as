package {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.media.*;
	import flash.media.Sound; 
	import flash.media.SoundChannel;
	import flash.text.*;

	public class Main extends Sprite{
	
		public var state:String = "intro";
		public var element_obj:Array = new Array();
		public var element:Object;
		public var map:Array = new Array();
		public var i:int;
		public var j:int;
		public var time:int=0;
		public var element_moon_obj:Array = new Array();
		public var graph_line:Shape;
		
		public function Main(){
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			stage.align = StageAlign.TOP;
			
			for(i=1;i<25;i++){
				map[i] = new Array();
				for(j=1;j<23;j++){
					map[i][j] = "off";
				}
			}
			graph_line = new Shape();
			graph_line.graphics.lineStyle(0.1,0xffffff,0.2);
			graph_line.graphics.moveTo(0,0);
		 	graph_line.graphics.lineTo(1,1);
					
			this.addChild(graph_line);
			
			for(i=1;i<35;i++){
				for(j=1;j<30;j++){
					element = new Element(this,Math.random()*360,Math.random()*360,0,i,j);
				}
			}
		}
	}
}