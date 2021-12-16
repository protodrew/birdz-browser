extends Camera2D

var scrollpos
var drag = false
func _ready():
	for x in get_parent().get_groups():
		if x == "drag":
			drag = true
	if limit_bottom > 720 and drag == false:
		var scrollbar = add_child(load("res://Scenes/WebTemplates/Scrollbar.tscn").instance())
func _process(_delta):
	if get_child_count() > 0:
		var scrollbar = self.get_child(0)
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_WHEEL_UP and (self.position.y - 100) > self.limit_top:
				self.position.y -= 50

			if event.button_index == BUTTON_WHEEL_DOWN and (self.position.y + 100) < self.limit_bottom:
				self.position.y += 50
	
