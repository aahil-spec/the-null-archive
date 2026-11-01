extends Node

@warning_ignore("unused_signal")
signal puzzle_solved()
@warning_ignore("unused_signal")
signal acoustics_puzzle_solved
@warning_ignore("unused_signal")
signal human_factors_solved
var collected_clues:Array[String]=[]
var has_level_3_key:bool=false
func _ready():
	acoustics_puzzle_solved.connect(_on_acoustics_solved)
	human_factors_solved.connect(_on_human_factors_solved)
	
func _on_acoustics_solved():
	SaveManager.game_state ["solved_puzzles"]["floor_4_acoustics"]=true
	SaveManager.save_game()
	
func _on_human_factors_solved():
	SaveManager.game_state["solved_puzzles"]["floor_5_human_factors"]=true
	SaveManager.save_game()  
func add_clue(clue_name:String):
	if not clue_name in collected_clues:
		collected_clues.append(clue_name)
		print("Evidence stored: ", clue_name)
