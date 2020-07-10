extends Node2D

export var distance = 100
export var speed = 100

var start = Vector2()
var up = true

func _ready():
	speed += rand_range(-speed / 5, speed / 5)
	start = self.position
	self.position = Vector2(self.position.x, self.position.y + rand_range(-distance, distance))
	pass

func _process(delta):
	if up:
		self.position.y += speed * delta
	else:
		self.position.y -= speed * delta
	if up and self.position.y > start.y + distance:
		up = false
	if not up and self.position.y < start.y - distance:
		up = true
	pass
