extends StaticBody3D


var is_open:bool=false
@export var wheel:MeshInstance3D
signal valve_turned(valve_node,state)

func interact():
	is_open=!is_open
	var tween=get_tree().create_tween()
	if is_open:
		tween.tween_property(wheel,"rotation_degrees",wheel.rotation_degrees+Vector3(0,0,180),0.5)
		emit_signal("valve_turned",self,is_open)
		return ""
	else:
		tween.tween_property(wheel,"rotation_degrees",wheel.rotation_degrees-Vector3(0,0,180),0.5)
		emit_signal("valve_turned",self,is_open)
		return ""
func force_close():
	if is_open:
		is_open=false
		var tween=get_tree().create_tween()
		tween.tween_property(wheel,"rotation_degrees",wheel.rotation_degrees-Vector3(0,0,180),0.5)
