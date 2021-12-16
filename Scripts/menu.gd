extends Node2D
onready var sprite = $StartMenu



func _on_link1_mouse_entered():
	sprite.frame = 1


func _on_link1_mouse_exited():
	sprite.frame = 0

func _on_link2_mouse_entered():
	sprite.frame = 2


func _on_link2_mouse_exited():
	sprite.frame = 0

func _on_link3_mouse_entered():
	sprite.frame = 3


func _on_link3_mouse_exited():
	sprite.frame = 0






