extends Node

@warning_ignore("unused_signal")
signal puzzle_solved()
var collected_clues:Array[String]=[]
var has_level_3_key:bool=false
func add_clue(clue_name:String):
	if not clue_name in collected_clues:
		collected_clues.append(clue_name)
		print("Evidence stored: ", clue_name)
