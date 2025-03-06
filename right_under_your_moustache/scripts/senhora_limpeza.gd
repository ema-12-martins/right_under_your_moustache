extends CharacterBody2D


@export var speed = 100.0
@export var patrol_points: Array[Marker2D] = []
var current_point_index = 0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	draw()
	if patrol_points.size() == 0:
		print("No patrol points assigned!")

func _process(delta: float) -> void:
	patrol()
	move_and_slide()

func patrol() -> void:
	if patrol_points.size() > 0:
		animated_sprite.play("run")
		var target = patrol_points[current_point_index].position
		velocity = (target - position).normalized() * speed
		if velocity.x < 0:
			animated_sprite.flip_h = true
		else:
			animated_sprite.flip_h = false
		
		if position.distance_to(target) < 10.0:
			current_point_index += 1
			if current_point_index >= patrol_points.size():
				current_point_index = 0

func draw():
	for point in patrol_points:
		draw_circle(point.position, 5, Color(1, 0, 0))  # Red circles
