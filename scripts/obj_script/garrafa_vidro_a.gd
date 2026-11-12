extends RigidBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var isPickedUp := false
var canPickUp := false
var animationTime := 0.5
var lixo := LixoVidro

func _ready() -> void:
	freeze = true
	collision_shape_2d.disabled = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == get_tree().get_first_node_in_group("player"):
		if not isPickedUp:
			canPickUp = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == get_tree().get_first_node_in_group("player"):
		canPickUp = false

func _input(event: InputEvent) -> void:
	var player = get_tree().get_first_node_in_group("player")
	var isPlayerParent = get_parent() == player

	if canPickUp and event.is_action_pressed("interact"):
		_pick_up_animation()
		isPickedUp = true
		canPickUp = false

	if isPickedUp and isPlayerParent and event.is_action_pressed("interact"):
		var player_pos = player.global_position
		var in_x_range = player_pos.x >= 524 and player_pos.x <= 560
		var in_y_range = player_pos.y >= 200 and player_pos.y <= 230
		

		if in_x_range and in_y_range:
			reparent(get_tree().current_scene)
			isPickedUp = false
			freeze = false
			collision_shape_2d.disabled = false

			var xForce = player.get_direction() * 200
			apply_impulse(Vector2(xForce, -200))
			queue_free()
		else:
			print("Só pode soltar o objeto dentro da área X:100–300 e Y:400–500!")

func _pick_up_animation():
	var player = get_tree().get_first_node_in_group("player")

	player.pick_up(animationTime)

	var tween = get_tree().create_tween()
	tween.tween_property(self, "global_position", player.global_position + Vector2(0, -14), animationTime)
	await tween.finished

	reparent(player)
