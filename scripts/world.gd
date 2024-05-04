extends Node3D

@export var hurdle: PackedScene

@onready var left_pointer = $Character/XROrigin3D/LeftHand/FunctionPointer
@onready var right_pointer = $Character/XROrigin3D/RightHand/FunctionPointer


func _ready() -> void:
	$Path3D/PathFollow3D/Hurdle/Plane/AnimationPlayer.play("Main")
	
func _physics_process(delta: float) -> void:
	const move_speed := 2.0
	$Path3D/PathFollow3D.progress += move_speed * delta
	if Globals.start_button == false:
		$Path3D/PathFollow3D.progress = 0.1
		$Menu.show()
	else:
		$Menu.hide()
	if Globals.pause_button == true:
		$PauseMenu.scale = Vector3(1, 1, 1)
		$PauseMenu.visible = true
	else:
		$PauseMenu.scale = Vector3(.001, .001, .001)
		$PauseMenu.visible = false
	if ($Menu.visible == true) or ($PauseMenu.visible == true):
		left_pointer.visible = true
		right_pointer.visible = true
	else:
		left_pointer.visible = false
		right_pointer.visible = false
	
func _on_hand_zone_area_entered(area: Area3D) -> void:
	if area == $Character/XROrigin3D/RightHand/Area3D:
		$HandZoneWarningRight.visible = true
		print("right hand in")
	if area == $Character/XROrigin3D/LeftHand/Area3D:
		$HandZoneWarningLeft.visible = true
		print("left hand in")

func _on_hand_zone_area_exited(area: Area3D) -> void:
	if area == $Character/XROrigin3D/RightHand/Area3D:
		$HandZoneWarningRight.visible = false
		print("right hand out")
	if area == $Character/XROrigin3D/LeftHand/Area3D:
		$HandZoneWarningLeft.visible = false
		print("left hand out")
		
func _on_rep_counter_area_entered(area: Area3D) -> void:
	Globals.reps += 1

func _on_left_hand_button_pressed(button) -> void:
	if button == "menu_button":
		Globals.start_button = false
		Globals.pause_button = true
