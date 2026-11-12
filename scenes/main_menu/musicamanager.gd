extends AudioStreamPlayer2D

@onready var audio_stream_player = self

func _ready():
	if audio_stream_player.stream != null:
		audio_stream_player.play()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
