extends Control


@onready var item_list=$Panel/ItemList
@onready var connect_button=$Panel/Button
func _ready():
	hide()
	connect_button.pressed.connect(_on_connect_pressed)
	item_list.select_mode=ItemList.SELECT_MULTI
@warning_ignore("unused_parameter")

func _input(event):
	if Input.is_action_just_pressed("ui_focus_next"):
		if visible:
			close_loom()
		else:
			open_loom()
			
func open_loom():
	show()
	item_list.clear()
	for clue in InvestigationManager.collected_clues:
		item_list.add_item(clue)
	get_tree().paused=true
	Input.mouse_mode=Input.MOUSE_MODE_VISIBLE
func close_loom():
	hide()
	get_tree().paused=false
	Input.mouse_mode=Input.MOUSE_MODE_CAPTURED
func _on_connect_pressed():
	var selected_indices=item_list.get_selected_items()
	if selected_indices.size()==2:
		var clue1=item_list.get_item_text(selected_indices[0])
		var clue2=item_list.get_item_text(selected_indices[1])
		if (clue1=="Broken Terminal" and clue2=="Burnt Fuse") or (clue2=="Broken Terminal" and clue1=="Burnt Fuse"):
			InvestigationManager.puzzle_solved.emit() 
			close_loom()
		else:
			print("Invalid Causal Thread. These do not connect.")
