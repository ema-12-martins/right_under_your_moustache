extends StaticBody2D

@onready var interactable: Area2D = $Interactable

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact(_key_pressed: String):
	Global.got_exam = 1
	$"../Label".visible = true
