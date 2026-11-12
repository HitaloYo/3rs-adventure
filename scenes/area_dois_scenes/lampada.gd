extends Area2D

@onready var label: Label = $Label

var player_in_area: bool = false

@onready var sprite: Sprite2D = $"../Sprite2D"


var is_active = true



func _input(event: InputEvent) -> void:
	if player_in_area and Input.is_action_just_pressed("interact"):
		toggle_sprite()
		
func  toggle_sprite():
	is_active = !is_active
	if is_active:
		sprite.modulate = Color(1,1,1,1)
	else:
		sprite.modulate = Color(0.5,0.5,0.5,0.5)
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		player_in_area = true
#		label.visible = true
#		label.text = "Pressione 'I' ou 'ENTER' para interagir."
	


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		player_in_area = false
#		label.visible = false
		


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		player_in_area = true
		#label.visible = true
		#label.text = "Pressione 'I' ou 'ENTER' para interagir."


func _on_body_exited(body: Node2D) -> void:
	if body.name == "player":
		player_in_area = false
		#label.visible = false
