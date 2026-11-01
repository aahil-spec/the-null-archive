extends Node3D

func _ready():
	InvestigationManager.human_factors_solved.connect(_open_secret_route)
	
func _open_secret_route():
	var tween=get_tree().create_tween()
	tween.tween_property(self,"position:y",position.y--10.0,1.5)
