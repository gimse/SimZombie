package  {
	import flash.events.Event;
	import flash.display.MovieClip;
	
	
	public class Zombie extends MovieClip {
		public var avstandSpiller:Array=new Array;
		var targetSpiller:Spiller;
		private var v_x_zombie:Number;
		private var v_y_zombie:Number;
		private const v_zombie:Number =5;
		private var rostasjon_rad:Number;
		public function Zombie() {
			addEventListener(Event.ENTER_FRAME, zombiemovement);
		}
		function zombiemovement(evt:Event){
			//finn den nermeste spilleren
			var minstetall:Number=Math.min.apply(null, avstandSpiller);
			for(var s:uint=0;s<avstandSpiller.length;s++){
				//finner hvilken spiller det miste tallet hører til
				if(minstetall==avstandSpiller[s]){
					targetSpiller=MovieClip(parent).spillere[s];
				}
			}
		rostasjon_rad=Math.atan2(-y+targetSpiller.y,targetSpiller.x-x)
		//roterer zombie om target spiller
		rotation=180*rostasjon_rad/Math.PI;
		
		//fart
		v_x_zombie=v_zombie*Math.cos(rostasjon_rad);
		v_y_zombie=v_zombie*Math.sin(rostasjon_rad);
		
		//legger til farten(selve beveglsen
		x+=v_x_zombie;
		y+=v_y_zombie;
		}
	}
}
