package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Kule extends MovieClip {
		private const fart:uint=5;
		
		public function Kule() {
			// constructor code
			addEventListener(Event.ENTER_FRAME, movement);
		}
		private function movement(evt:Event){
			x+=fart*Math.cos((rotation*Math.PI)/180);
			y+=fart*Math.sin((rotation*Math.PI)/180);
		}
	}
	
}
