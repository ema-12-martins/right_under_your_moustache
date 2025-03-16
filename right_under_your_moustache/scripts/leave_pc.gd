extends Node2D

func _ready() -> void:
	$CharacterBody2D/InteractingComponent.interact_label.label_settings.font_size = 30
	$CharacterBody2D/InteractingComponent.interact_label.label_settings.outline_size = 12

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Leave"):
		$CharacterBody2D/InteractingComponent.interact_label.label_settings.font_size = 50
		$CharacterBody2D/InteractingComponent.interact_label.label_settings.outline_size = 15
		get_tree().change_scene_to_file("res://scenes/office.tscn")
