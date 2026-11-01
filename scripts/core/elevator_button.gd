extends StaticBody3D


@export_file("*.scn") var target_floor_scene:String
@export var action_text:String="MOVING"

@export var anim_player:AnimationPlayer
@export var door_animation_name:String="CINEMA_4D_Main"
func interact():
	if target_floor_scene!="":
		_travel_sequence()
		return "ELEVATOR: " + action_text
	else:
		return "ACCESS DENIED: DESTINATION UNAVAILABLE."
		
func _travel_sequence():
	if anim_player and anim_player.has_animation(door_animation_name):
		anim_player.play_backwards(door_animation_name)
		var anim_length=anim_player.get_animation(door_animation_name).length
		var wait_time=max(0,0,anim_length-0.5)
		if wait_time>0:
			await get_tree().create_timer(wait_time).timeout
	TransitionScreen.transition_to_scene(target_floor_scene)
