extends StaticBody2D

@onready var interactable: Area2D = $Interactable
@onready var interactable_2: Area2D = $Interactable2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.interact = _on_interact
	interactable_2.interact = _on_interact
		
func _on_interact(key_pressed: String):
	if Global.keys == 1:
		if key_pressed == "Enter":
			Global.last_world_position = $"../../augusto".position
			get_tree().change_scene_to_file("res://scenes/office.tscn")
	


func _on_interactable_body_entered(body: Node2D) -> void:
	if Global.keys == 1:
		interactable.visible = true
		interactable_2.visible = false
	else: 
		interactable.visible = false
		interactable_2.visible = true
