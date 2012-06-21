import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;


class RotatableWithEvents extends RotatableBase
{
	public function new()
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}


	function onAddedToStage(_)
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPressed);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyReleased);
		
		addEventListener(Event.ENTER_FRAME, onUpdated);
	}


	function onKeyPressed(_)
	{
		var keyCode = _.keyCode;
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


	function onKeyReleased(_)
	{
		var keyCode = _.keyCode;
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
