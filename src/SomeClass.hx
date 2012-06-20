package;


import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import hsl.haxe.Signaler;


class SomeClass extends Sprite
{
	static inline var	ROTATION_INCREMENT	:Float = 0.25;
	static inline var	ROTATION_DECAY		:Float = 0.75;
	static inline var	MAX_ROTATION		:Int = 16;
	
	var shape			:Shape;
	
	var isLeftKeyDown	:Bool;
	var isRightKeyDown	:Bool;
	
	var currentRotation	:Float;


	public function new()
	{
		super();
	}


	public function init()
	{
		isLeftKeyDown = false;
		isRightKeyDown = false;
		
		currentRotation = 0;
		
		var size = 160;
		
		shape = new Shape();
		shape.graphics.beginFill(0xcc0000, 1);
		shape.graphics.drawRect	(	size * -0.5, 
									size * -0.5, 
									size, 
									size
								);
		shape.graphics.endFill();
		
		addChild(shape);
		
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
		if(isRightKeyDown)
		{
			currentRotation += ROTATION_INCREMENT;
			if(currentRotation > MAX_ROTATION)
			{
				currentRotation = MAX_ROTATION;
			}
		}
		if(isLeftKeyDown)
		{
			currentRotation -= ROTATION_INCREMENT;
			if(currentRotation < -MAX_ROTATION)
			{
				currentRotation < -MAX_ROTATION;
			}
		}
		shape.rotation += currentRotation;
		if(!isRightKeyDown && !isLeftKeyDown)
		{
			currentRotation *= ROTATION_DECAY;
		}
	}
}
