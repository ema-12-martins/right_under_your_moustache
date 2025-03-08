extends Area2D

@onready var label: Label = $"../Label"

@onready var augusto: CharacterBody2D = $"../../../augusto"

func _on_body_entered(body: Node2D) -> void:
	if body.name == "augusto" and augusto.velocity_speed == false:
		label.visible = true
		augusto.SPEED += 800
		augusto.velocity_speed = true
		
func _on_body_exited(body: Node2D) -> void:
	if body.name == "augusto":
		label.visible = false
