extends Node

var level = 0
@onready var collision_shape_level_0: CollisionShape2D = $level_0/CollisionShape2D
@onready var collision_shape_level_1: CollisionShape2D = $level_1/CollisionShape2D


func _ready() -> void:
	if Global.last_world_position != Vector2(0, 0):
		level = 1
		collision_shape_level_0.disabled = true
		collision_shape_level_1.disabled = false
	else:
		collision_shape_level_0.disabled = false
		collision_shape_level_1.disabled = true
