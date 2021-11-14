extends Camera2D


func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_WHEEL_UP and (self.position.y - 100) > self.limit_top:
				self.position.y -= 100

			if event.button_index == BUTTON_WHEEL_DOWN and (self.position.y + 100) < self.limit_bottom:
				self.position.y += 100
	
