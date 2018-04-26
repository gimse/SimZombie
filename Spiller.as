package 
{
	import flash.display.MovieClip;
	import flash.events.Event;

	public class Spiller extends MovieClip
	{
		private const avstandNarSpillerRagererPaZombie:uint = 100;
		public var avstandZombier:Array= new Array();
		private var targetZombie:MovieClip;
		private var retningTargetZombie:Number;
		private var v_x_spiller:Number;
		private var v_y_spiller:Number;
		private var rostasjon_rad:Number;
		private var x_v_FraZombier:Array=new Array();
		private var y_v_FraZombier:Array=new Array();
		private var total_x_v_FraZombier:Number = 0;
		private var total_y_v_FraZombier:Number = 0;
		private var iVegger:Array=[false,false,false,false];
		
		private var gunNedKjoling:uint=200*Math.random();
		private const gunNedKjolingMax=150;


		public function Spiller()
		{
			addEventListener(Event.ENTER_FRAME, spillermovement);
		}
		public function koludert(vegg){
			iVegger[vegg]=true;
		}
		function spillermovement(evt:Event)
		{
			//finn den nermeste zombien
			var minstetall:Number = Math.min.apply(null,avstandZombier);
			for (var s:uint=0; s<avstandZombier.length; s++)
			{
				if (minstetall == avstandZombier[s])
				{
					targetZombie = MovieClip(parent).zombier[s];
				}
				if (avstandZombier[s] < 200)
				{
					var retgningZombie:Number = Math.atan2( -  y + MovieClip(parent).zombier[s].y,MovieClip(parent).zombier[s].x - x);
					x_v_FraZombier[s]=(700/avstandZombier[s])*Math.cos(retgningZombie);
					y_v_FraZombier[s]=(700/avstandZombier[s])*Math.sin(retgningZombie);
				}
				else
				{
					y_v_FraZombier[s] = 0;
					x_v_FraZombier[s] = 0;
				}
				total_x_v_FraZombier +=  x_v_FraZombier[s];
				total_y_v_FraZombier +=  y_v_FraZombier[s];

			}
			if (targetZombie != null)
			{
				rostasjon_rad=Math.atan2(-y+targetZombie.y,targetZombie.x-x)
				
				;
				//roterer zombie om target spiller
				rotation = 180 * rostasjon_rad / Math.PI;
				
				// bruk gun
				if(gunNedKjoling==0){
					MovieClip(parent).addKule(MovieClip(this));
					gunNedKjoling=gunNedKjolingMax+Math.random()*100;
				}
				else{
					gunNedKjoling--;
				}


			}
			v_x_spiller=total_x_v_FraZombier
			v_y_spiller=total_y_v_FraZombier
			//kjekker om den er i en vegg
			if((iVegger[0]==true && v_x_spiller<0) || (iVegger[2]==true && v_x_spiller>0)){
				v_x_spiller=0;
			}
			if((iVegger[1]==true && v_y_spiller<0) || (iVegger[3]==true && v_y_spiller>0)){
				v_y_spiller=0;
			}
			x -=  v_x_spiller;
			y -=  v_y_spiller;
			
			//nullstiller om den er i vegg
			iVegger=[false,false,false,false];
			total_x_v_FraZombier=0;
			total_y_v_FraZombier=0;
			
			//kjyting på zombie
		}
	}
}