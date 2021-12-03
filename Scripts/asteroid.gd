extends Area2D

func _ready():
	global_position = position
func _on_Area2D_body_entered(body):
	if "player" in body.name:
		self.get_parent().lose()
	

func _process(_delta):
	if get_parent().playing:
		position.x -= 5;
		if position.x <= 25:
			queue_free() # removes self from node




