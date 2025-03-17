extends Control

@onready var race_time: Label = $Labels/race_time
@onready var best_time: Label = $Labels/best_time

func _ready():
	var minutes = Global.elipsed_time_in_seconds / 60.0
	var seconds = Global.elipsed_time_in_seconds % 60
	race_time.text = "Race time: %02d:%02d" % [minutes, seconds]
	
	minutes = Global.best_time / 60.0
	seconds = Global.best_time % 60
	best_time.text = "Best time: %02d:%02d" % [minutes, seconds]
	
	$VBoxContainer/restart.connect("mouse_entered", Callable(self, "_on_mouse_entered").bind($VBoxContainer/restart))
	$VBoxContainer/exit.connect("mouse_entered", Callable(self, "_on_mouse_entered").bind($VBoxContainer/exit))

func _on_restart_pressed() -> void:
	Global.global_scene_instance = preload("res://scenes/final_menu.tscn").instantiate()
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_mouse_entered(button) -> void:
	button.grab_focus()

func _on_restart_focus_entered() -> void:
	$VBoxContainer/restart.add_theme_color_override("font_hover_color", Color("#ffff4c"))

func _on_restart_focus_exited() -> void:
	$VBoxContainer/restart.add_theme_color_override("font_hover_color", Color("#FFFFFF"))

func _on_exit_focus_entered() -> void:
	$VBoxContainer/exit.add_theme_color_override("font_hover_color", Color("#ffff4c"))

func _on_exit_focus_exited() -> void:
	$VBoxContainer/exit.add_theme_color_override("font_hover_color", Color("#FFFFFF"))

func _on_ready() -> void:
	$VBoxContainer/restart.grab_focus()
