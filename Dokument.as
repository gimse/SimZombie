package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class Dokument extends MovieClip {
		//antall spillere
		var antallSpillere:uint=200;
		var spillere:Array=new Array();
		var zombier:Array = new Array();
		var vegger:Array=new Array();
		var kuler:Array=new Array();

		
		public function Dokument() {
			vegger[0]=sRIGHT;
			vegger[1]=sDOWN;
			vegger[2]=sLEFT;
			vegger[3]=sUP;
			//legg til spillerene
			for (var x:uint=0;x<antallSpillere;x++){
				var spiller:Spiller= new Spiller();
				spillere.push(spiller);
				spiller.x=Math.random()*800;
				spiller.y=Math.random()*600;
				addChild(spiller);
			}
			stage.addEventListener(MouseEvent.CLICK, leggTilZombie);
			addEventListener(Event.ENTER_FRAME, movement);
		}
		function leggTilZombie(evt:MouseEvent){
			var zombie:Zombie = new Zombie();
			zombie.x=mouseX;
			zombie.y=mouseY;
			zombier.push(zombie);
			addChild(zombie);
		}
		function movement(evt:Event){
			//finner avstanden mellom spillere og zombie
			for (var s:uint=0;s<spillere.length;s++){
				for(var z:uint=0;z<zombier.length;z++){
					//distansen mellom spillerene og zombiene. lagrers i en array
					var avstand:Number=Math.sqrt( ( zombier[z].x - spillere[s].x ) * ( zombier[z].x - spillere[s].x ) + ( zombier[z].y - spillere[s].y ) * ( zombier[z].y - spillere[s].y ) );
					spillere[s].avstandZombier[z]=avstand
					zombier[z].avstandSpiller[s]=avstand;
					//om spiller koluderer med zombie
					if(zombier[z].hitTestObject(spillere[s])){
					   spillere[s].x=Math.random()*800;
					   spillere[s].y=Math.random()*600;
					   }
				}
				//om spiller treffer veggene
				for(var v:uint=0;v<vegger.length;v++){
					if(vegger[v].hitTestPoint(spillere[s].x,spillere[s].y)){
						spillere[s].koludert(v);
					}
				}
			}
		}
		public function addKule(sMovieClip){
			var kule=new Kule();
			kule.rotation=sMovieClip.rotation;
			kule.x=sMovieClip.x;
			kule.y=sMovieClip.y;
			kuler.push(kule);
			addChild(kule);
		}
	}
}
