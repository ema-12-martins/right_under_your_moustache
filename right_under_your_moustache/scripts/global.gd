extends Node

var last_world_position = Vector2(0, 0)
var last_office_position = Vector2(0, 0)
var got_exam = false
var elipsed_time_in_seconds = 0

signal keys_updated  # Sinal para notificar mudanças na variável keys

var keys: int = 0:
	set(value):
		keys = value
		emit_signal("keys_updated")  # Dispara o sinal sempre que keys mudar

func reload_scene(body_path: NodePath):
	
	var augusto = get_node_or_null(body_path)
	var collision_shape = augusto.get_node_or_null("CollisionShape2D")
	collision_shape.queue_free()
	
	
	#Espera 2 segundos para dar reload
	await get_tree().create_timer(1.5).timeout 
	
	# Reset posicao, chaves e exames
	keys = 0  
	last_world_position = Vector2(0, 0)
	
	#Recarrega cena
	get_tree().reload_current_scene()
