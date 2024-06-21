extends CharacterBody2D

@export var SPEED := 20

@onready var player = $"../Player"
@onready var nav_agent := $EnemyNavigation as NavigationAgent2D

var playStep := true
var lassoed := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * SPEED
	
	move_and_slide()
	
	if !lassoed:
		pass
		#if xDirection:
			#velocity.x = xDirection * SPEED
		#else:
			#velocity.x = move_toward(velocity.x, 0, SPEED)
		#if yDirection:
			#velocity.y = yDirection * SPEED
		#else:
			#velocity.y = move_toward(velocity.y, 0, SPEED)
			#
		#if xDirection or yDirection : 
			#$EnemySprite.play("Walk")
			#if playStep : 
				#$StepSFX.play()
				#$StepTimer.start()
				#playStep = false
			#if xDirection < 0 : 
				#$Visual.scale.x = -1
			#else : 
				#$Visual.scale.x = 1
		#else :
			#$EnemySprite.play("Idle")

func makepath() -> void : 
	nav_agent.target_position = player.position

func _on_enemy_timer_timeout() -> void:
	makepath()

func _on_step_timer_timeout() -> void:
	playStep = true

#func damageTaken() : 
	#hasTookDamage = true
	#$InvincibilityTimer.start()
	#await($InvincibilityTimer.timeout)
	#hasTookDamage = false
	#$Visual/PlayerSprite.visible = true

func _on_enemy_damage_taker_area_entered(area: Area2D) -> void:
	if area.name == "ExplosionArea": 
		queue_free()


	
func isEnemy() -> void : 
	pass


