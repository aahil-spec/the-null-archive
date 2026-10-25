extends AnimatableBody3D


@export var right_mesh:MeshInstance3D
@export var left_mesh:MeshInstance3D
@export var right_collision:CollisionShape3D
@export var left_collision:CollisionShape3D
@export var slide_distance:float=1.5

var is_open:bool=false

func open_door():
	if not is_open:
		is_open=true
		var tween=get_tree().create_tween()
		tween.set_parallel(true)
		tween.tween_property(right_mesh,"position",right_mesh.position+Vector3(slide_distance,0,0),1.5)
		tween.tween_property(right_collision,"position",right_collision.position+Vector3(slide_distance,0,0),1.5)
		
		tween.tween_property(left_mesh,"position",left_mesh.position+Vector3(-slide_distance,0,0),1.5)
		tween.tween_property(left_collision,"position",left_collision.position+Vector3(-slide_distance,0,0),1.5)
func close_door():
	if is_open:
		is_open=false
		var tween=get_tree().create_tween()
		tween.set_parallel(true)
		tween.tween_property(right_mesh,"position",right_mesh.position+Vector3(-slide_distance,0,0),0.5)
		tween.tween_property(right_collision,"position",right_collision.position+Vector3(-slide_distance,0,0),0.5)
		tween.tween_property(left_mesh,"position",left_mesh.position+Vector3(slide_distance,0,0),0.5)
		tween.tween_property(left_collision,"position",left_collision.position+Vector3(slide_distance,0,0),0.5)
