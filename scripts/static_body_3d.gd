extends StaticBody3D


@export var anim_player:AnimationPlayer
@export var door_animation_name:String="CINEMA_4D_Main"
@export var left_door_collision:CollisionShape3D
@export var right_door_collision:CollisionShape3D

var is_open:bool=false

func interact():
	if not is_open:
		is_open=true
		if anim_player and anim_player.has_animation(door_animation_name):
			anim_player.play(door_animation_name)
		if left_door_collision:
			left_door_collision.disabled=true
		if right_door_collision:
			right_door_collision.disabled=true
		return "ELEVATOR DOORS OPENED."
	else:
		return "DOORS ARE OPEN."
