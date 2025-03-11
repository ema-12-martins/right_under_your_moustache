extends Node2D

func _ready() -> void:
	if Global.keys == 1:
		$Door/StaticBody/Interactable.interact_name = "Press Enter to enter the office"
	if Global.last_world_position != Vector2(0, 0):
		$augusto.position = Global.last_world_position
