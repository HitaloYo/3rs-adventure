extends Area2D

@onready var label: Label = $Label

var player_in_area: bool = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		player_in_area = true
		label.visible = true
		label.text = "Papel"
		
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		player_in_area = false
		label.visible = false
