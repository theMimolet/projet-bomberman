extends Node2D

@export var maxLassos = 8
@export var spacingLassos = 16

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func lassoSpread(number : int, currentState : String):
	if number == 1 or number == maxLassos : 
		$LassoParticules.emitting = true
	match currentState : 
		'right': 
			$LassoParticules.position = $LassoParticulesPosRight.position
		'left': 
			$LassoParticules.position = $LassoParticulesPosLeft.position
		'up': 
			$LassoParticules.position = $LassoParticulesPosLeft.position
			self.rotation_degrees = 90
		'down': 
			$LassoParticules.position = $LassoParticulesPosRight.position
			self.rotation_degrees = 90
	$LassoSprite.play("default")
	$LassoTimer.start()
	await($LassoTimer.timeout)
	if number < maxLassos : 
		newLasso(number+1, currentState)
	#$LassoSelfDestructTimer.start()
	#await($LassoSelfDestructTimer.timeout)
	queue_free()

func newLasso(number, toWhere):
	var lasso = load("res://Scenes/playerLassos.tscn")
	var instance = lasso.instantiate()
	match toWhere : 
		'right': 
			instance.position = Vector2(self.position.x+spacingLassos, self.position.y)
		'left': 
			instance.position = Vector2(self.position.x-spacingLassos, self.position.y)
		'up': 
			instance.position = Vector2(self.position.x, self.position.y-spacingLassos)
			instance.rotation_degrees = 90
		'down': 
			instance.position = Vector2(self.position.x, self.position.y+spacingLassos)
			instance.rotation_degrees = 90
			
	get_tree().root.get_child(0).add_child(instance)
	instance.lassoSpread(number, toWhere)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_explosion_sprite_animation_finished() -> void:
	queue_free()

func _on_explosion_area_body_entered(body: Node2D) -> void:
	if body.name == "TileMap" : 
		$LassoParticules.emitting = true
		$LassoSprite.visible = false
		$LassoSelfDestructTimer.start()
		await($LassoSelfDestructTimer.timeout)
		queue_free()
