extends StaticBody2D

@onready var interactable: Area2D = $Interactable
@onready var augusto: CharacterBody2D = $"../augusto"

var test = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact(key_pressed: String):
	if test:
		augusto.collision_layer = 2
		augusto.collision_mask = 2
		augusto.modulate = Color(0.5, 0.5, 0.5, 1.0)
		augusto.disable_player_movement = true
		test = false
	else:
		augusto.collision_layer = 1
		augusto.collision_mask = 1
		augusto.modulate = Color(1.0, 1.0, 1.0, 1.0)
		augusto.disable_player_movement = false
		test = true
