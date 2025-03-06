extends StaticBody2D

@onready var interactable: Area2D = $Interactable
@onready var augusto: CharacterBody2D = $"../../augusto"
@onready var collision_shape_level_0: CollisionShape2D = $"../../Levels/level_0/CollisionShape2D"
@onready var collision_shape_level_1: CollisionShape2D = $"../../Levels/level_1/CollisionShape2D"

var level = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact(key_pressed: String):
	print("Key pressed: " + key_pressed)

	if level == 0 and key_pressed == "W":
		augusto.position.y -= 800
		level += 1
		collision_shape_level_0.disabled = true
		collision_shape_level_1.disabled = false
		
	elif level == 1 and key_pressed == "S":
		augusto.position.y += 800
		level -= 1
		collision_shape_level_0.disabled = false
		collision_shape_level_1.disabled = true
		
		
