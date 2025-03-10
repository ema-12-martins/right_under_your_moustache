extends Node2D

func _ready() -> void:
	if Global.last_office_position != Vector2(0, 0):
		$augusto.position = Global.last_office_position
	if Global.got_exam:
		$Label.visible = true
