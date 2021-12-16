extends Sprite
var rng = RandomNumberGenerator.new()
var removetime = 150
onready var dietime = 400 * get_parent().level
var clicked = false

func _ready():
	rng.randomize()
	frame = rng.randi_range(0, 13)
	global_position = position

func _process(_delta):
	dietime -= 1
	if dietime <= 0:
		if frame < 10:
			get_parent().lose()
		else:
			get_parent().score += 1
			get_parent().remove_child(self)
		
func _on_Area2D_input_event(viewport, event, shape_idx):
	
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		if frame < 10:
			get_parent().score += 1
			clicked = true
			get_parent().remove_child(self)
		else:
			get_parent().lose()
