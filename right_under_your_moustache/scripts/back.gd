extends StaticBody2D

@onready var interactable: Area2D = $Interactable

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact(key_pressed: String):
	if key_pressed == "Enter":
		
		if Global.got_exam == 1:
			var background = BackgroundMusic.get_node("/root/BackgroundMusic")
			background.pitch_scale = 1
			
		Global.last_office_position = $"../augusto".position
		get_tree().change_scene_to_file("res://scenes/game.tscn")
