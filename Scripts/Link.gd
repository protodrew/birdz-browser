extends Area2D



func _on_Link_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		print("Clicked")
