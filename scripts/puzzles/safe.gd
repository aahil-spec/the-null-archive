extends Node3D

func _ready():
	InvestigationManager.human_factors_solved.connect(_open_secret_route)
	if SaveManager.game_state["solved_puzzles"]["floor_5_human_factors"]==true:
		position.y-=4.0
		
func _open_secret_route():
	print("Contradiction resolved: Opening secret route!")
	var tween=get_tree().create_tween()
	tween.tween_property(self,"position:y",position.y-4.0,1.5)
	visible=true
	print("Floor 5 Puzzle Solved! Route unlocked.")
