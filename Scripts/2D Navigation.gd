extends Node2D
var sfx

func _ready():
	sfx = $sfx
	
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
		door.loop = false; # disables looping
		sfx.set_stream(door) # adds the mouse sound to the audio player
		sfx.play()
		
		
	else:
		var page = "res://Sites/"+pgto+".tscn"
		print(page)
		
		clear()
		add_child(load(page).instance())

func clear():
	for child in get_children():
		if child.name.find("sfx") and child.name.find("Taskbar") == -1:
				print("removed " + child.name)
				self.remove_child(child)
		else:
			pass
		


func _on_sfx_finished():
	if sfx.stream == load("res://sfx/exit.ogg"):
		get_tree().quit()
