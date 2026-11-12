extends Node2D
@onready var label: Label = $Label

var player_in_area: bool = false
@onready var sprite_2d: Sprite2D = $Sprite2D



func _process(delta: float):
	if player_in_area and Input.is_action_just_pressed("interact"):
		label.text = "Parece que alguem sujou essa area...."
		$Sprite2D.modulate = Color(0.5, 0.5, 0.5, 0.7)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		player_in_area = true
		label.visible = true
		label.text = "Desligar 'I' ou 'ENTER'"
		


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		player_in_area = false
		label.visible = false
