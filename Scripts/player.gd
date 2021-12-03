extends KinematicBody2D


onready var cancontrol = false;
var movedir = 1
var movehoriz = 0;
var vspeed = 150
var velocity =  Vector2.ZERO


func _process(delta):
	
	cancontrol = get_parent().playing
	
	if cancontrol:
		if(Input.is_action_pressed("ui_up")):
			movedir = -1
		elif(Input.is_action_pressed("ui_down")):
			movedir = 1
		else:
			movedir = 0
		if(Input.is_action_pressed("ui_right") and position.x < 580):
			movehoriz = 100
		else:
			movehoriz = 0
		velocity = move_and_slide(Vector2(movehoriz,movedir * vspeed), Vector2(0, 0))
		if(position.x > -48 && movehoriz == 0):
			position.x -= .1
