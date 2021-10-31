extends Area2D
# a simple script that allows a custom event to execute when the area2D defined is clicked

onready var navhandler = self.get_parent().get_parent(); # moves 2 levels up in the hierarchy to interact with the next level
# TODO the implementation was broken somehow, will fix after dinner
func _on_Link_input_event(_viewport, event, _shape_idx): # underscores mean it won't throw errors
	if (event is InputEventMouseButton && event.pressed): # ensures we are inside the area and clicking
		print("clicked")
