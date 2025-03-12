extends CanvasLayer

@onready var keys: Label = $"Control/MarginContainer-Keys/HBoxContainer/keys"

func _ready():
	update_keys_label()  # Atualiza o HUD ao iniciar
	Global.keys_updated.connect(update_keys_label) 

func update_keys_label():
	if is_instance_valid(keys):  # Evita erro se ainda nao tiver carregada
		keys.text = str(Global.keys) + "/1"
