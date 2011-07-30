package be.newpage.utils
{
	import flash.events.TimerEvent;
	import flash.utils.Dictionary;
	import flash.utils.Timer;

	/**
	 * Helper class for delaying a function
	 * 
	 * @author Bert Wijnants / Carl Rowies - (c) Custmz 2010
	 */
	public class DelayedFunction
	{
		protected static var queue:Dictionary = new Dictionary();
		protected static var highestId:int = 1000;
				
		/**
		 * Call a function with a delay.
		 * 
		 * @param delay The delay in miliseconds
		 * @param callBack The callback function to be called after the delay.
		 * @param param1 Parameter to be passed to the callback function
		 * @param param2 Parameter to be passed to the callback function
		 * @param param3 Parameter to be passed to the callback function
		 * @param param4 Parameter to be passed to the callback function
		 * @return ID of this function call. To be used with clearTimer(ID).
		 */
		public static function call( delay:Number, callBack:Function, param1:*=null, param2:*=null, param3:*=null, param4:*=null ):int
		{
			highestId++;
			
			var timer:Timer = new Timer( delay, 1 );
			timer.addEventListener( TimerEvent.TIMER, onTimerComplete );
			timer.start();
			
			var item:Object = 	{ 	delay: delay ,
									callBack: callBack,
									param1: param1,
									param2: param2,
									param3: param3,
									param4: param4,
									id: highestId,
									timer: timer };
			queue[timer] = item;
			
			trace( "queued: " + queue[item] );
			
			return highestId;
		}
		
		protected static function onTimerComplete(e:TimerEvent):void
		{
			var item:Object = queue[e.target];
			
			var id:int = item.id;
			var callbackFunction:Function = item.callBack as Function;
			trace( "delayedFunction: " + e.target + "  " + callbackFunction );
			
			
			if 		( item.param4 != null )		callbackFunction(item.param1, item.param2, item.param3, item.param4);
			else if ( item.param3 != null )		callbackFunction(item.param1, item.param2, item.param3);
			else if ( item.param2 != null )		callbackFunction(item.param1, item.param2);
			else if ( item.param1 != null )		callbackFunction(item.param1);
			else  								callbackFunction();
						
			cancel(id);
		}
		
		public static function cancel(id:int):void
		{
			var item:Object = findItem( id );
			
			if ( item != null )
			{
				var timer:Timer = item.timer as Timer;
				timer.removeEventListener( TimerEvent.TIMER, onTimerComplete );
				
				queue[timer] = null;
				timer = null;
			}
		}
		
		protected static function findItem(id:int):Object
		{
			for each ( var o:Object in queue )
			{
				if ( o.id == id )
					return o;
			}
			
			return null;
		}
		
	}
}