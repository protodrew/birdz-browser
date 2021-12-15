extends Area2D
var rng = RandomNumberGenerator.new()
onready var sprite = $Sprite
func _ready():
	sprite.frame = rng.randi_range(0, 3)
	global_position = position
func _on_Area2D_body_entered(body):
	if "player" in body.name:
		self.get_parent().lose()
	

func _process(_delta):
	if get_parent().playing:
		position.x -= 5;
		if position.x <= 25:
			queue_free() # removes self from node




