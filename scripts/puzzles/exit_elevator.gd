extends StaticBody3D


const NEXT_FLOOR_PATH="res://floor_3.tscn"

func interact():
	if InvestigationManager.has_level_3_key:
		var error=get_tree().change_scene_to_file(NEXT_FLOOR_PATH)
		if error!=OK:
			return "ERROR: COULD NOT LOAD NEXT FLOOR."
		return "ACCESS GRANTED: DESCENDING TO FLOOR 3..."
	else:
		return "ACCESS DENIED: LEVEL 3 KEY REQUIRED."
