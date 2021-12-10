extends RichTextLabel

var sc = 0 #score counter
var st = 0 #score timer
var hs = 0 #highscore
func _ready():
	text = "Score: 0"

func reset():
	if sc > hs:
		hs = sc
		for child in get_parent().get_children():
			if child.name == "highscore":
				child.hs = hs
	text = "Score: 0"
	sc = 0

func _process(_delta):
	if get_parent().playing:
		if st <= 0:
			if name == "score":
				text = "Score: " + str(sc)
			sc += 1
			st = 20
		st -= 1;
