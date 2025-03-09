extends Node2D

func _ready() -> void:
	if Global.last_world_position != Vector2(0, 0):
		$augusto.position = Global.last_world_position
