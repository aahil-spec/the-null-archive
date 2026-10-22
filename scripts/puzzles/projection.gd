extends CSGSphere3D
@export var target_machine:Node3D
func _ready():
	hide()
	InvestigationManager.puzzle_solved.connect(reveal_projection)
	
func reveal_projection():
	show()
	
func interact():
	if visible and target_machine !=null:
		target_machine.power_on()
		queue_free()
		return "POWER ROUTED TO MACHINE."
	return ""
