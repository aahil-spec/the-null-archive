extends AnimatableBody3D


@export var anim_player:AnimationPlayer
@export var door_animation_name:String="CINEMA_4D_Main"

var is_open:bool=false

func interact():
	if not is_open:
		is_open=true
		if anim_player and anim_player.has_animation(door_animation_name):
			anim_player.play(door_animation_name)
		for child in get_children():
			if child is CollisionShape3D:
				child.disabled=true
			return "ELEVATOR DOORS OPENED."
	else:
		return "DOORS ARE OPEN."
