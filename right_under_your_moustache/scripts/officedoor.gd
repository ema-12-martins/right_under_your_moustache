extends StaticBody2D

@onready var interactable: Area2D = $Interactable

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.interact = _on_interact
	
func _process(delta: float) -> void:
	if Global.keys == 1:
		interactable.name = "Press Enter to enter the office."
	else: 
		interactable.name = "Find the key to unlock this door."
		
func _on_interact(key_pressed: String):
	if Global.keys == 1:
		if key_pressed == "Enter":
			Global.last_world_position = $"../augusto".position
			get_tree().change_scene_to_file("res://scenes/office.tscn")
	
