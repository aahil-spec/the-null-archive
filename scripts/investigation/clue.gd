extends StaticBody3D
@export_enum("Imprint","Sound") var clue_type:String="Imprint"
@export var clue_name:String="Broken Terminal"

var has_been_scanned:bool=false
func interact():
	if not has_been_scanned:
		has_been_scanned=true
		InvestigationManager.add_clue(clue_name)
		return "TRACE LOGGED:" + clue_name
	else:
		return "TRACE ALREADY LOGGED."
