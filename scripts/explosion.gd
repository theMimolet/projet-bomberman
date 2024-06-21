extends Node2D

@export var maxExplosions = 3
@export var spacingExplosions = 32

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func explosionSpread(number : int, currentState : String):
	$ExplosionSprite.play("default")
	if number < maxExplosions : 
		if currentState == 'center' : 
			var states = ['right', 'left', 'up', 'down']
			$ExplosionTimer.start()
			await($ExplosionTimer.timeout)
			for i in states :
				newExplosion(number+1, i)
		else : 
			$ExplosionTimer.start()
			await($ExplosionTimer.timeout)
			newExplosion(number+1, currentState)
	

func newExplosion(number, toWhere):
	var expl = load("res://Scenes/explosion.tscn")
	var instance = expl.instantiate()
	match toWhere : 
		'right': 
			instance.position = Vector2(self.position.x+spacingExplosions, self.position.y)
		'left': 
			instance.position = Vector2(self.position.x-spacingExplosions, self.position.y)
		'up': 
			instance.position = Vector2(self.position.x, self.position.y-spacingExplosions)
		'down': 
			instance.position = Vector2(self.position.x, self.position.y+spacingExplosions)
	get_tree().root.get_child(0).add_child(instance)
	instance.explosionSpread(number, toWhere)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_explosion_sprite_animation_finished() -> void:
	queue_free()

func _on_explosion_area_body_entered(body: Node2D) -> void:
	if body.name == "TileMap" : 
		queue_free()
