extends Light2D

const ROT_SPEED = 1

func _process(delta):
	rotation_degrees += rand_range(0, ROT_SPEED) * delta
	pass
