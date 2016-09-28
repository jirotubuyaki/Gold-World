package {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.media.*;
	import flash.geom.*;
	import flash.media.Sound; 
	import flash.media.SoundChannel;
	import flash.text.*;

	public class Element extends Sprite{
		
		public var f:int = 115;
		public var main:Object;
		public var center_x:Number = 0;
		public var center_y:Number = 0;
		public var center_z:Number = 0;
		public var point_x:Array = new Array();
		public var point_y:Array = new Array();
		public var point_z:Array = new Array();
		public var move_x:Array = new Array();
		public var move_y:Array = new Array();
		public var move_z:Array = new Array();
		public var line_obj:Array = new Array();
		public var angle_x:Number=0;
		public var angle_y:Number=0;
		public var angle_z:Number=0;
		public var angle_center_x:Number=0;
		public var angle_center_y:Number=0;
		public var angle_center_z:Number=0;
		public var move_center_x:Number;
		public var move_center_y:Number;
		public var move_center_z:Number;
		public var element:Shape;
		public var line:Shape;
		public var graph_line:Shape;
		public var axi_x:Shape;
		public var axi_y:Shape;
		public var i:int;
		public var z_z:int=0;
		public var text_field:TextField;
		public var text_field2:TextField;
		public var text_field3:TextField;
		public var text_field4:TextField;
		public var text_field5:TextField;
		public var color:uint;
		public var point:String;
		public var n:int;
		public var m:int;
		
		public function Element(main_input:Object,angle_x_input:Number,angle_y_input:Number,angle_z_input:Number,x_input:Number,y_input:Number){
			main = main_input;
			
			center_x = main.stage.stageWidth/2;
			center_y = main.stage.stageHeight/2;
			
			angle_x = angle_x_input;
			angle_y = angle_y_input;
			angle_z = angle_z_input;
			
			m = x_input;
			n = y_input;
			
			point_x[0] = 0;
			point_y[0] = 0;
			point_z[0] = 120;
			
			point_x[1] = -2.3;
			point_y[1] = -2.3;
			point_z[1] = 120;
			
			point_x[2] = 2.3;
			point_y[2] = -2.3;
			point_z[2] = 120;
		
			point_x[3] = 2.3;
			point_y[3] = 2.3;
			point_z[3] = 120;
			
			point_x[4] = -2.3;
			point_y[4] = 2.3;
			point_z[4] = 120;
			
			point_x[5] = 0;
			point_y[5] = 0;
			point_z[5] = 0;
			
			center_x = 0;
			center_y = 0;
			center_z = 0;
			
			point_x[6] = -500;
			point_y[6] = 0;
			point_z[6] = 0;
			
			point_x[7] = 500;
			point_y[7] = 0;
			point_z[7] = 00;
			
			point_x[8] = 0;
			point_y[8] = -500;
			point_z[8] = 0;
			
			point_x[9] = 0;
			point_y[9] = 500;
			point_z[9] = 0;
			
			element = new Shape();
			element.graphics.beginFill(0xFFFFE0,1.0);
			element.graphics.moveTo(point_x[1] + center_x,point_y[1] + center_y);
		 	element.graphics.lineTo(point_x[2] + center_x,point_y[2] + center_y);
			element.graphics.lineTo(point_x[3] + center_x,point_y[3] + center_y);
			element.graphics.lineTo(point_x[4] + center_x,point_y[4] + center_y);
			element.graphics.endFill();
			
			main.addChild(element);
	   	
			graph_line = new Shape();
			graph_line.graphics.lineStyle(0.1,color,0.2);
			graph_line.graphics.moveTo(0,0);
		 	graph_line.graphics.lineTo(1,1);
					
			main.addChild(graph_line);
			
			this.addEventListener(Event.ENTER_FRAME,act);
		}
		public function act(e:Event):void{
			angle_x = (angle_x + (mouseY-main.stage.stageHeight/2) /700) % 360;
			angle_y = (angle_y + (mouseX-main.stage.stageWidth/2) /700) % 360;
			angle_z = 0;

			for(i=0;i<6;i++){
				move_x[i] = point_x[i];
				move_y[i] = point_y[i] * Math.cos(angle_x * Math.PI/180) + point_z[i] * Math.sin(angle_x * Math.PI/180);
				move_z[i] = -1 * point_y[i] * Math.sin(angle_x * Math.PI/180) + point_z[i] * Math.cos(angle_x * Math.PI/180);
				
				move_x[i] = move_x[i] * Math.cos(angle_y * Math.PI/180)  + (-1) * move_z[i] * Math.sin(angle_y * Math.PI/180);
				move_y[i] = move_y[i];
				move_z[i] = move_x[i] * Math.sin(angle_y * Math.PI/180) + move_z[i] * Math.cos(angle_y * Math.PI/180);
				
				move_x[i] = move_x[i] * Math.cos(0 * Math.PI/180) + move_y[i] * Math.sin(0 * Math.PI/180);
				move_y[i] = -1 * move_x[i] * Math.sin(0 * Math.PI/180) + move_y[i] * Math.cos(0 * Math.PI/180);
				move_z[i] = move_z[i];

			}
			move_center_x = center_x;
			move_center_y = center_y * Math.cos(angle_center_x * Math.PI/180) + center_z * Math.sin(angle_center_x * Math.PI/180);
			move_center_z = -1 * center_y * Math.sin(angle_center_x * Math.PI/180) + center_z * Math.cos(angle_center_x * Math.PI/180);
				
			move_center_x = move_center_x * Math.cos(angle_center_y * Math.PI/180)  + (-1) * move_center_z * Math.sin(angle_center_y * Math.PI/180);
			move_center_y = move_center_y;
			move_center_z = move_center_x * Math.sin(angle_center_y * Math.PI/180) + move_center_z * Math.cos(angle_center_y * Math.PI/180);
				
			move_center_x = move_center_x * Math.cos(0 * Math.PI/180) + move_center_y * Math.sin(0 * Math.PI/180);
			move_center_y = -1 * move_center_x * Math.sin(0 * Math.PI/180) + move_center_y * Math.cos(0 * Math.PI/180);
			move_center_z = move_center_z;
			
			element.graphics.clear();
			element.graphics.beginFill(0xffffa8,1.0);
			element.graphics.moveTo(move_x[1]/((move_center_z+300)/240),move_y[1]/((move_center_z+300)/240));
			element.graphics.lineTo(move_x[2]/((move_center_z+300)/240),move_y[2]/((move_center_z+300)/240));
			element.graphics.lineTo(move_x[3]/((move_center_z+300)/240),move_y[3]/((move_center_z+300)/240));
			element.graphics.lineTo(move_x[4]/((move_center_z+300)/240),move_y[4]/((move_center_z+300)/240));
			element.graphics.lineTo(move_x[1]/((move_center_z+300)/240),move_y[1]/((move_center_z+300)/240));
			element.graphics.endFill();
		
			element.x = move_center_x + main.stage.stageWidth/2;
			element.y = move_center_y + main.stage.stageHeight/2
						
			graph_line.graphics.clear();
				graph_line.graphics.lineStyle(1,0xFFFFE0,1);
			var my_matrix:Matrix = new Matrix();
			my_matrix.createGradientBox(200,150,0,75,75);
			var colors:Array = [0xa6ab36,0xdddddd,0x000000];
			var alphas:Array = [10,10,100];
			var ratios:Array = [0,50,80];
			graph_line.graphics.lineGradientStyle(GradientType.RADIAL,colors,alphas,ratios);

			graph_line.graphics.moveTo(move_x[0]/((move_center_z+300)/240),move_y[0]/((move_center_z+300)/240));
			graph_line.graphics.lineTo(move_x[5]/((move_center_z+300)/240),move_y[5]/((move_center_z+300)/240));

			graph_line.x = move_center_x + main.stage.stageWidth/2;
			graph_line.y = move_center_y + main.stage.stageHeight/2
		}
		public function Line():void{
			for(i=0;i<10;i++){
				line = new Shape();
				line.graphics.lineStyle(0.1,0x00008b,0.4);
				line.graphics.moveTo(move_x[0] + center_x,move_y[0] + center_y);
				line.graphics.lineTo(main.element_obj[i].move_x[0] + center_x,main.element_obj[i].move_y[0] + center_y);
					
				main.addChildAt(line,0);
				line_obj.push(line);
			}
		}
	}
}