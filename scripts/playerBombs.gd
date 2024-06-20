extends AnimatableBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PlayerBombsSprite.play("default")

func _on_player_bombs_sprite_animation_finished() -> void:
	print("Boom")
