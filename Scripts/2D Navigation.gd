extends Node2D


# This will be used to transfer pages to other pages in the 2D web sections of the game
func movepage(var pgto):
	
	var page = "res://Sites/"+pgto+".tscn"
	print(page)
	
	clear()
	add_child(load(page).instance())

func clear():
	for n in self.get_children(): # loops through all children of the 2D Navigation Scene
		self.remove_child(n) # removes child from tree
		
