extends Sprite
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	frame = rng.randi_range(0, 1)
	global_position = position


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		if frame == 0:
			get_parent().score += 1
			get_parent().remove_child(self)
		else:
			get_parent().lose()
