extends Area2D

onready var gamebox = self.get_parent()



func _on_play_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		gamebox.playing = true
		gamebox.remove_child(self)
