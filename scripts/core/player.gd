extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var gravity=ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var head=$Head
@onready var raycast=$Head/Camera3D/RayCast3D
@onready var crosshair=$HUD/Crosshair
@onready var message=$HUD/Message

func _ready():
	Input.mouse_mode=Input.MOUSE_MODE_CAPTURED
	hide()
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x*0.005)
		head.rotate_x(-event.relative.y*0.005)
		head.rotation.x=clamp(head.rotation.x,deg_to_rad(-80),deg_to_rad(80))
func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity* delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir = Input.get_vector("move_left","move_right","move_forward","move_backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
@warning_ignore("unused_parameter")
func _process(delta):
	crosshair.text="+"
	if raycast.is_colliding():
		var target=raycast.get_collider()
		if target.has_method("interact"):
			crosshair.text="[E] Interact"
			if Input.is_action_just_pressed("interact"):
				if "clue_name" in target:
					message.text="SCAN IMPRINT:"+target.clue_name
				else:
					message.text="GHOST SWITCH ACTIVATED"
				target.interact()
