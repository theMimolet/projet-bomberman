extends CharacterBody2D

@export var SPEED := 120
@export var HP := 3
var playStep := true
var placedBomb := false
var lassoing := false

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

	if !lassoing:
		if Input.is_action_just_pressed("LassoBas") : 
			lasso('down')
		if Input.is_action_just_pressed("LassoHaut") : 
			lasso('up')
		if Input.is_action_just_pressed("LassoGauche") : 
			lasso('left')
		if Input.is_action_just_pressed("LassoDroite") : 
			lasso('right')
		
	
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
		$Visual/PlayerSprite.play("Walk")
		if playStep : 
			$StepSFX.play()
			$StepTimer.start()
			playStep = false
		if xDirection < 0 : 
			$Visual.scale.x = -1
		else : 
			$Visual.scale.x = 1
	else :
		$Visual/PlayerSprite.play("Idle")

func lasso(direction : String):
	var lasso = load("res://Scenes/playerLassos.tscn")
	var instance = lasso.instantiate()
	instance.position = self.position
	get_tree().root.get_child(0).add_child(instance)
	instance.lassoSpread(1, direction)
	$LassoTimer.start()
	lassoing = true

func _on_step_timer_timeout() -> void:
	playStep = true

func _on_bomb_timer_timeout() -> void:
	placedBomb = false

func _on_lasso_timer_timeout() -> void:
	lassoing = false
