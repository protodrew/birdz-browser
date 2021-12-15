extends Node2D
var playing = false
onready var playbutton = load("res://Scenes/playgame.tscn")
onready var target = load("res://Scenes/target.tscn")
var rng = RandomNumberGenerator.new()
var level = 1
var timer = 0
var score = 0
var stage = 0
func play():
	playing = true

func lose():
	for child in get_children():
		if !child.is_in_group("keep"):
			child.queue_free()
	playing = false
	level = 1
	timer = 0
	stage = 0
	print(score)
	score = 0
	add_child(playbutton.instance())

func _process(_delta):
	if Input.is_action_just_pressed("pause") and playing:
			add_child(playbutton.instance())
			playing = false
	
	if playing:
		timer -= 1
		if timer <= 0:
			rng.randomize()
			var targetn = target.instance()
			add_child(targetn)
			targetn.position = Vector2(rng.randi_range(60,1120),rng.randi_range(60, 420))
			timer = int(150 * level)
			stage += 1
		if stage >= 3:
			stage = 0
			level -= 0.05
