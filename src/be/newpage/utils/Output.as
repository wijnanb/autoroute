package be.newpage.utils 
{
	

	/**
	 * Helper class for outputting text to the trace or screen
	 * 
	 * @author Bert Wijnants / Carl Rowies - (c) Custmz 2010
	 */
	public class Output
	{
		
		/**
		 * Helper function to get the full trace of an object
		 * @param	obj
		 * @param	indent
		 */
		public static function var_dump(obj:Object, indent:uint = 0):void
		{
			var indentString:String = "";
			var i:uint;
			var prop:String;
			var val:*;
			for (i = 0; i < indent; i++)
			{
				indentString += "\t";
			}
			for (prop in obj)
			{
				val = obj[prop];
				if (typeof(val) == "object")
				{
					trace(indentString + " " + prop + ": [Object]");
					var_dump(val, indent + 1);
				}
				else
				{
					trace(indentString + " " + prop + ": " + val);
				}
			}
		}
		
		
		
	}

}