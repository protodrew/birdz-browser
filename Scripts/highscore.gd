extends RichTextLabel

var hs = 0;

func _process(delta):
	text = "Highscore: "+str(hs)
