extends CharacterBody2D

var SPEED := 2.5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Right") : 
		#print("droite")
		self.position.x += SPEED
	if Input.is_action_pressed("Left") : 
		#print("gauche")
		self.position.x -= SPEED
	if Input.is_action_pressed("Up") : 
		#print("gauche")
		self.position.y -= SPEED
	if Input.is_action_pressed("Down") : 
		#print("gauche")
		self.position.y += SPEED
	
