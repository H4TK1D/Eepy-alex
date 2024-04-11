extends CharacterBody2D


const SPEED = 150
const JUMP_VELOCITY = -400.0
var ScreenSize;

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	ScreenSize = get_viewport_rect().size

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.s
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
		#Play jump animation

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
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
		
	#position = position.clamp(Vector2.ZERO, ScreenSize) Change to fit game
	move_and_slide()
