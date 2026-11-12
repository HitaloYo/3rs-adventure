extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const holding = false
const speed = 100
var current_dir = "none"

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	var horizontal_input = Input.get_action_strength("direita_ui") - Input.get_action_strength("esquerda_ui")
	var vertical_input = Input.get_action_strength("baixo_ui") - Input.get_action_strength("cima_ui")

	if horizontal_input > 0:
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif horizontal_input < 0:
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif vertical_input > 0:
		current_dir = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
	elif vertical_input < 0:
		current_dir = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	
	if dir == "down":
		anim.flip_h = false # Corrigido: flip_h deve ser false para a animação frontal
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			anim.play("front_idle")
	if dir == "up":
		anim.flip_h = false # Corrigido: flip_h deve ser false para a animação traseira
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0:
			anim.play("back_idle")
	

func pick_up(duration):
	set_physics_process(false)
	
	animated_sprite_2d.play("idle")
	
	await get_tree().create_timer(duration).timeout
	
	set_physics_process(true)
	
func get_direction():
	if animated_sprite_2d.flip_h: return -1
	else: return 1
