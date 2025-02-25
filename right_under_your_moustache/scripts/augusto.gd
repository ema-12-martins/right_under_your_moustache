extends CharacterBody2D


const SPEED = 800.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	#Get the input directions: 0, -1 , 1
	var direction := Input.get_axis("left", "right")
	
	#Play animations
	if direction == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("run")
	
	#Flip the sprit
	if direction > 0:
		animated_sprite.flip_h = false
	else:
		animated_sprite.flip_h = true
	
	#Apply the moviment
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
