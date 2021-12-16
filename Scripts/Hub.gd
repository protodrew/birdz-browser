extends Node2D
onready var camera = $Camera2D
var pressed = false
var start = Vector2.ZERO
var current = Vector2.ZERO
func _ready():
  set_process_input(true)

func _process(delta):
	if Input.is_action_just_pressed("click"):
		start = get_viewport().get_mouse_position()
	if Input.is_action_pressed("click"):
		current = (start - get_viewport().get_mouse_position())
		camera.position += Vector2(sign(current.x)*5,sign(current.y)*5)
