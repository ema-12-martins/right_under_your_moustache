extends Node

var last_world_position = Vector2(0, 0)
var last_office_position = Vector2(0, 0)

var elipsed_time_in_seconds = 0
var time_mutex = Mutex.new()

var bin_tries = 0
var global_scene_instance: Node = null:
	set(resourse):
		global_scene_instance = resourse
		add_child(global_scene_instance)
		
var global_music_instance: Node = null:
	set(resourse):
		global_scene_instance = resourse
		add_child(global_scene_instance)
		
var best_time = 1000000000000000000

signal keys_and_exam_updated  # Sinal para notificar mudanças na variável keys
var got_exam: int = 0:
	set(value):
		got_exam = value
		emit_signal("keys_and_exam_updated")

var keys: int = 0:
	set(value):
		keys = value
		emit_signal("keys_and_exam_updated")  # Dispara o sinal sempre que keys mudar

func replay():
	
	# Reset posições, chaves, exames e tentativas caixotes
	keys = 0  
	last_world_position = Vector2(0, 0)
	last_office_position = Vector2(0, 0)
	bin_tries = 0
	got_exam = 0
	
	time_mutex.lock()
	Global.elipsed_time_in_seconds = 0
	time_mutex.unlock()
	
	await get_tree().create_timer(0.2).timeout
	
	#Recarrega cena
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	
	
func reload_scene(body_path: NodePath):
	
	var augusto = get_node_or_null(body_path)
	
	# To not move
	augusto.SPEED = 0
	
	# To fall
	var collision_shape = augusto.get_node_or_null("CollisionShape2D")
	collision_shape.queue_free()
	
	
	#Time do die
	await get_tree().create_timer(1).timeout 
	
	# Reset posições, chaves, exames e tentativas caixotes
	keys = 0  
	last_world_position = Vector2(0, 0)
	last_office_position = Vector2(0, 0)
	bin_tries = 0
	got_exam = 0
	
	#Recarrega cena
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	
	#Reset the time
	time_mutex.lock()
	Global.elipsed_time_in_seconds = -1
	time_mutex.unlock()
