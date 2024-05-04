extends Control

func _on_start_button_pressed() -> void:
	Globals.start_button = true
	Globals.reps = 0
	Globals.lives = 3
	
func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_music_button_toggled(toggled_on: bool) -> void:
	if toggled_on == false:
		$MusicButton.text = "Music : on"
		$Music.play()
	if toggled_on == true:
		$MusicButton.text = "Music : off"
		$Music.stop()
