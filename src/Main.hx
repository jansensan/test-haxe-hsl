/*
 * http://code.google.com/p/hxhsl/
 * http://code.google.com/p/hxhsl/wiki/PrefaceAndIntroduction
 * http://code.google.com/p/hxhsl/wiki/SimpleExamples
 * http://code.google.com/p/hxhsl/wiki/MoreAdvancedExamples
 */


package;


import flash.display.Stage;
import flash.display.Sprite;


class Main
{
	var	_root	:Sprite;


	public function new()
	{
		var s = new SomeClass();
		s.init();
		s.x = 320;
		s.y = 180;
		
		_root = flash.Lib.current;
		_root.addChild(s);
	}


	public static function main()
	{
		new Main();
	}
}
