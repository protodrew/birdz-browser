extends TextureRect


export(float) var scroll_speed = 0.4

func _process(delta):
	if get_parent().get_parent().playing:
		self.material.set_shader_param("scroll_speed", scroll_speed)
	else:
		self.material.set_shader_param("scroll_speed", 0)
