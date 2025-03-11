extends CanvasLayer

@onready var keys: Label = $"Control/MarginContainer-Keys/HBoxContainer/keys"

func _ready():
	update_keys_label()
	Global.keys_updated.connect(update_keys_label)

func update_keys_label():
	keys.text = str(Global.keys) + "/1"
