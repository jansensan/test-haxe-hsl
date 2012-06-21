import flash.display.Shape;
import flash.display.Sprite;


class RotatableBase extends Sprite
{
	static inline var	SIZE				:Int = 360;
	static inline var	ROTATION_INCREMENT	:Float = 0.25;
	static inline var	ROTATION_DECAY		:Float = 0.85;
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
		shape.graphics.drawRect	(	SIZE * -0.5, 
									SIZE * -0.5, 
									SIZE, 
									SIZE
								);
		shape.graphics.endFill();
		addChild(shape);
	}


	public function update()
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
