extends Node2D


func _on_KinematicBody2D_body_entered(body):
	if body.name == "player":
		self.get_parent().lose()

func _process(_delta):
	if get_parent().playing:
		position.x -= 1

