extends Node

var last_world_position = Vector2(0, 0)
var last_office_position = Vector2(0, 0)
var elipsed_time_in_seconds = 0
var bin_tries = 0
var global_scene_instance: Node = null:
	set(resourse):
		global_scene_instance = resourse
		add_child(global_scene_instance)

signal keys_and_exam_updated  # Sinal para notificar mudanças na variável keys
var got_exam: int = 0:
	set(value):
		got_exam = value
		emit_signal("keys_and_exam_updated")

var keys: int = 0:
	set(value):
		keys = value
		emit_signal("keys_and_exam_updated")  # Dispara o sinal sempre que keys mudar

func reload_scene(body_path: NodePath):
	
	var augusto = get_node_or_null(body_path)
	var collision_shape = augusto.get_node_or_null("CollisionShape2D")
	collision_shape.queue_free()
	
	
	#Espera 2 segundos para dar reload
	await get_tree().create_timer(1.5).timeout 
	
	# Reset posições, chaves, exames e tentativas caixotes
	keys = 0  
	last_world_position = Vector2(0, 0)
	last_office_position = Vector2(0, 0)
	bin_tries = 0
	got_exam = 0
	
	#Recarrega cena
	get_tree().change_scene_to_file("res://scenes/game.tscn")
