extends CanvasLayer

@onready var keys: Label = $Control/MarginContainer/HBoxContainer/keys

func _ready():
	update_keys_label()

func update_keys_label():
	keys.text = str(Global.keys) + "/1"
