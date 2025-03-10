extends Area2D

@onready var label: Label = $"../Label"

@onready var augusto: CharacterBody2D = $"../../../augusto"
@onready var speed_timer: Timer = $"../../../augusto/speed_timer"

var inside_area = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "augusto":
		inside_area = true 
		label.visible = true
		
func _on_body_exited(body: Node2D) -> void:
	if body.name == "augusto":
		inside_area = false 
		label.visible = false
		
func _process(_delta: float) -> void:
	if inside_area and Input.is_action_just_pressed("ui_accept"):  # 'ui_accept' == Enter
		if augusto.velocity_speed == false:
			augusto.SPEED += 800
			augusto.velocity_speed = true
			speed_timer.start()
