extends Node3D

@export var right_door:AnimatableBody3D
@export var left_door:AnimatableBody3D
@export var slide_distance:float=1.5

var is_open:bool=false

func open_door():
	if not is_open:
		is_open=true
		var tween=get_tree().create_tween()
		tween.set_parallel(true)
		tween.tween_property(right_door, "position", right_door.position + Vector3(slide_distance, 0, 0), 1.5)
		tween.tween_property(left_door,"position",left_door.position+Vector3(-slide_distance,0,0),1.5)
	
func close_door():
	if is_open:
		is_open=false
		var tween=get_tree().create_tween()
		tween.set_parallel(true)
		tween.tween_property(right_door,"position",right_door.position+Vector3(-slide_distance,0,0),0.5)
		tween.tween_property(left_door,"position",left_door.position+Vector3(slide_distance,0,0),0.5)
