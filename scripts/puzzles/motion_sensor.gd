extends Area3D

@export_group("Visuals Meshes")
@export var door_mesh_1:MeshInstance3D
@export var door_mesh_2:MeshInstance3D
@export_group("Invisible Walls")
@export var door_collision_1:Node3D

@export_group("Settings")
@export var slide_up_distance:float=2.5
@export var slide_direction:Vector3 =Vector3(0,0,200)
@export var speed:float=0.5


var mesh1_start:Vector3
var mesh2_start:Vector3
var col1_start:Vector3
var col2_start:Vector3

func _ready():
	if door_mesh_1:mesh1_start=door_mesh_1.global_position
	if door_mesh_2:mesh2_start=door_mesh_2.global_position
	if door_collision_1:col1_start=door_collision_1.global_position
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
func _on_body_entered(body:Node3D):
	if body.name=="Player" or body.name=="player":
		_animate_doors(true)
func _on_body_exited(body:Node3D):
	if body.name=="Player" or body.name=="player":
		_animate_doors(false)
		
func _animate_doors(is_opening:bool):
	var tween=get_tree().create_tween().set_parallel(true)
	var offset=Vector3(0,slide_up_distance,0)
	
	if door_mesh_1:
		tween.tween_property(door_mesh_1,"global_position",(mesh1_start+offset) if is_opening else mesh1_start,speed)
	if door_mesh_2:
		tween.tween_property(door_mesh_2,"global_position",(mesh2_start+offset) if is_opening else mesh2_start,speed)
	if door_collision_1:
		tween.tween_property(door_collision_1,"global_position",(col1_start+offset)if is_opening else col1_start,speed)
	
