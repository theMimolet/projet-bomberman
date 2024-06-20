extends Node2D

var maxExplosions = 4
var explNumber : int
var explState : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func explosionSpread(number : int, currentState : String):
	$ExplosionSprite.play("default")
	if number < maxExplosions : 
		if currentState == 'center' : 
			var states = ['right', 'left', 'up', 'down']
			for i in states :
				newExplosion(number+1, i)
		else : 
			newExplosion(number+1, currentState)
	

func newExplosion(number, toWhere):
	var expl = load("res://Scenes/explosion.tscn")
	var instance = expl.instantiate()
	match toWhere : 
		'right': 
			instance.position = Vector2(self.position.x+32, self.position.y)
		'left': 
			instance.position = Vector2(self.position.x-32, self.position.y)
		'up': 
			instance.position = Vector2(self.position.x, self.position.y-32)
		'down': 
			instance.position = Vector2(self.position.x, self.position.y+32)
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
