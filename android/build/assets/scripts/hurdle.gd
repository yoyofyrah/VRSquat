extends Node3D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Globals.lives == 3 or 2 or 1:
		$".".show()

func _on_hitbox_area_entered(area: Area3D) -> void:
	Globals.lives -= 1
	if Globals.lives == 0:
		$"..".loop = false
		$".".hide()
	if Globals.lives >= 0:
		$"..".loop = true
	print(Globals.lives)
