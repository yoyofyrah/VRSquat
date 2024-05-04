extends Control

func _on_resume_button_pressed() -> void:
	#await get_tree().create_timer(0.3).timeout
	Globals.start_button = true
	Globals.pause_button = false

func _on_back_to_home_button_pressed() -> void:
	#await get_tree().create_timer(0.3).timeout
	Globals.reps = 0
	Globals.start_button = false
	Globals.pause_button = false

