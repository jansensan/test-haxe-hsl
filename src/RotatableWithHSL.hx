import flash.display.Stage;
import flash.ui.Keyboard;

import hsl.haxe.Signal;
import hsl.haxe.data.keyboard.KeyCombination;


using hsl.avm2.plugins.DisplayObjectShortcuts;
using hsl.avm2.plugins.KeyboardShortcuts;


class RotatableWithHSL extends RotatableBase
{
	public function new()
	{
		super();
		getAddedToStageSignaler().bindAdvanced(onAddedToStage);
	}


	function onAddedToStage(signal:Signal<Stage>)
	{
		getAddedToStageSignaler().unbindAdvanced(onAddedToStage);
		
		stage.getKeyPressedDownSignaler().bindAdvanced(onKeyPressed);
		stage.getKeyLetUpSignaler().bindAdvanced(onKeyReleased);
		
		getFrameEnteredSignaler().bindAdvanced(onUpdated);
	}


	function onKeyPressed(signal:Signal<KeyCombination>)
	{
		var keyCode = signal.data.keyCode;
		switch(keyCode)
		{
			case Keyboard.LEFT:
				isRightKeyDown = false;
				isLeftKeyDown = true;
			
			case Keyboard.RIGHT:
				isLeftKeyDown = false;
				isRightKeyDown = true;
		}
	}


	function onKeyReleased(signal:Signal<KeyCombination>)
	{
		var keyCode = signal.data.keyCode;
		switch(keyCode)
		{
			case Keyboard.LEFT:
				isLeftKeyDown = false;
			
			case Keyboard.RIGHT:
				isRightKeyDown = false;
		}
	}


	function onUpdated(_)
	{
		update();
	}
}
