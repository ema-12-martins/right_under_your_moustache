extends Node2D

@onready var area_2d: Area2D = $Area2D

func _ready() -> void:
	area_2d.body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "augusto":
		call_deferred("reload_scene")

func reload_scene():
	get_tree().reload_current_scene()
	
