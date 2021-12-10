extends Area2D

onready var gamebox = self.get_parent()


func _ready():
	position.x = 589
	position.y = 227
	
func _on_play_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton and event.pressed and event.button_index == 1):
		gamebox.play()
		gamebox.playing = true
		gamebox.remove_child(self)
