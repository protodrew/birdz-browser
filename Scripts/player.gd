extends KinematicBody2D


onready var cancontrol = false;
var movedir = 1
var vspeed = 150
var velocity =  Vector2.ZERO
func _process(delta):
	if cancontrol:
		if(Input.is_action_pressed("ui_up")):
			movedir = -1;
		elif(Input.is_action_pressed("ui_down")):
			movedir = 1;
		else:
			movedir = 0
		velocity = move_and_slide(Vector2(0,movedir * vspeed), Vector2(0, 0)).normalized()
