extends Node

var last_world_position = Vector2(0, 0)
var last_office_position = Vector2(0, 0)
var got_exam = false

signal keys_updated  # Sinal para notificar mudanças na variável keys

var keys: int = 0:
	set(value):
		keys = value
		emit_signal("keys_updated")  # Dispara o sinal sempre que keys mudar
