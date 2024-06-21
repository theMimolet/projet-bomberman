extends Node2D

var stateMenu := 1
const niveau1 := "res://Scenes/niveau1.tscn"
const niveau2 := "res://Scenes/niveau2.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if DisplayServer.window_get_mode() == 0 : 
		$MainMenu/CenterMenu/Fullscreen.text = "Plein ecran : Off"
	else : 
		$MainMenu/CenterMenu/Fullscreen.text = "Plein ecran : On"
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print()
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

func _on_nouveau_jeu_pressed() -> void:
	get_tree().change_scene_to_file(niveau1)

func _on_niveaux_pressed() -> void:
	stateMenu = 2

func _on_parametres_pressed() -> void:
	stateMenu = 3

func _on_quitter_pressed() -> void:
	get_tree().quit()

func _on_level_retour_pressed() -> void:
	stateMenu = 1

func _on_fullscreen_pressed() -> void:
	if DisplayServer.window_get_mode() == 0 : 
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		$MainMenu/CenterMenu/Fullscreen.text = "Plein ecran : On"
	else : 
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		$MainMenu/CenterMenu/Fullscreen.text = "Plein ecran : Off"

func _on_niveau_1_pressed() -> void:
	get_tree().change_scene_to_file(niveau1)

func _on_niveau_2_pressed() -> void:
	get_tree().change_scene_to_file(niveau2)
