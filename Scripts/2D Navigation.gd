extends Node2D
onready var sfx = $sfx
onready var music = $music
onready var url = $url
onready var last = ["hub"]
var index = 0;
var drgmove = false
# This will be used to transfer pages to other pages in the 2D web sections of the game

func _ready():
	movepage("hub")

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		var snd = int(rand_range(1,4))
		playsfx("mouse"+str(snd))

func movepage(var pgto):
	pgto = pgto.to_lower()
	match (pgto):
		"exit":
			playsfx("exit")
		"back":
			if index+1 <= last.size()-1:
				var page = "res://Scenes/Sites/"+last[index+1]+".tscn"
				url.set_text("https://"+last[index+1]+".bird")
				index += 1
				clear()
				add_child(load(page).instance())
				playmus(pgto)
		_:
			var page = "res://Scenes/Sites/"+pgto+".tscn"
			last.push_front(pgto)
			clear()
			url.set_text("https://"+pgto+".bird")
			add_child(load(page).instance())
			playmus(pgto)
		
func playmus(pgto):
	var song = load("res://music/" + pgto.to_lower() + ".ogg")
	music.set_stream(song)
	music.play()

func playsfx(sound):
	sound = load("res://sfx/" + sound + ".ogg")
	sound.loop = false;
	sfx.set_stream(sound)
	sfx.play()

func clear():
	for child in get_children(): # parses through all children
		if !child.is_in_group("keep"): # passes over all of the nodes we don't want to remove
				self.remove_child(child) # removes the rest

func _on_sfx_finished():
	if sfx.stream == load("res://sfx/exit.ogg"):
		get_tree().quit()
