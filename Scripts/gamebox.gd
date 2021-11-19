extends Node2D


onready var playbutton = load("res://Scenes/playgame.tscn")
onready var asteroid = load("res://Scenes/asteroid.tscn")
onready var player = load("res://Scenes/player.tscn")

var playing = false
var spawn = true

func restart():
	add_child(player.instance())

func play():
	playing = true

func lose():
	playing = false
	for child in get_children():
		if child.name == "player" or "asteroid":
			child.queue_free()

func _process(delta):
	if Input.is_action_just_pressed("pause") and playing:
			add_child(playbutton.instance())
			playing = false
	
	if playing:
		if spawn:
			var size = rand_range(1,6)
			var enemies = []
			for i in enemies:
				enemies[i] = asteroid.instance()
				enemies[i].set_pos(Vector2(1200,rand_range(875,1200)))
			spawn = false;
		else:
			wait(1.5)
			spawn = true;
		$player.cancontrol = true
		
			
	else:
		if(get_node_or_null("res://Scenes/player.tscn")):
			$player.cancontrol = false

func wait(s):
	var t = Timer.new()
	t.set_wait_time(s)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
