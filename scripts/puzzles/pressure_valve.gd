extends StaticBody3D


var is_open:bool=false
@export var wheel:MeshInstance3D

func interact():
	is_open=!is_open
	var tween=get_tree().create_tween()
	if is_open:
		tween.tween_property(wheel,"rotation_degrees",wheel.rotation_degrees+Vector3(0,0,180),0.5)
		get_node("../PressureDoor").open_door()
		return "VALVE OPENED: PRESSURE RELEASING."
	else:
		tween.tween_property(wheel,"rotation_degrees",wheel.rotation_degrees-Vector3(0,0,180),0.5)
		return "VALVE CLOSED: PRESSURE BUILDING."
