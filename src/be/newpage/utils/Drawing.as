package be.newpage.utils
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	 * Helper class for drawing
	 * 
	 * @author Bert Wijnants / Carl Rowies - (c) Custmz 2010
	 */
	public class Drawing
	{
		/**
		 * A function written by Senocular to simualate drawing an arch of a perfect circle.
		 * 
		 * @param centerX The center X coordinate of the circle the arc is located on
		 * @param centerY The center Y coordinate of the circle the arc is located on
		 * @param startAngle The starting angle to draw the arc from
		 * @param endAngle The ending angle for the arc
		 * @param radius The radius of the circle the arc is located on
		 * @param direction Toggle for going clockwise/counter-clockwise. 1 (default) or -1.
		 */
		public static function drawArc(g:Graphics, centerX:Number, centerY:Number, startAngle:Number, endAngle:Number, radius:Number, direction:Number=1):void
		{
			var difference:Number = Math.abs(endAngle - startAngle);
			var divisions:Number = Math.floor(difference / (Math.PI / 4))+1;	
			var span:Number    = direction * difference / (2 * divisions);
			var controlRadius:Number    = radius / Math.cos(span);
			
			g.moveTo(centerX + (Math.cos(startAngle)*radius), centerY + Math.sin(startAngle)*radius);
			var controlPoint:Point;
			var anchorPoint:Point;
			for(var i:Number=0; i<divisions; ++i)
			{
				endAngle    = startAngle + span;
				startAngle  = endAngle + span;
				
				controlPoint = new Point(centerX+Math.cos(endAngle)*controlRadius, centerY+Math.sin(endAngle)*controlRadius);
				anchorPoint = new Point(centerX+Math.cos(startAngle)*radius, centerY+Math.sin(startAngle)*radius);
				g.curveTo(
					controlPoint.x,
					controlPoint.y,
					anchorPoint.x,
					anchorPoint.y
				);
			}
		}
	}
}