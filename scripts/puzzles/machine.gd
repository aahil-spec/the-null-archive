extends StaticBody3D


@export var exit_door:Node3D
var is_powered:bool=false
var current_stage:int=0

@onready var anim_player=$Sketchfab_Scene/AnimationPlayer
func power_on():
	is_powered=true
	anim_player.play("Animation")
func interact():
	if not is_powered:
		return "ERROR: NO POWER> REQUIRES CASUAL ANCHOR."

	if current_stage<3:
		current_stage+=1
		
		if current_stage==3:
			if exit_door!=null:
				if exit_door.has_method("unlock"):
					exit_door.unlock()
			return "ALL STAGES LINKED. DOOR OPENED."
		return "MACHINE STAGE " + str(current_stage) + " ACTIVATED."
	return "MACHINE ALREADY ACTIVE."
func power_off():
	is_powered=false
	current_stage=0
	anim_player.stop()
