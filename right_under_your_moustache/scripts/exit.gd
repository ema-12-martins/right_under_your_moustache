extends Area2D

@onready var exit_area: Area2D = $"."

func _ready() -> void:
	exit_area.body_entered.connect(_on_player_detected)

func _on_player_detected(body: Node2D) -> void:
	if body.name == "augusto" and Global.got_exam:
		call_deferred("end_game")

func end_game():
	get_tree().quit()
