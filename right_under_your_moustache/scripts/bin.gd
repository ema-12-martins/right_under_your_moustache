extends Area2D

@onready var label: Label = $"../Label"

var key_founded = false
var inside_area = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "augusto" and key_founded == false:
		label.visible = true
		inside_area = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "augusto" and key_founded == false:
		label.visible = false
		inside_area = false

func _process(_delta: float) -> void:
	if inside_area and Input.is_action_just_pressed("ui_accept") and key_founded==false:  # 'ui_accept' == Enter
		if RandomNumberGenerator.new().randf_range(1, 3) == 1 or Global.bin_tries == 2:
			$"../../../Door/OfficeDoor/Interactable".interact_name = "Press Enter to enter the office"
			Global.keys += 1
			key_founded = true
			label.text = "You found a key!"
		else:
			label.text = "You found nothing"
			Global.bin_tries += 1
