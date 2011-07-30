package be.newpage.autoroute
{
	import be.newpage.utils.StageFunctions;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class Autoroute extends Sprite
	{
		public var hotspots:Array;
		public var roadsLayer:MovieClip;
		
		public function Autoroute()
		{
			roadsLayer = StageFunctions.getChildByName(this, "roads") as MovieClip;
			
			trace( "Autoroute" );
		}
	}
}