extends CharacterBody2D


const SPEED = 150
const JUMP_VELOCITY = -300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if direction < 0: 
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
		if velocity.y == 0:
			$AnimatedSprite2D.play("walk")
		elif velocity.y < 0:
			$AnimatedSprite2D.play("jump")	
		elif velocity.y > 0:
			$AnimatedSprite2D.play("fall")	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			$AnimatedSprite2D.play("idle")
		elif velocity.y < 0:
			$AnimatedSprite2D.play("jump")	
		elif velocity.y > 0:
			$AnimatedSprite2D.play("fall")
		
	move_and_slide()
