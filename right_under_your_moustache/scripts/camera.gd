extends Node2D

@onready var area_2d: Area2D = $Area2D
@onready var polygon_2d: Polygon2D = $Polygon2D

var local_equal_inicial = true

func _ready() -> void:
	area_2d.body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "augusto":
		call_deferred("reload_scene")

func reload_scene():
	Global.keys = 0
	Global.last_world_position = Vector2(0, 0)
	get_tree().reload_current_scene()
	

func _on_flip_camera_timeout() -> void:
	area_2d.scale.x *= -1
	polygon_2d.scale.x *= -1
	
	if local_equal_inicial == true:
		local_equal_inicial = false
		area_2d.position.x -= 180
		polygon_2d.position.x -= 180
	elif local_equal_inicial == false:
		local_equal_inicial = true
		area_2d.position.x += 180
		polygon_2d.position.x += 180
