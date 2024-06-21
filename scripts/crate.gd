extends Node2D

#const isCrate := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func isCrate():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_crate_area_area_entered(area: Area2D) -> void:
	if area.name == "ExplosionArea" : 
		$CPUParticles2D.emitting = true
		$CrateSprite.visible = false
		$CrateSelfDestructTimer.start()
		await($CrateSelfDestructTimer.timeout)
		queue_free()
