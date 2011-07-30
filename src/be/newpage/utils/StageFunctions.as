package be.newpage.utils
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.utils.describeType;

	public class StageFunctions
	{
		/**
		 * Helper function for replacing getChildByName().  An NotFoundError is thrown when the DisplayObject is not found.
		 * 
		 * @param parent	The DisplayObjectContainer.
		 * @param name	The name of the DisplayObject to find.
		 * 
		 * @throws NotFoundException when the DisplayObject is not found.
		 * @return the DisplayObject
		 */
		public static function getChildByName(parent:DisplayObjectContainer, name:String):DisplayObject
		{
			try {
				var displayObject:DisplayObject = parent.getChildByName(name);
				
				if ( displayObject == null )
				{
					throw new Error("No DisplayObject with name " + name + " in " + parent.name + ".");
				}
				
				return displayObject;
			}
			catch(e:Error)
			{
				throw new Error("No DisplayObject with name " + name + " in " + parent.name + ".");
			}
			
			return null;
		}
		
		
		public static function listObjectDetails(o:Object):void
		{
			var description:XML = describeType(o);
			trace( description.toXMLString() );
		}
		
		
		public static function removeAllChildren(parent:DisplayObjectContainer, recursive:Boolean=true):void
		{			
			while ( parent.numChildren )
			{
				var mc:DisplayObject = parent.getChildAt(parent.numChildren-1);
				trace( "remove: " + mc + " " + mc.name );
				
				if ( recursive )	
				{
					if ( mc is DisplayObjectContainer )
						removeAllChildren( mc as DisplayObjectContainer, true );
				}
	
				parent.removeChildAt(parent.numChildren-1);
			}
		}
		
		public static function traceAllChildren(parent:DisplayObjectContainer, recursive:Boolean=true):void
		{
			trace( "traceAllChildren("+parent+")" );
			
			for ( var i:int=0; i<parent.numChildren; i++ )
			{
				var mc:DisplayObject = parent.getChildAt(i);
				trace( mc );
				
				if ( recursive )	
				{
					if ( mc is DisplayObjectContainer )
						traceAllChildren( mc as DisplayObjectContainer, true );
				}
			}
		}
	}
}