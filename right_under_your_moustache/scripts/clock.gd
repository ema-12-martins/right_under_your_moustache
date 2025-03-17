extends Node2D

@onready var label: Label = $Label

var inside_area = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "augusto":
		inside_area = true
		label.visible = true

func _process(_delta: float) -> void:
	if inside_area and Input.is_action_just_pressed("ui_accept"):  # 'ui_accept' == Enter key
		Global.time_mutex.lock()
		Global.elipsed_time_in_seconds -= 10
		Global.time_mutex.unlock()
		
		# Create a label to display "-10s"
		var time_label = Label.new()
		time_label.text = "-10s"
		time_label.add_theme_color_override("font_color", Color.RED) 
		time_label.add_theme_font_size_override("font_size", 36)
		time_label.set_position(global_position + Vector2(0, -150)) 
		get_parent().add_child(time_label) 
		
		#Remove clock
		queue_free()
		
		# Wait 3 seconds before removing the label
		await get_tree().create_timer(1).timeout  
		time_label.queue_free() 
