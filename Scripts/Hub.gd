extends Node2D
onready var camera = $Camera2D
var pressed = false
var start = Vector2.ZERO
var current = Vector2.ZERO
var dragging = false
func _ready():
  set_process_input(true)

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			dragging = true
		else:
			dragging = false
	elif event is InputEventMouseMotion and dragging:
		camera.position.x = move_toward(camera.position.x,get_global_mouse_position().x,15)
		camera.position.y = move_toward(camera.position.y,get_global_mouse_position().y,15)
