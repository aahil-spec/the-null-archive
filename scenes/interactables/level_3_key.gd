extends StaticBody3D


func interact():
	InvestigationManager.has_level_3_key=true
	queue_free()
	return "ITEM ACQUIRED: LEVEL 3 ACCESS DRIVE."
