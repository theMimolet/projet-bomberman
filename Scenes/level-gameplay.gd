extends Node2D

var objective := 0

@onready var UI_ENEMY_COUNT = $Camera2D/UserInterface/UIEnemyCount

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(self.get_child_count()) : 
		if get_child(i).has_method("isEnemy") : 
			objective += 1
	UI_ENEMY_COUNT.text = "Ennemis restant : " + str(objective)

#func isEnemy() -> void : 
	#pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if objective == 0 : 
		#get_tree().change_scene_to_file($nextScene.scene)
	pass