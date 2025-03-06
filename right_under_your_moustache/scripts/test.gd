extends StaticBody2D

@onready var interactable: Area2D = $Interactable
@onready var augusto: CharacterBody2D = $"../../augusto"

var level = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact(key_pressed: String):
	print("Key pressed: "+key_pressed)
	
	if level == 0 and key_pressed=="W":
		augusto.position.y -= 800
		level += 1
	elif level == 1 and key_pressed=="S":
		augusto.position.y += 800
		level -= 1
