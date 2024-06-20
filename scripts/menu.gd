extends Node2D

var stateMenu := 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match stateMenu : 
		1 : 
			$MainMenu.visible = true
			$NiveauxMenu.visible = false
			$ParamMenu.visible = false
		2 : 
			$MainMenu.visible = false
			$NiveauxMenu.visible = true
			$ParamMenu.visible = false
		3 : 
			$MainMenu.visible = false
			$NiveauxMenu.visible = false
			$ParamMenu.visible = true

func _on_quitter_pressed() -> void:
	get_tree().quit()

func _on_level_retour_pressed() -> void:
	stateMenu = 1

func _on_niveaux_pressed() -> void:
	stateMenu = 2

func _on_parametres_pressed() -> void:
	stateMenu = 3
