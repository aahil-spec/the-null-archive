extends StaticBody3D


@export_file("*.scn") var target_floor_scene:String
@export var action_text:String="MOVING"

@export var anim_player:AnimationPlayer
@export var door_animation_name:String="CINEMA_4D_Main"
func interact():
	if target_floor_scene!="":
		if anim_player and anim_player.has_animation(door_animation_name):
			anim_player.play(door_animation_name)
			await anim_player.animation_finished
			
		get_tree().change_scene_to_file(target_floor_scene)
		
		return "ELEVATOR: " + action_text
	else:
		return "ACCESS DENIED: DESTINATION UNAVAILABLE."
