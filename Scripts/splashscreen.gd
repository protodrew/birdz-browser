extends Node2D


func _on_VideoPlayer_finished():
	get_parent().movepage("menu")

func _process(_delta):
	if Input.is_action_pressed("skip"):
		get_parent().movepage("menu")
