extends StaticBody3D

@export var anim_player:AnimationPlayer

@export var cover_collision:CollisionShape3D

var is_door_open:bool=false

func interact():
	if not is_door_open:
		
		is_door_open=true
		anim_player.play('open')
		if cover_collision:
			cover_collision.disabled=true
		return "BREAKER COVER OPENED."
