extends StaticBody3D


@export var blue_button:Node3D
@export var level_lights:Array[Light3D]

var is_powered_on:bool=false

func interact():
	if not is_powered_on:
		is_powered_on=true
		var tween=get_tree().create_tween()
		tween.tween_property(blue_button,"rotation_degrees:x",-10.0,0.4)
		for light in level_lights:
			if light:
				light.visible=true
		return "MAIN BREAKER ENGAGED: FACILITY POWER RESTORED."
	else:
		return "SYSTEM OPTIMAL. POWER ALREADY RESTORED."
