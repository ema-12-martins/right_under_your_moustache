extends StaticBody2D

@onready var interactable: Area2D = $Interactable

func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact(_key_pressed: String):
	if Global.got_exam == 1:
		call_deferred("end_game")

func end_game():
	if Global.best_time > Global.elipsed_time_in_seconds:
		Global.best_time = Global.elipsed_time_in_seconds
	
	# Take of the hud
	Global.global_scene_instance.queue_free()
	Global.global_scene_instance = null
	
	get_tree().change_scene_to_file("res://scenes/final_menu.tscn")
