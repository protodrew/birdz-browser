extends Node2D
var pressed = false
var start = Vector2.ZERO
var current = Vector2.ZERO
var dragging = false
onready var camera  = $Camera2D
func _ready():
	set_process_input(true)

func _process(_delta):
	if Input.is_action_just_pressed("click"):
		start = get_viewport().get_mouse_position()
	if Input.is_action_pressed("click"):
		current = (start - get_viewport().get_mouse_position())
		camera.position += Vector2(sign(current.x)*5,sign(current.y)*5)
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			dragging = true
		else:
			dragging = false
	elif event is InputEventMouseMotion and dragging:
		camera.position.x = move_toward(camera.position.x,get_global_mouse_position().x,1)
		camera.position.y = move_toward(camera.position.y,get_global_mouse_position().y,1)
