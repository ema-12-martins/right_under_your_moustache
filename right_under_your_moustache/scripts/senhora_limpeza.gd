extends CharacterBody2D


@export var speed = 200.0
@export var patrol_points: Array[Marker2D] = []
var current_point_index = 0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var detection_area: Area2D = $Area2D
@onready var detection_area_display: Polygon2D = $Polygon2D

func _ready() -> void:
	if patrol_points.size() == 0:
		print("No patrol points assigned!")
	detection_area.body_entered.connect(_on_player_detected)

func _on_player_detected(body: Node2D) -> void:
	if body.name == "augusto" and body.modulate != Color(0.5, 0.5, 0.5, 1.0):
		Global.reload_scene(body.get_path())

func _process(_delta: float) -> void:
	patrol()
	move_and_slide()

func patrol() -> void:
	if patrol_points.size() > 0:
		animated_sprite.play("run")
		var target = patrol_points[current_point_index].position
		velocity = (target - position).normalized() * speed
		if velocity.x < 0:
			detection_area_display.scale.x = -1
			detection_area.scale.x = -1
			animated_sprite.flip_h = true
		else:
			detection_area_display.scale.x = 1
			detection_area.scale.x = 1
			animated_sprite.flip_h = false
		
		if position.distance_to(target) < 10.0:
			current_point_index += 1
			if current_point_index >= patrol_points.size():
				current_point_index = 0
