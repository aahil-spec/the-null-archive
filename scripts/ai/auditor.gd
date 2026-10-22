extends CharacterBody3D


const SPEED = 5.0
@onready var nav_agent=$NavigationAgent3D
var current_target_node:Node3D=null
var home_position:Vector3

func _ready():
	home_position=global_position
func investigate_location(target_node:Node3D):
	current_target_node=target_node
	nav_agent.target_position = target_node.global_position
	
	
@warning_ignore("unused_parameter")
func _physics_process(delta):
	if nav_agent.is_navigation_finished():
		if current_target_node!=null and current_target_node.has_method("power_off"):
			current_target_node.power_off()
			current_target_node=null
			nav_agent.target_position=home_position
		return
	var current_location=global_position
	var next_location=nav_agent.get_next_path_position()
	var new_velocity=(next_location-current_location).normalized()*SPEED
	velocity=new_velocity
	move_and_slide()
