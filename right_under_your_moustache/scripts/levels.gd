extends Node

var level = 0
@onready var collision_shape_level_0: CollisionShape2D = $level_0/CollisionShape2D
@onready var collision_shape_level_1: CollisionShape2D = $level_1/CollisionShape2D


func _ready() -> void:
	collision_shape_level_0.disabled = false
	collision_shape_level_1.disabled = true
