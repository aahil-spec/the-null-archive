extends AnimatableBody3D


var open_position:Vector3
var is_open:bool=false
func _ready():
	var start_position=global_position
	open_position=start_position+Vector3(2.0,0,0)
	InvestigationManager.puzzle_solved.connect(_on_puzzle_solved)
	
func _on_puzzle_solved():
	if not is_open:
		open_door()
		
func open_door():
	is_open=true
	var tween=get_tree().create_tween()
	tween.tween_property(self,"rotation_degrees",rotation_degrees+Vector3(0,78.8,0),2.0)
	var auditor=get_tree().get_root().find_child("Auditor",true,false)
	if auditor:
		auditor.investigate_location(self)
