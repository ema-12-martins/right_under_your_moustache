extends StaticBody2D

@onready var interactable: Area2D = $Interactable

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact(key_pressed: String):
	if key_pressed == "Left Mouse Button":
		print("hello")
