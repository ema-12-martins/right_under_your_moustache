extends CharacterBody2D

func _physics_process(_delta: float) -> void:
	position = get_global_mouse_position()
	move_and_slide()
