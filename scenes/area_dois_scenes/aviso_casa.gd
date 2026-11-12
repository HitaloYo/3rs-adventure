extends Node2D
@onready var label: Label = $Label

var player_in_area: bool = false
var dialogos: Array[String] = [
	"O dono desta casa esqueceu...",
	"de desligar as luzes...",
	"Ajude ele desligando as luzes..."
	
]
var dialogo_atual_index: int = 0


func _process(delta: float):
	if player_in_area and Input.is_action_just_pressed("interact"):
		mostrar_proximo_dialogo()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		player_in_area = true
		label.visible = true
		label.text = "Pressione 'Z' ou 'ENTER'"
		dialogo_atual_index = 0 # Reinicia o diálogo ao entrar na área
		

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		player_in_area = false
		label.visible = false
		

func mostrar_proximo_dialogo():
	if dialogo_atual_index < dialogos.size():
		label.text = dialogos[dialogo_atual_index]
		dialogo_atual_index += 1
	else:
		# Opcional: Esconder a label ou mostrar uma mensagem final
		label.visible = false
