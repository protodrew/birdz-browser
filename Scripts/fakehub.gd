extends Node2D


func _ready():
	var d = Dialogic.start('intro2')
	add_child(d)
	d.connect("timeline_end",self,'movepage')

func movepage(_arg):
	get_parent().movepage("hub")
