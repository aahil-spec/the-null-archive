extends CSGSphere3D
@export var exit_door:Node3D
func _ready():
	hide()
	InvestigationManager.puzzle_solved.connect(reveal_projection)
	
func reveal_projection():
	show()
	
func interact():
	if visible and exit_door !=null:
		exit_door.queue_free()
		queue_free()
