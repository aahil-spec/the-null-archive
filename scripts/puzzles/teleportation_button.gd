extends StaticBody3D


const NEXT_FLOOR_PATH="res://scenes/floors/floor_2.tscn"

func interact():
	var error =get_tree().change_scene_to_file(NEXT_FLOOR_PATH)
	if error!=OK:
		return "ERROR: COULD NOT LOAD NEXT FLOOR."
	return "ACCESS GRANTED: DESCENDING..."
