extends AnimatableBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PlayerBombsSprite.play("default")

func _on_player_bombs_sprite_animation_finished() -> void:
	var expl = load("res://Scenes/explosion.tscn")
	var instance = expl.instantiate()
	instance.position = self.position
	get_tree().root.get_child(0).add_child(instance)
	instance.explosionSpread(1, 'center')
	queue_free()
