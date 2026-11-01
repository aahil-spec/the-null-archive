extends CanvasLayer


@onready var color_rect=$ColorRect

func _ready():
	color_rect.visible=false
	color_rect.modulate.a=0.0
	
func transition_to_scene(target_scene:String):
	color_rect.visible=true
	
	var tween_out=get_tree().create_tween()
	tween_out.tween_property(color_rect,"modulate:a",1.0,0.5)
	await tween_out.finished
	get_tree().change_scene_to_file(target_scene)
	var tween_in=get_tree().create_tween()
	tween_in.tween_property(color_rect,"modulate:a",0.0,0.5)
	await tween_in.finished
	color_rect.visible=false
