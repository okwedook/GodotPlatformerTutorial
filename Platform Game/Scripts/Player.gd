extends KinematicBody2D

const FLOOR = Vector2(0, -1)
const SPEEDX = 40
const MAXSPEED = 300
const JUMP = 1000
const ZERO = Vector2(0, 0)
const GRAV = 50

var speed = Vector2(0, 0)

func _process(delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	if Input.is_action_pressed("ui_right"):
		speed.x = min(speed.x + SPEEDX, MAXSPEED)
		$Sprites.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		speed.x = max(speed.x - SPEEDX, -MAXSPEED)
		$Sprites.flip_h = true
	else:
		if abs(speed.x) > SPEEDX:
			speed.x -= SPEEDX * sign(speed.x)
		else:
			speed.x = 0
		
	
	if is_on_floor():
		speed.y = 0
		if Input.is_action_pressed("ui_up"):
			speed.y = -JUMP
		if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
			$Sprites.play("run")
		else:
			$Sprites.play("idle")
	else:
		if speed.y < 0:
			$Sprites.play("jump")
		else:
			$Sprites.play("fall")
			
	if position.y > 10000:
		get_tree().reload_current_scene()
		print("FUCK")
	speed.y += GRAV
	move_and_slide(speed, FLOOR)
	pass
