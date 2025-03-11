extends Area2D

@onready var label: Label = $"../Label"

var key_founded = false
var inside_area = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "augusto" and key_founded == false:
		label.visible = true
		inside_area = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "augusto" and key_founded == false:
		label.visible = false
		inside_area = false

func _process(_delta: float) -> void:
	if inside_area and Input.is_action_just_pressed("ui_accept") and key_founded==false:  # 'ui_accept' == Enter
		Global.keys += 1
		key_founded = true
		label.visible = false
