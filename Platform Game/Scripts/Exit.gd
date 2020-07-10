extends Area2D

export(String, FILE, "*.tscn") var next_scene
const ROTATING_SPEED = 100

func _process(delta):
	self.rotation += rand_range(0, ROTATING_SPEED * delta)


func _on_Exit_body_entered(body):
	get_tree().change_scene(next_scene)
