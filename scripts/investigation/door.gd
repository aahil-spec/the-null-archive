extends StaticBody3D

var is_locked:bool=true
var is_open:bool=false

func unlock():
	is_locked=false
	
func interact():
	if is_locked:
		return "ACCESS DENIED: ARCHIVE DOOR LOCKED."
	elif not is_open:
		is_open=true
		open_door()
		return "ACCESS GRANTED. DOOR OPENING."
	else:
		return "DOOR IS ALREADY OPEN."
func open_door():
	
	var tween=get_tree().create_tween()
	tween.tween_property(self,"rotation_degrees",rotation_degrees+Vector3(0,78.8,0),2.0)
