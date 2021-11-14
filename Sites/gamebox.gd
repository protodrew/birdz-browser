extends Node2D

onready var player = $player
var playing = false

func play():
	playing = true
	
func _process(delta):
	if playing == true:
		pass
		
