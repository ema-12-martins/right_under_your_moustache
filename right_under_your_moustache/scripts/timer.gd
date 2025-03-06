extends Timer

@onready var augusto: CharacterBody2D = $"../../augusto"
@onready var collision_shape: CollisionShape2D = augusto.get_node("CollisionShape2D")

func _on_timeout() -> void:
	print("eserei")
	# Reabilita a colisão após o movimento
	collision_shape.disabled = false
