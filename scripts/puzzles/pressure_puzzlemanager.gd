extends Node


@export var valve_1:StaticBody3D
@export var valve_2:StaticBody3D
@export var valve_3:StaticBody3D
@export var pressure_door:Node3D

var correct_sequence=[]
var current_step=0

func _ready():
	correct_sequence=[valve_1,valve_2,valve_3]
	valve_1.valve_turned.connect(_on_valve_turned)
	valve_2.valve_turned.connect(_on_valve_turned)
	valve_3.valve_turned.connect(_on_valve_turned)
	
func _on_valve_turned(valve_node,is_open):
	if not is_open:
		reset_puzzle()
		return
	if valve_node==correct_sequence[current_step]:
		current_step+=1
		show_message("Correct valve! Progress: "+str(current_step)+"/3")
		if current_step==correct_sequence.size():
			show_message("PUZZLE SOLVED: POWER RESTORED.")
			pressure_door.open_door()
	else:
		show_message("SYSTEM FAILURE: SEQUENCE INCORRECT.")
		pressure_door.close_door()
		await get_tree().create_timer(0.6).timeout
		reset_puzzle()
		
func reset_puzzle():
	current_step=0
	valve_1.force_close()
	valve_2.force_close()
	valve_3.force_close()
func show_message(text_to_show:String):
	var player=get_tree().get_root().find_child("Player",true,false)
	if player and player.has_method("show_system_message"):
		player.show_system_message(text_to_show)
