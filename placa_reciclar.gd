extends Node2D
@onready var label: Label = $Label

var player_in_area: bool = false


func _process(delta: float):
	if player_in_area and Input.is_action_just_pressed("interact"):
		label.text = "Parece que alguem sujou essa area!"

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		player_in_area = true
		label.visible = true
		label.text = "Pressione 'I' ou 'ENTER' para interagir."
		


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		player_in_area = false
		label.visible = false
		
