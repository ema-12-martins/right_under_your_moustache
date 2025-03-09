extends StaticBody2D

@onready var interactable: Area2D = $Interactable
@onready var augusto: CharacterBody2D = $"../augusto"

var hidding = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact(key_pressed: String):
	if key_pressed == "Enter":
		if hidding:
			$Interactable.interact_name = "Press Enter to stop hidding"
			augusto.animated_sprite.play("idle")
			augusto.collision_layer = 2
			augusto.collision_mask = 2
			augusto.get_node("AnimatedSprite2D").modulate = Color(0.5, 0.5, 0.5, 1.0)
			augusto.disable_player_movement = true
			hidding = false
		else:
			$Interactable.interact_name = "Press Enter to hide"
			augusto.collision_layer = 1
			augusto.collision_mask = 1
			augusto.get_node("AnimatedSprite2D").modulate = Color(1.0, 1.0, 1.0, 1.0)
			augusto.disable_player_movement = false
			hidding = true
