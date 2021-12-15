extends Node2D


onready var playbutton = load("res://Scenes/playgame.tscn")
onready var asteroid = load("res://Scenes/asteroid.tscn")
onready var player = load("res://Scenes/player.tscn")
var playing = false
var spawn = 0
var rng = RandomNumberGenerator.new()
var highscore;
onready var score = $score

func play():
	playing = true

func lose():
	for child in get_children():
		if !child.is_in_group("keep"):
			print("removed: " + child.name)
			child.queue_free()
	score.reset()
	playing = false
	add_child(player.instance())
	add_child(playbutton.instance())

func _process(_delta):
	if Input.is_action_just_pressed("pause") and playing:
			add_child(playbutton.instance())
			playing = false
	
	if playing:
		var lvl = 1.1;
		if spawn <= 0:
			rng.randomize()
			var asteroidn = asteroid.instance()
			add_child(asteroidn)
			asteroidn.position = Vector2(1100,rng.randi_range(75, 444))
			spawn = 200 * lvl
			lvl += .1
		
		spawn -= 1
