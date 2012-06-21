/*
 * http://code.google.com/p/hxhsl/
 * http://code.google.com/p/hxhsl/wiki/PrefaceAndIntroduction
 * http://code.google.com/p/hxhsl/wiki/SimpleExamples
 * http://code.google.com/p/hxhsl/wiki/MoreAdvancedExamples
 */


package;


import flash.display.Stage;
import flash.display.Sprite;
import flash.geom.Rectangle;


class Main
{
	static	inline	private	var	VIEWPORT	:Rectangle = new Rectangle(0, 0, 960, 640);
	static	inline	private	var	HALF		:Float = 0.5;


	var	root	:Sprite;


	public function new()
	{
		var rotatable;
		
		rotatable = new RotatableWithEvents();
		//rotatable = new RotatableWithHSL();
		rotatable.init();
		rotatable.x = VIEWPORT.width * HALF;
		rotatable.y = VIEWPORT.height * HALF;
		
		root = flash.Lib.current;
		root.addChild(rotatable);
		
		trace("Press the left or right key to rotate square.");
	}


	public static function main()
	{
		new Main();
	}
}
