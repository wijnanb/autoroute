package be.newpage.utils
{
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;
	import flash.xml.XMLNodeType;

	public class StringFunctions
	{
		public static function htmlUnescape(str:String):String
		{
			return new XMLDocument(str).firstChild.nodeValue;
		}
		
		public static function htmlEscape(str:String):String
		{
			return XML( new XMLNode( XMLNodeType.TEXT_NODE, str ) ).toXMLString();
		}
		
		public static function stripTags( str:String ):String
		{
			var removeHtmlRegExp:RegExp = new RegExp("<[^<]+?>", "gi");
			return str.replace(removeHtmlRegExp, "");;
		}
		
		public static function numberToWords( num:Number, isAmerican:Boolean=true ):String
		{
			var th:Array;
			
			if ( isAmerican )
				th = ['hundred','thousand','million', 'billion','trillion'];	// American Numbering System
			else
				th = ['hundred','thousand','million', 'milliard','billion'];	// British Numbering System
			
			
			var dg:Array = ['zero','one','two','three','four', 'five','six','seven','eight','nine']; 
			var tn:Array = ['ten','eleven','twelve','thirteen', 'fourteen','fifteen','sixteen', 'seventeen','eighteen','nineteen']; 
			var tw:Array = ['','ten','twenty','thirty','forty','fifty', 'sixty','seventy','eighty','ninety']; 
			
			var digits:Array = String(num).split('');
			digits.reverse();
			
			if ( num>= 0 && num < 10 )
			{
				return dg[num];
			}
			
			if ( num>= 10 && num < 20 )
			{
				return tn[ digits[0] ];
			}
			
			if( num >= 100 )
			{
				return "one hundred";
			}
			
			if ( digits[0] == 0 )
			{
				return tw[ digits[1] ];
			}
			
			return tw[ digits[1] ] + " " + dg[ digits[0] ];		
		}
	}
}