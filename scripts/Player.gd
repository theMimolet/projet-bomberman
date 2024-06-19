extends CharacterBody2D

@export var SPEED := 100


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	var xDirection := Input.get_axis("Left", "Right")
	var yDirection := Input.get_axis("Up", "Down")

	if xDirection:
		velocity.x = xDirection * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if yDirection:
		velocity.y = yDirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	
	if xDirection or yDirection : 
		$PlayerSprite.play("Walk")
		if xDirection < 0 : 
			$PlayerSprite.flip_h = true
		else : 
			$PlayerSprite.flip_h = false
	else :
		$PlayerSprite.play("Idle")
