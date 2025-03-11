extends Area2D

@onready var label: Label = $"../Label"

var key_founded = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "augusto":
		label.visible = true
		Global.keys += 1

func _on_body_exited(body: Node2D) -> void:
	if body.name == "augusto":
		label.visible = false
