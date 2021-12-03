extends Node2D
onready var sfx = $sfx
onready var url = $url
	
# This will be used to transfer pages to other pages in the 2D web sections of the game
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		var index = int(rand_range(1,4))
		var click = load("res://sfx/mouse"+str(index)+".ogg") # loads the mouse sound we are going to use for this click
		click.loop = false; # disables looping
		sfx.set_stream(click) # adds the mouse sound to the audio player
		sfx.play() # plays the mouse sound

func movepage(var pgto):
	 
	if pgto == "exit":
		
		var door = load("res://sfx/exit.ogg")
		door.loop = false;
		sfx.set_stream(door)
		sfx.play()
		
		
	else:
		var page = "res://Scenes/Sites/"+pgto+".tscn"
		print(page)
		clear()
		url.set_text("https://"+pgto+".bird")
		add_child(load(page).instance())

func clear():
	for child in get_children(): # parses through all children
		if !child.is_in_group("keep"): # passes over all of the nodes we don't want to remove
				self.remove_child(child) # removes the rest
		


func _on_sfx_finished():
	if sfx.stream == load("res://sfx/exit.ogg"):
		get_tree().quit()
