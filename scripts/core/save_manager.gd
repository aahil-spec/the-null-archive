extends Node


const SAVE_PATH="user://null_archive_save.dat"

var game_state={
	"current_floor":"res://scenes/floors/floor1.scn",
	"collected_clues":[],
	"solved_puzzles":{
		"floor_3_power":false,
		"floor_4_acoustics":false,
		"floor_5_human_factors":false
	}
}
func _ready():
	load_game()
func save_game():
	var file=FileAccess.open(SAVE_PATH,FileAccess.WRITE)
	if file:
		file.store_var(game_state)
		print("SYSTEM: Game state saved to disk.")
	else:
		print("ERROR: Failed to save game.")
		
func load_game():
	if FileAccess.file_exists(SAVE_PATH):
		var file=FileAccess.open(SAVE_PATH,FileAccess.READ)
		if file:
			game_state=file.get_var()
			print("SYSTEM: Game state loaded from disk.")
			return true
	print("SYSTEM: No save file found. Starting fresh.")
	return false
