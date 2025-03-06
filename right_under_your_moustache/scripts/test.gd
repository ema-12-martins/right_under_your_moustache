extends StaticBody2D

@onready var interactable: Area2D = $Interactable
@onready var augusto: CharacterBody2D = $"../../augusto"
@onready var collision_shape: CollisionShape2D = augusto.get_node("CollisionShape2D")

var level = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact(key_pressed: String):
	print("Key pressed: " + key_pressed)

	if level == 0 and key_pressed == "W":
		# Desabilita a colisão durante o movimento
		collision_shape.disabled = true
		augusto.position.y -= 800
		level += 1
		# Reabilita a colisão após o movimento
		collision_shape.disabled = false
		
	elif level == 1 and key_pressed == "S":
		collision_shape.disabled = true
		augusto.position.y += 800
		level -= 1
		collision_shape.disabled = false
