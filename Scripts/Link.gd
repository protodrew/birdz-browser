extends Node2D
# a simple script that allows a custom event to execute when the area2D defined is clicked

onready var navhandler = self.get_parent().get_parent() # moves 2 levels up in the hierarchy to interact with the next level
onready var collider = $Area2D
onready var groups = self.get_groups()


func _on_Area2D_input_event(_viewport, event, _shape_idx): # underscores mean it won't throw errors
	if (event is InputEventMouseButton && event.pressed): # ensures we are inside the area and clicking
		var moved = false
		for index in groups.size():
			if "page" in groups[index]:
				navhandler.movepage(groups[index].substr(5))
				moved = true
		if !moved:
			print("error no page group")
