package be.newpage.utils
{
	import flash.events.TimerEvent;
	
	public class DelayedTimerEvent extends TimerEvent
	{
		public var id:int;
		
		public function DelayedTimerEvent(type:String, id:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			this.id = id;
		}
		
		/*
		override public function clone():DelayedTimerEvent 
		{ 
			return new DelayedTimerEvent(type, id, bubbles, cancelable);
		} 
		
		override public function toString():String 
		{ 
			return formatToString("DelayedTimerEvent", "type", "bubbles", "cancelable", "eventPhase", "id"); 
		}
		*/
	}
}