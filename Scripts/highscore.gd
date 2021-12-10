extends RichTextLabel

var hs = 0;

func _process(_delta):
	text = "Highscore: "+str(hs)
