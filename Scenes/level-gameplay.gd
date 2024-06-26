extends Node2D

var objective := 0

@onready var UI_ENEMY_COUNT = $Camera2D/UserInterface/UIEnemyCount
@onready var UI_HP = $Camera2D/UserInterface/UIHP

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("RetourMenu") or $Player.HP == 0 : 
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	#if objective == 0 : 
		#get_tree().change_scene_to_file($nextScene.scene)
	pass


func _on_tick_scene_timeout() -> void:
	objective = 0
	for i in range(self.get_child_count()) : 
		if get_child(i).has_method("isEnemy") : 
			objective += 1
	UI_ENEMY_COUNT.text = "Ennemis restant : " + str(objective)
	UI_HP.text = "HP : " + str($Player.HP)
