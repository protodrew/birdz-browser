extends Node2D


onready var celestial_gamebox = load("res://Scenes/celestial gamebox.tscn")


func reset_game():
	var children = self.get_children()
	for i in children:
		if children[i].name == "celestial gamebox":
			remove_child(i)
	add_child(celestial_gamebox.instance())
