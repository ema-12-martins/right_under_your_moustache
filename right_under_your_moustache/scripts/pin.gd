extends Control

@onready var fields = [$LineEdit, $LineEdit2, $LineEdit3, $LineEdit4]

func _ready() -> void:
	for i in range(fields.size()):
		fields[i].text_changed.connect(_on_text_changed.bind(i))
		fields[i].gui_input.connect(_on_gui_input.bind(i))
		fields[i].text_submitted.connect(_on_text_submitted)

func _on_text_changed(_character, index) -> void:
	$"../Label2".visible = false
	if fields[index].text != "" and index < fields.size() - 1:
		fields[index + 1].grab_focus()

func _on_gui_input(event, index) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_BACKSPACE and fields[index].text == "" and index > 0:
			fields[index - 1].grab_focus()
			fields[index - 1].clear()

func _on_text_submitted(_character) -> void:
	var password = ""
	for field in fields:
		password += field.text
	if password == "3142":
		$"../Label".visible = false
		$"../Label2".visible = false
		for field in fields:
			field.visible = false
			field.editable = false
		$"../../TileMap/PassScreen".visible = false
		$"../../Download/Interactable/CollisionShape2D".disabled = false
	else:
		for field in fields:
			field.clear()
		fields[0].grab_focus()
		$"../Label2".visible = true
