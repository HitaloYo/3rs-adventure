extends AudioStreamPlayer

@onready var audio_stream_player = self

func _ready():
	if audio_stream_player.stream != null:
		audio_stream_player.play()
