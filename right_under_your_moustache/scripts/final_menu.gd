extends Control

func _ready():
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
