extends RichTextLabel

var sc = 0000000

func _process(delta):
	text = "Score: " + str(sc)
	sc += 1
