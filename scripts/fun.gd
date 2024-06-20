extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Player.position.x < 0 :
		$Player.position.x = 100
	if $Player.position.x > 100 :
		$Player.position.x = 0 
	if $Player.position.y < 0 :
		$Player.position.y = 100
	if $Player.position.y > 100 :
		$Player.position.y = 0 
