extends CharacterBody2D

@export var SPEED := 100
@export var HP := 3
var playStep := true
var placedBomb := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Bombe") and !placedBomb : 
		var bomb = load("res://Scenes/playerBombs.tscn")
		var instance = bomb.instantiate()
		instance.position = self.position
		get_tree().root.get_child(0).add_child(instance)
		$BombTimer.start()
		placedBomb = true
	
	var xDirection := Input.get_axis("AvanceGauche", "AvanceDroite")
	var yDirection := Input.get_axis("AvanceHaut", "AvanceBas")

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
		if playStep : 
			$StepSFX.play()
			$StepTimer.start()
			playStep = false
		if xDirection < 0 : 
			$PlayerSprite.flip_h = true
		else : 
			$PlayerSprite.flip_h = false
	else :
		$PlayerSprite.play("Idle")

func _on_step_timer_timeout() -> void:
	playStep = true

func _on_bomb_timer_timeout() -> void:
	placedBomb = false
