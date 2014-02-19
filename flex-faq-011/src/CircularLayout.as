package 
{
	import mx.core.ILayoutElement;
	
	import spark.layouts.supportClasses.LayoutBase;
	
	public class CircularLayout extends LayoutBase
	{
		override public function updateDisplayList(w:Number, h:Number):void
		{
			super.updateDisplayList(w, h);
			
			if (!target)
				return;
			
			var layoutElement:ILayoutElement;
			var count:uint = target.numElements;
			
			var angle : Number = 360/count;
			var radius : Number = Math.min( target.width/2, target.height/2 ) - 25;
			
			var w2 : Number = target.width/2;
			var h2 : Number = target.height/2;
			
			for (var i:int = 0; i < count; i++)
			{
				layoutElement = target.getElementAt(i);
				
				if (!layoutElement || !layoutElement.includeInLayout)
					continue;
				
				var radAngle : Number = (angle * i) * (Math.PI / 180) ;
				
				var _x : Number = Math.sin( radAngle );
				var _y : Number = - Math.cos( radAngle );
				
				layoutElement.setLayoutBoundsPosition( w2 + (_x * radius) - 25, h2 + (_y * radius) - 10 );
			} 
		}
	}
}