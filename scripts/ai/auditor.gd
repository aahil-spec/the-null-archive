extends CharacterBody3D


const SPEED = 2.5
@onready var nav_agent=$NavigationAgent3D
var current_target_node:Node3D=null
var home_position:Vector3
var is_sabotaging:bool=false

@onready var anim_player=$Model/AnimationPlayer
func _ready():
	home_position=global_position
	anim_player.play("SleepingIdle")
	
func investigate_location(target_node:Node3D):
	current_target_node=target_node
	nav_agent.target_position = target_node.global_position
	anim_player.play("Walking")
	
	
@warning_ignore("unused_parameter")
func _physics_process(delta):
	if is_sabotaging:
		return
	if nav_agent.is_navigation_finished() or global_position.distance_to(nav_agent.target_position)<1.5:
		if current_target_node!=null:
			sabotage_machine() 
		else:
			if anim_player.current_animation!="SleepingIdle":
				anim_player.play("SleepingIdle")
		return
	var current_location=global_position
	var next_location=nav_agent.get_next_path_position()
	var new_velocity=(next_location-current_location).normalized()*SPEED
	if new_velocity.length()>0.1:
		var look_target=Vector3(next_location.x,global_position.y,next_location.z)
		look_at(look_target,Vector3.UP)
	velocity=new_velocity
	move_and_slide()
func sabotage_machine():
	is_sabotaging=true
	anim_player.play("button")
	if current_target_node.has_method("power_off"):
		current_target_node.power_off()
	await anim_player.animation_finished
	is_sabotaging=false
	current_target_node=null
	nav_agent.target_position=home_position
	anim_player.play("Walking")
