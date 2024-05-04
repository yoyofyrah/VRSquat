extends Control


func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	$Label.text = str(Globals.reps)
	if Globals.lives == 2:
		$Life1.hide()
	if Globals.lives == 1:
		$Life2.hide()
	if Globals.lives == 0:
		$Life3.hide()
		Globals.start_button = false
	if Globals.lives == 3:
		$Life1.show()
		$Life2.show()
		$Life3.show()
