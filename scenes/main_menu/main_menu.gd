extends Control
@onready var audio_stream_player = self

func _ready():
	Audioplayer.play_music_level()




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/areas/area_tutorial/mundo_tutorial_a.tscn")


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()
