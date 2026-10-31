extends StaticBody3D

@export var anim_player:AnimationPlayer

var is_door_open:bool=false

func interact():
	is_door_open=!is_door_open
	if is_door_open:
		anim_player.play("open")
		return "BREAKER COVER OPENED."
