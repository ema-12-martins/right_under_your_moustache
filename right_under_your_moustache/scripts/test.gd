extends StaticBody2D

@onready var interactable: Area2D = $Interactable
@onready var augusto: CharacterBody2D = $"../../augusto"
@onready var collision_shape_level_0: CollisionShape2D = $"../../Levels/level_0/CollisionShape2D"
@onready var collision_shape_level_1: CollisionShape2D = $"../../Levels/level_1/CollisionShape2D"

@onready var levels: Node = $"../../Levels"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact(key_pressed: String):

	if levels.level == 0 and (key_pressed == "W" or key_pressed == "Up"):
		augusto.position.y -= 700
		levels.level += 1
	
	elif levels.level == 1 and (key_pressed == "S" or key_pressed == "Down"):
		augusto.position.y += 800
		levels.level -= 1
