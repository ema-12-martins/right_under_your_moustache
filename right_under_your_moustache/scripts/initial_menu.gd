extends Control


func _on_ready() -> void:
	$VBoxContainer/StartButton.grab_focus()


func _ready():
	get_tree().change_scene_to_file("res://scenes/final_menu.tscn")
	$VBoxContainer/StartButton.connect("mouse_entered", Callable(self, "_on_mouse_entered").bind($VBoxContainer/StartButton))
	$VBoxContainer/QuitButton.connect("mouse_entered", Callable(self, "_on_mouse_entered").bind($VBoxContainer/QuitButton))

func _on_mouse_entered(button) -> void:
	button.grab_focus()

func _on_start_button_pressed() -> void:
	Global.global_scene_instance = preload("res://scenes/hud.tscn").instantiate()
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_start_button_focus_exited() -> void:
	$VBoxContainer/StartButton.add_theme_color_override("font_hover_color", Color("#FFFFFF"))

func _on_start_button_focus_entered() -> void:
	$VBoxContainer/StartButton.add_theme_color_override("font_hover_color", Color("#ffff4c"))

func _on_quit_button_focus_entered() -> void:
	$VBoxContainer/QuitButton.add_theme_color_override("font_hover_color", Color("#ffff4c"))

func _on_quit_button_focus_exited() -> void:
	$VBoxContainer/QuitButton.add_theme_color_override("font_hover_color", Color("#FFFFFF"))
