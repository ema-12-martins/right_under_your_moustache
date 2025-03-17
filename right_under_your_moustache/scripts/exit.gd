extends Area2D

@onready var exit_area: Area2D = $"."

func _ready() -> void:
	exit_area.body_entered.connect(_on_player_detected)

func _on_player_detected(body: Node2D) -> void:
	if body.name == "augusto" and Global.got_exam == 1:
		call_deferred("end_game")

func end_game():
	if Global.best_time < Global.elipsed_time_in_seconds:
		Global.best_time = Global.elipsed_time_in_seconds
		
	get_tree().change_scene_to_file("res://scenes/final_menu.tscn")
