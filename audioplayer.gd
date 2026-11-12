extends AudioStreamPlayer
const level_music = preload("res://scenes/main_menu/menu_assets/a-2-3-groovy-bgm.ogg")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	
	stream == music
	volume_db = volume
	play()
	
func play_music_level():
	_play_music(level_music)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
