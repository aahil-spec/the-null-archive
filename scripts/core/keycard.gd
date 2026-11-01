extends StaticBody3D

@export var key_name:String= "Floor 2 Keycard"

func interact():
	var player=get_tree().get_root().find_child("Player",true ,false)
	if player==null:
		player=get_tree().get_root().find_child("player",true,false)
	if player==null:
		return "ERROR: PLAYER NODE NOT FOUND."
	if not "inventory" in player:
		return "ERROR: INVENTORY VARIABLE MISSING."
	if not key_name in player.inventory:
		player.inventory.append(key_name)
		for child in get_children():
			if child is CollisionShape3D:
				child.set_deferred("disabled",true)
		queue_free()
		return "ACQUIRED: " + key_name.to_upper()
		
	return "ALREADY ACQUIRED."
