extends RigidBody2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var isPickedUp := false
var canPickUp := false
var animationTime := 0.5

func _ready() -> void:
	freeze = true
	collision_shape_2d.disabled =true
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == get_tree().get_first_node_in_group("player"):
		if not isPickedUp: canPickUp = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == get_tree().get_first_node_in_group("player"):
		canPickUp = false
		
func _input(event: InputEvent) -> void:
	var player = get_tree().get_first_node_in_group("player")
	var isPlayerParent = get_parent() == player
		
	if canPickUp and player.holding == 0 and event.is_action_pressed("interact"):
		_pick_up_animation()
		player.holding = 1
		isPickedUp = true
		canPickUp = false
	
	if isPickedUp and isPlayerParent and event.is_action_pressed("interact"):
		reparent(get_tree().current_scene)
		player.holding = 0
		queue_free()
		#freeze= true #freeze
		#collision_shape_2d.disabled = false
		
		var xForce = player.get_direction() * 200
		apply_impulse(Vector2(xForce,-200))
		
		
	
	
func _pick_up_animation():
	var player = get_tree().get_first_node_in_group("player")
	
	player.pick_up(animationTime)
	
	var tween = get_tree().create_tween()
	tween.tween_property(self,"global_position",player.global_position + Vector2(0,-14), animationTime)
	await tween.finished
	
	reparent(player)
