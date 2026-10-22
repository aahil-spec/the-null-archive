extends CSGSphere3D
@export var target_machine:Node3D
func _ready():
	hide()
	InvestigationManager.puzzle_solved.connect(reveal_projection)
	
func reveal_projection():
	show()
	
func interact():
	if visible and target_machine !=null:
		if target_machine.is_powered:
			return "POWER ALREADY ROUTED."
			
		target_machine.power_on()
		var auditor=get_tree().get_root().find_child("Auditor",true,false)
		if auditor:
			auditor.investigate_location(target_machine)
		return "POWER ROUTED TO MACHINE. WARNING: DISTURBANCE DETECTED."
	return ""
