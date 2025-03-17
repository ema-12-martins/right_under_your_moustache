extends Node2D

@onready var label: Label = $Label

var inside_area = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "augusto":
		inside_area = true
		label.visible = true

func _process(_delta: float) -> void:
	if inside_area and Input.is_action_just_pressed("ui_accept"):  # 'ui_accept' == Enter
		Global.time_mutex.lock()
		Global.elipsed_time_in_seconds -= 10
		Global.time_mutex.unlock()
		queue_free()
